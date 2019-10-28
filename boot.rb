# frozen_string_literal: true

require 'rubygems'
require 'bundler'

Bundler.require(:default)

# Requires everything in lib/ folder
Dir['./lib/**/*.rb'].each { |file| load file }

def transform_keys(people_hash_list)
  people_hash_list.map do |person|
    person.transform_keys { |k| k.to_sym }
  end
end

def constantize(klass)
  Object.const_get("Parsers::#{klass.capitalize}")
end

def reload!
  load 'boot.rb'
  load 'app.rb'
  @parser = nil
end
