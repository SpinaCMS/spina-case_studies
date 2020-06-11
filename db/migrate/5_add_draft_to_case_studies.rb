# frozen_string_literal: true

class AddDraftToCaseStudies < ActiveRecord::Migration[5.2]
  def change
    add_column :spina_case_studies_case_studies, :draft, :boolean
  end
end
