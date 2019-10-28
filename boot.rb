# frozen_string_literal: true

require 'rubygems'
require 'bundler'

Bundler.require(:default)

# Requires everything in lib/ folder
Dir['./lib/**/*.rb'].each { |file| load file }

def transform_keys(hash)
  hash.transform_keys { |k| k.to_sym }
end

def reload!
  load 'boot.rb'
  load 'app.rb'
end
