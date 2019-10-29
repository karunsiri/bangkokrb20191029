# frozen_string_literal: true

PARSERS = %w[
  name address point person
].freeze

def parse(hash)
  @parser ||=
    begin
      parser = -> (hash) { hash }
      PARSERS.each { |klass| parser >>= constantize(klass) }
      parser
    end
  @parser.(hash)
end
