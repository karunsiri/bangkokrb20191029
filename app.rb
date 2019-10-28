# frozen_string_literal: true

def parse(hash)
  parser = -> (hash) { hash }

  %w[name address point].each do |parser_name|
    # Equals to parser = parser >> <parser class>.constantize
    parser >>= Object.const_get("Parsers::#{parser_name.capitalize}")
  end

  parser.(hash)
end

