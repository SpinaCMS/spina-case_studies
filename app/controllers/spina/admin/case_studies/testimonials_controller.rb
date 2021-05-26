# frozen_string_literal: true

module Spina
  module Admin
    module CaseStudies
      # Spina::Admin::CaseStudies::TestimonialsController
      class TestimonialsController < ::Spina::Admin::AdminController
        before_action :set_breadcrumb
        before_action :set_tabs, only: %i[new create edit update]
        before_action :set_locale

        admin_section :case_studies

        helper Spina::CaseStudies::AdminHelper

        def index
          @testimonials = Spina::CaseStudies::Testimonial.order(:company, :name)
        end

        def new
          @testimonial = Spina::CaseStudies::Testimonial.new
          add_breadcrumb I18n.t('spina.case_studies.testimonials.new')
          render layout: 'spina/admin/admin'
        end

        def create
          @testimonial = Spina::CaseStudies::Testimonial.new resource_params

          if @testimonial.save
            redirect_to spina.admin_case_studies_testimonials_path,
                        notice: t('spina.case_studies.testimonials.saved')
          else
            add_breadcrumb I18n.t('spina.case_studies.testimonials.new')
            render :new, layout: 'spina/admin/admin'
          end
        end

        def edit
          @testimonial = Spina::CaseStudies::Testimonial.find params[:id]
          add_breadcrumb @testimonial.name
          render layout: 'spina/admin/admin'
        end

        def update
          @testimonial = Spina::CaseStudies::Testimonial.find params[:id]

          if @testimonial.update resource_params
            redirect_to spina.admin_case_studies_testimonials_path,
                        notice: t('spina.case_studies.testimonials.saved')
          else
            add_breadcrumb @testimonial.title
            render :edit, layout: 'spina/admin/admin'
          end
        end

        def destroy
          @testimonial = Spina::CaseStudies::CaseStudy.find params[:id]
          @testimonial.destroy
          redirect_to spina.admin_case_studies_testimonials_path,
                      notice: t('spina.case_studies.testimonials.destroyed')
        end

        private

        def set_breadcrumb
          add_breadcrumb I18n.t('spina.case_studies.testimonials.title'),
                         spina.admin_case_studies_testimonials_path
        end

        def set_tabs
          @tabs = %w[testimonial_content]
        end

        def set_locale
          @locale = params[:locale] || I18n.default_locale
        end

        def resource_params
          params.require(:testimonial).permit(
            :name, :company, :job_title, :content, :image_id, :company_logo_id
          )
        end
      end
    end
  end
end
