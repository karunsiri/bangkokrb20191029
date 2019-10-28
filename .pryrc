# frozen_string_literal: true

require './boot'
require './app'

URL = 'https://gist.githubusercontent.com/karunsiri/1d3890dca24d3969a35b37ee5310d8f4/raw/a2ef65f749c931907ea90f6186c7ac1c59adc872/people.json'

def fetch
  URI(URL)
    .then { |uri| Net::HTTP.get(uri) }
    .then(&JSON.method(:parse))
    .then(&method(:transform_keys))
    .map(&method(:parse))
end

def fetch2
  fetcher = method(:URI) >>
    Net::HTTP.method(:get) >>
    JSON.method(:parse) >>
    -> (people) { transform_keys(people) } >>
    -> (people) { people.map { |person| parse(person) } }

  fetcher.(URL)
end
