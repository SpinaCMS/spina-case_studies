module Spina::CaseStudies
  class CaseStudy < ApplicationRecord
    belongs_to :spina_photo
    has_many :case_study_parts, dependent: :destroy

    validates :title, :spina_photo, presence: true

    accepts_nested_attributes_for :case_study_parts, allow_destroy: true
  end
end
