# frozen_string_literal: true

module Spina
  module CaseStudies
    # Spina::CaseStudies::CaseStudy
    class CaseStudy < ApplicationRecord
      include FriendlyId
      include Spina::Engine.routes.url_helpers

      friendly_id :slug_title, use: :slugged

      belongs_to :image
      belongs_to :testimonial, optional: true, inverse_of: :case_study

      has_many :case_study_parts, dependent: :destroy, inverse_of: :case_study

      alias_attribute :parts, :case_study_parts

      validates :title, :image_id, presence: true

      accepts_nested_attributes_for :case_study_parts, reject_if: :all_blank,
                                                       allow_destroy: true
      accepts_nested_attributes_for :testimonial, reject_if: :all_blank,
                                                  allow_destroy: true

      after_update :rewrite_rule, if: :saved_change_to_slug?

      scope :live, -> { where draft: false }
      scope :draft, -> { where draft: true }

      def slug_title
        seo_title.presence || title
      end

      private

      def should_generate_new_friendly_id?
        return true if seo_title_changed?
        return false if seo_title_changed? && title_changed?
        return true if title_changed?

        super
      end

      def rewrite_rule
        old_path = case_studies_case_study_path(saved_change_to_slug[0])
        new_path = case_studies_case_study_path(saved_change_to_slug[1])
        RewriteRule.where(old_path: old_path).first_or_create.update(new_path: new_path)
      end
    end
  end
end
