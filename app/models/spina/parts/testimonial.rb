# frozen_string_literal: true

module Spina
  module Parts
    class CaseStudy < Base
      attr_json :testimonial_id, :integer

      def content
        self
      end

      def case_study
        Spina::CaseStudies::Testimonial.find_by(id: testimonial_id)
      end
    end
  end
end
