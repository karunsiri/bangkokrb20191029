# frozen_string_literal: true

module Parsers
  class Address
    FORMAT = /^(?<street>.+), (?<county>.+), (?<state>\w{2}) (?<postal_code>\d+)$/.freeze

    def self.call(attributes)
      fragments = FORMAT.match(attributes[:address])

      attributes[:address] =
        if fragments
          ::Address.new(
            street: fragments[:street],
            county: fragments[:county],
            state: fragments[:state],
            postal_code: fragments[:postal_code]
          )
        end

      attributes
    end
  end
end
