# frozen_string_literal: true

module ControllerHelpers
  def json_response
    return if response.body.blank?

    JSON.parse(response.body, symbolize_keys: true)
  end
end

RSpec.configure do |c|
  c.include ControllerHelpers, type: :controller
end
