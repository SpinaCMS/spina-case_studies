# frozen_string_literal: true

class AddSeoFieldsToCaseStudies < ActiveRecord::Migration[5.2]
  def change
    add_column :spina_case_studies_case_studies, :seo_title, :string
    add_column :spina_case_studies_case_studies, :description, :text
  end
end
