# frozen_string_literal: true

require "grape"
require_relative "v1/base"

module Photobank
  class API < Grape::API
    version "v1", using: :path, vendor: 'Photobank'
    format :json

    get :ping do
      { ping: :pong }
    end

    mount Photobank::V1::Base

  end
end
