# frozen_string_literal: true

module Spina
  module Admin
    module CaseStudies
      # Spina::Admin::CaseStudies::CaseStudiesController
      class CaseStudiesController < ::Spina::Admin::AdminController
        before_action :set_breadcrumb
        before_action :set_tabs, only: %i[new create edit update]
        before_action :set_locale

        admin_section :case_studies

        helper Spina::CaseStudies::AdminHelper

        def index
          @case_studies = Spina::CaseStudies::CaseStudy.order(:title)
        end

        def live
          @case_studies = Spina::CaseStudies::CaseStudy.order(:title).live
          render :index
        end

        def draft
          @case_studies = Spina::CaseStudies::CaseStudy.order(:title).draft
          render :index
        end

        def new
          @case_study = Spina::CaseStudies::CaseStudy.new
          add_breadcrumb I18n.t('spina.case_studies.case_studies.new')
        end

        def create
          @case_study = Spina::CaseStudies::CaseStudy.new resource_params

          if @case_study.save
            redirect_to spina.admin_case_studies_case_studies_path,
                        notice: t('spina.case_studies.case_studies.saved')
          else
            add_breadcrumb I18n.t('spina.case_studies.case_studies.new')
            render :new, status: :unprocessable_entity
          end
        end

        def edit
          @case_study = Spina::CaseStudies::CaseStudy.find params[:id]
          add_breadcrumb @case_study.title
        end

        def update
          @case_study = Spina::CaseStudies::CaseStudy.find params[:id]

          if @case_study.update resource_params
            redirect_to spina.admin_case_studies_case_studies_path,
                        notice: t('spina.case_studies.case_studies.saved')
          else
            add_breadcrumb @case_study.title
            render :edit, status: :unprocessable_entity
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
          @tabs = %w[case_study_content case_study_testimonial case_study_seo case_study_advanced]
        end

        def set_locale
          @locale = params[:locale] || I18n.default_locale
        end

        def resource_params
          params.require(:case_study).permit(
            :title, :sub_heading, :intro, :image_id, :seo_title, :description, :draft,
            case_study_parts_attributes: %i[id title position content image_id alignment _destroy],
            testimonial_attributes: %i[id name company company_logo_id job_title content image_id]
          )
        end
      end
    end
  end
end
