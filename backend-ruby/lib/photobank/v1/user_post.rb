# frozen_string_literal: true

module Photobank
  module V1
    class UserPost < Grape::API
      post :posts do
      	{ ping: :pong }
      end
    end
  end
end
