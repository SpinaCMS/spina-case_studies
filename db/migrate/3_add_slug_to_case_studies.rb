class CreateSpinaCaseStudiesTestimonials < ActiveRecord::Migration[5.2]
  def change
    add_column :spina_case_studies_case_studies, :slug, :string, index: true
  end
end
