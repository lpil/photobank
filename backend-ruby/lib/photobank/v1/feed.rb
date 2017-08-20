# frozen_string_literal: true

require "securerandom"

module Photobank
  module V1
    class Feed < Grape::API
      get :feed do
        { feed: { items: [{ id: SecureRandom.uuid, type: "post", text: "abc", image: "cdn" }] } }
      end
    end
  end
end
