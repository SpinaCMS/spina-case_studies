# frozen_string_literal: true

module Spina
  module CaseStudies
    # Spina Case Studies Railtie
    class Railtie < Rails::Railtie
      initializer 'spina_case_studies.register_plugin' do
        Spina::Plugin.register do |plugin|
          plugin.name = 'Case Studies'
          plugin.namespace = 'case_studies'
        end
      end

      initializer 'spina_case_studies.register_parts' do |app|
        app.reloader.to_prepare do
          Spina::Part.register(Spina::Parts::CaseStudy)
        end
      end

      initializer 'spina_case_studies.assets.precompile' do |app|
        app.config.assets.precompile += %w[spina/case_studies/admin/case_studies.js]
      end
    end
  end
end
