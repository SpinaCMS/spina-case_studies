# frozen_string_literal: true

module Spina
  module CaseStudies
    # Spina::CaseStudies::Engine
    class Engine < ::Rails::Engine
      isolate_namespace Spina::CaseStudies

      config.before_initialize do
        ::Spina::Plugin.register do |plugin|
          plugin.name = 'case_studies'
          plugin.namespace = 'case_studies'
        end
      end

      config.generators do |g|
        g.test_framework :rspec, fixture: false
        g.fixture_replacement :factory_girl, dir: 'spec/factories'
        g.assets false
        g.helper false
      end
    end
  end
end
