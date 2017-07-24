module Spina::CaseStudies
  class CaseStudyPart < ApplicationRecord
    belongs_to :spina_photo, class_name: 'Spina::Photo'
    belongs_to :case_study, inverse_of: :case_study_parts
  end
end
