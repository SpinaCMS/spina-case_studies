# frozen_string_literal: true

class AddCompanyLogoImageToTestimonials < ActiveRecord::Migration[6.1]
  def change
    unless ActiveRecord::Base.connection.column_exists?(:spina_case_studies_testimonials, :company_logo_id)
      add_reference :spina_case_studies_testimonials, :company_logo, to: { table: :spina_images }
    end
  end
end
