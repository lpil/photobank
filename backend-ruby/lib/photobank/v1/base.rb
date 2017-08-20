require "grape"
require_relative "feed"
require_relative "user_post"

module Photobank
  module V1
    class Base < Grape::API
      mount Photobank::V1::Feed
      mount Photobank::V1::UserPost
    end
  end
end 