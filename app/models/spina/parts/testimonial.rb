# frozen_string_literal: true

module Spina
  module Parts
    class Testimonial < Base
      attr_json :testimonial_id, :integer

      def content
        self
      end

      def testimonial
        Spina::CaseStudies::Testimonial.find_by(id: testimonial_id)
      end
    end
  end
end
