# frozen_string_literal: true

module Spina
  module CaseStudies
    # Spina::CaseStudies::ApplicationRecord
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true
    end
  end
end
