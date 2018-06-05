# frozen_string_literal: true

module Spina
  module CaseStudies
    # Spina::CaseStudies::AdminHelper
    module AdminHelper
      def link_to_add_case_study_part_fields(form, association, &block)
        new_object = form.object.send(association).klass.new
        id = new_object.object_id
        fields = form.fields_for(
          association, new_object, child_index: id
        ) { |builder| render(field_partial(new_object), f: builder) }
        link_to(
          '#', class: field_classes,
               data: { id: id, fields: fields.delete("\n") }
        ) { block.yield }
      end

      private

      def field_partial(object)
        "spina/admin/#{partable_partial_namespace(object)}/fields"
      end

      def field_classes
        'add_structure add_structure_item_fields button button-link'
      end
    end
  end
end
