# frozen_string_literal: true

require "grape"

module Photobank
  class Web < Grape::API
    version "v1", using: :path
    format :json

    get :ping do
      { ping: :pong }
    end
  end
end
