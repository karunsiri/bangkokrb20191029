# frozen_string_literal: true

module Parsers
  class Name
    def self.call(attributes)
      first_name = attributes.delete(:first_name)
      last_name = attributes.delete(:last_name)

      attributes[:name] = "#{first_name} #{last_name}"
      attributes
    end
  end
end
