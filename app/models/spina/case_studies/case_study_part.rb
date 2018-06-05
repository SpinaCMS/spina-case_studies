# frozen_string_literal: true

module Spina
  module CaseStudies
    # Spina::CaseStudies::CaseStudyPart
    class CaseStudyPart < ApplicationRecord
      belongs_to :image, optional: true
      belongs_to :case_study, inverse_of: :case_study_parts

      validates :title, :content, :alignment, presence: true
    end
  end
end
