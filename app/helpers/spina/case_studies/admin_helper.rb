# frozen_string_literal: true

module Spina
  module CaseStudies
    # Spina::CaseStudies::AdminHelper
    module AdminHelper
      def link_to_add_case_study_part_fields(f)
        case_study_part_content = Spina::CaseStudies::CaseStudyPart.new
        fields = f.fields_for(:case_study_parts, [case_study_part_content],
                              child_index: case_study_part_content.object_id) do |builder|
          render('spina/admin/case_studies/case_study_parts/fields', f: builder)
        end
        link_to '#', class: 'add_structure_item_fields button button-link',
                     data: { id: case_study_part_content.object_id, fields: fields.gsub("\n", '') } do
          icon('plus')
        end
      end
    end
  end
end
