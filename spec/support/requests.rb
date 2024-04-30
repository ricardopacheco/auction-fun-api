# frozen_string_literal: true

module RequestsHelpers
  def json_response
    return if response.body.blank?

    JSON.parse(response.body, symbolize_keys: true)
  end
end

RSpec.configure do |c|
  c.include RequestsHelpers, type: :request
end
