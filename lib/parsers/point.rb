# frozen_string_literal: true

module Parsers
  class Point
    def self.call(attributes)
      attributes[:points] = attributes[:points]&.to_s&.delete(',').to_f
      attributes
    end
  end
end
