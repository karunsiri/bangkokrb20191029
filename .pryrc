# frozen_string_literal: true

require './boot'
require './app'

def fetch
  url = 'https://gist.githubusercontent.com/karunsiri/1d3890dca24d3969a35b37ee5310d8f4/raw/a2ef65f749c931907ea90f6186c7ac1c59adc872/people.json'
  URI(url)
    .then { |uri| Net::HTTP.get(uri) }
    .then { |resp| JSON.parse(resp) }
    .then { |people| people.map { |person| transform_keys(person) } }
    .then { |people| people.map { |person| parse(person) } }
end
