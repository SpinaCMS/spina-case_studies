class AddExcerptToSpinaCaseStudiesCaseStudies < ActiveRecord::Migration[5.0]
  def change
    add_column :spina_case_studies_case_studies, :excerpt, :text
  end
end
