class CreateSpinaCaseStudiesCaseStudies < ActiveRecord::Migration[5.0]
  def change
    create_table :spina_case_studies_case_studies do |t|
      t.string :title
      t.text :intro
      t.references :spina_photo, foreign_key: true

      t.timestamps
    end

    create_table :spina_case_studies_case_study_parts do |t|
      t.string :title
      t.text :content
      t.references :case_study, foreign_key: { to_table: :spina_case_studies_case_studies }
      t.references :spina_photo, foreign_key: true
      t.string :alignment

      t.timestamps
    end
  end
end
