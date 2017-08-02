module Spina::CaseStudies
  class CaseStudiesController < ::Spina::ApplicationController

    def index
      @case_studies = Spina::CaseStudies::CaseStudy.all
    end

    def show
      @case_study = Spina::CaseStudies::CaseStudy.find params[:id]
    end
  end
end
