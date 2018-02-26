module Spina::CaseStudies
  class CaseStudyPart < ApplicationRecord
    belongs_to :spina_photo, optional: true, class_name: 'Spina::Photo'
    belongs_to :case_study, inverse_of: :case_study_parts

    validates :title, :content, :alignment, presence: true
  end
end
