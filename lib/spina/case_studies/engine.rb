# frozen_string_literal: true

require 'friendly_id'
require 'spina'
require 'cocoon'

module Spina
  module CaseStudies
    # Spina::CaseStudies::Engine
    class Engine < ::Rails::Engine
      isolate_namespace Spina::CaseStudies

      config.generators do |g|
        g.test_framework :rspec, fixture: false
        g.fixture_replacement :factory_girl, dir: 'spec/factories'
        g.assets false
        g.helper false
      end
    end
  end
end
