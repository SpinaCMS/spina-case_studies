module Spina::Admin
  class CaseStudies::CaseStudiesController < AdminController
    before_action :set_breadcrumb
    before_action :set_tabs, only: [:new, :create, :edit, :update]
    before_action :set_locale

    layout 'spina/admin/case_studies'

    def index
    end

    def new
    end

    def create
    end

    def edit
    end

    def update
    end

    private

    def set_breadcrumb
      add_breadcrumb I18n.t('spina.case_studies.case_studies.title'), spina.admin_case_studies_case_studies_path
    end

    def set_tabs
      @tabs = %w{case_study_content case_study__configuration}
    end

    def set_locale
      @locale = params[:locale] || I18n.default_locale
    end

    def resource_params
      params.require(:case_study).permit(:title, :intro)
    end

  end
end
