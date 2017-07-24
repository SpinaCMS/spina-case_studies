module Spina
  module CaseStudies
    module AdminHelper
      def link_to_add_case_study_part_fields(f, association, &block)
        new_object = f.object.send(association).klass.new
        id = new_object.object_id
        fields = f.fields_for(association, new_object, child_index: id) do |builder|
          render("spina/admin/#{ partable_partial_namespace(new_object) }/fields", f: builder)
        end
        link_to '#', class: "add_structure button button-link", data: {id: id, fields: fields.gsub("\n", "")} do
          block.yield
        end
      end
    end
  end
end
