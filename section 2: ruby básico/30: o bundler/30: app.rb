require 'faker'

puts Faker::Address.country
puts Faker::Number.binary(digits: 32)
puts Faker::Alphanumeric.alphanumeric(number: 32)