module Spina::CaseStudies
  class CaseStudiesController < ::Spina::ApplicationController
    before_action :set_page

    def index
      @case_studies = Spina::CaseStudies::CaseStudy.all
      render layout: "#{current_theme.name.parameterize.underscore}/application"
    end

    def show
      @case_study = Spina::CaseStudies::CaseStudy.find params[:id]
      render layout: "#{current_theme.name.parameterize.underscore}/application"
    end

    private

    def set_page
      @page = Spina::Page.find_or_create_by name: 'case_studies' do |page|
        page.link_url = '/case_studies'
        page.title = 'Case Studies'
        page.view_template = 'show'
        page.deletable = false
      end
    end
  end
end
