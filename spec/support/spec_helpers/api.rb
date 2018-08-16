# frozen_string_literal: true

module SpecHelpers
  module Api
    def json_body
      JSON.parse response.body
    end
  end
end

RSpec.configure do |config|
  config.include SpecHelpers::Api
end
