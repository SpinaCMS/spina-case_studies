class CreateSpinaCaseStudiesCaseStudies < ActiveRecord::Migration[5.0]
  def change
    create_table :spina_case_studies_case_studies do |t|
      t.string :title
      t.text :intro
      t.references :image, foreign_key: { to_table: :spina_images }

      t.timestamps
    end

    create_table :spina_case_studies_case_study_parts do |t|
      t.string :title
      t.text :content
      t.references :case_study, foreign_key: { to_table: :spina_case_studies_case_studies }
      t.references :image, foreign_key: { to_table: :spina_images }
      t.string :alignment
      t.integer :position

      t.timestamps
    end
  end
end
