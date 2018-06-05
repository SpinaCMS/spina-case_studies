# frozen_string_literal: true

module Spina
  module CaseStudies
    # Spina::CaseStudies::CaseStudy
    class CaseStudy < ApplicationRecord
      belongs_to :image
      belongs_to :testimonial, optional: true, inverse_of: :case_study

      has_many :case_study_parts, dependent: :destroy, inverse_of: :case_study
      has_many :page_parts, as: :page_partable
      has_many :layout_parts, as: :layout_partable
      has_many :structure_parts, as: :structure_partable

      alias_attribute :parts, :case_study_parts

      validates :title, :image_id, presence: true

      accepts_nested_attributes_for :case_study_parts, reject_if: :all_blank,
                                                       allow_destroy: true
      accepts_nested_attributes_for :testimonial, reject_if: :all_blank,
                                                  allow_destroy: true
    end
  end
end
