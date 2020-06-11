# frozen_string_literal: true

module Spina
  module CaseStudies
    # Spina::CaseStudies::CaseStudiesController
    class CaseStudiesController < ::Spina::ApplicationController
      include Spina::Frontend

      def index
        @case_studies = Spina::CaseStudies::CaseStudy.all
        render layout: theme_layout
      end

      def show
        @case_study = Spina::CaseStudies::CaseStudy.friendly.find params[:id]
        render layout: theme_layout
      end

      private

      def page
        @page = Spina::Page.find_or_create_by name: 'case_studies' do |page|
          page.link_url = '/case_studies'
          page.title = 'Case Studies'
          page.view_template = 'show'
          page.deletable = false
        end
      end

      def theme_layout
        "#{current_theme.name.parameterize.underscore}/application"
      end
    end
  end
end
