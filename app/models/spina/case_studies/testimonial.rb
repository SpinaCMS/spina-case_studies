# frozen_string_literal: true

module Spina
  module CaseStudies
    # Spina::CaseStudies::Testimonial
    class Testimonial < ApplicationRecord
      belongs_to :image, optional: true

      has_one :case_study, inverse_of: :testimonial, dependent: :nullify

      has_many :page_parts, as: :page_partable, dependent: :destroy
      has_many :layout_parts, as: :layout_partable, dependent: :destroy
      has_many :structure_parts, as: :structure_partable, dependent: :destroy

      validates :name, :content, presence: true
    end
  end
end
