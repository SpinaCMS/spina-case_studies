# frozen_string_literal: true

module Spina
  module Parts
    class CaseStudy < Base
      attr_json :case_study_id, :integer

      def content
        self
      end

      def case_study
        Spina::CaseStudies::CaseStudy.find_by(id: case_study_id)
      end
    end
  end
end
