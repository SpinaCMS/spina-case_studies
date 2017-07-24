module Spina::CaseStudies
  class CaseStudy < ApplicationRecord
    belongs_to :spina_photo, class_name: 'Spina::Photo'
    has_many :case_study_parts, dependent: :destroy, inverse_of: :case_study

    alias_attribute :parts, :case_study_parts

    has_many :page_parts, as: :page_partable
    has_many :layout_parts, as: :layout_partable
    has_many :structure_parts, as: :structure_partable

    validates :title, :spina_photo_id, presence: true

    accepts_nested_attributes_for :case_study_parts, reject_if: :all_blank, allow_destroy: true
  end
end
