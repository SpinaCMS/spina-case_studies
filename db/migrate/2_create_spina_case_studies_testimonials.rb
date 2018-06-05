class CreateSpinaCaseStudiesTestimonials < ActiveRecord::Migration[5.1]
  def change
    create_table :spina_case_studies_testimonials do |t|
      t.string :name
      t.string :company
      t.string :job_title
      t.text :content
      t.references :image, foreign_key: { to_table: :spina_images }

      t.timestamps
    end

    add_reference :spina_case_studies_case_studies, :testimonial, foreign_key: { to_table: :spina_case_studies_testimonials }
  end
end
