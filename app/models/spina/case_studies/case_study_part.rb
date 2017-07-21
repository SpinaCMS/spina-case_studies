module Spina::CaseStudies
  class CaseStudyPart < ApplicationRecord
    belongs_to :spina_photo
    belongs_to :case_study
  end
end
