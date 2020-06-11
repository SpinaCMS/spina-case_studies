# frozen_string_literal: true

module Spina
  module Admin
    module CaseStudies
      # Spina::Admin::CaseStudies::CaseStudiesController
      class CaseStudiesController < ::Spina::Admin::AdminController
        before_action :set_breadcrumb
        before_action :set_tabs, only: %i[new create edit update]
        before_action :set_locale

        layout 'spina/admin/case_studies'

        helper Spina::CaseStudies::AdminHelper

        def index
          @case_studies = Spina::CaseStudies::CaseStudy.order(:title)
          @case_studies = @case_studies.live unless current_spina_user
        end

        def new
          @case_study = Spina::CaseStudies::CaseStudy.new
          add_breadcrumb I18n.t('spina.case_studies.case_studies.new')
          render layout: 'spina/admin/admin'
        end

        def create
          @case_study = Spina::CaseStudies::CaseStudy.new resource_params

          if @case_study.save
            redirect_to spina.admin_case_studies_case_studies_path,
                        notice: t('spina.case_studies.case_studies.saved')
          else
            add_breadcrumb I18n.t('spina.case_studies.case_studies.new')
            render :new, layout: 'spina/admin/admin'
          end
        end

        def edit
          @case_study = Spina::CaseStudies::CaseStudy.find params[:id]
          add_breadcrumb @case_study.title
          render layout: 'spina/admin/admin'
        end

        def update
          @case_study = Spina::CaseStudies::CaseStudy.find params[:id]

          if @case_study.update_attributes resource_params
            redirect_to spina.admin_case_studies_case_studies_path,
                        notice: t('spina.case_studies.case_studies.saved')
          else
            add_breadcrumb @case_study.title
            render :edit, layout: 'spina/admin/admin'
          end
        end

        def destroy
          @case_study = Spina::CaseStudies::CaseStudy.find params[:id]
          @case_study.destroy
          redirect_to spina.admin_case_studies_case_studies_path,
                      notice: t('spina.case_studies.case_studies.destroyed')
        end

        private

        def set_breadcrumb
          add_breadcrumb I18n.t('spina.case_studies.case_studies.title'),
                         spina.admin_case_studies_case_studies_path
        end

        def set_tabs
          @tabs = %w[case_study_content case_study_seo case_study_advanced]
        end

        def set_locale
          @locale = params[:locale] || I18n.default_locale
        end

        def resource_params
          params.require(:case_study).permit(
            :title, :intro, :image_id, :seo_title, :description, :draft,
            case_study_parts_attributes: %i[
              id title position content image_id alignment _destroy
            ],
            testimonial_attributes: %i[
              id name company job_title content image_id
            ]
          )
        end
      end
    end
  end
end
