module Spina::CaseStudies
  class CaseStudiesController < ::Spina::ApplicationController

    def index
      @case_studies = Spina::CaseStudies::CaseStudy.all
      render layout: "#{current_theme.name.parameterize.underscore}/application"
    end

    def show
      @case_study = Spina::CaseStudies::CaseStudy.find params[:id]
      render layout: "#{current_theme.name.parameterize.underscore}/application"
    end
  end
end
