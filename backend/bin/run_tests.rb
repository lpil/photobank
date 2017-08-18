#!/usr/bin/env ruby
# frozen_string_literal: true

test_pattern = File.expand_path("../../test/**/*test.rb", __FILE__)
test_files = Dir.glob(test_pattern)

test_files.each do |test_file|
  require test_file
end
