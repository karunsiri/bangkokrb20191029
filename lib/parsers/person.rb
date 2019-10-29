# frozen_string_literal: true

module Parsers
  class Person
    def self.call(attributes)
      ::Person.new(
        name: attributes.fetch(:name),
        points: attributes.fetch(:points),
        address: attributes.fetch(:address)
      )
    end
  end
end
