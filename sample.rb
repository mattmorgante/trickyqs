require 'json'
require 'pp'

json = File.read('input.json')
obj = JSON.parse(json)

puts obj