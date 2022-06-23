# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

spinner = TTY::Spinner.new("[:spinner] creating coins...")
spinner.auto_spin

coins = [
  {
    description: "Bitcoin",
    acronym: "BTC",
    url_image: "https://en.bitcoin.it/w/images/en/5/50/Bitcoin.png"
  },
  {
    description: "Ethereum",
    acronym: "ETH",
    url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/2074.png"
  },
  {
    description: "Dash",
    acronym: "DASH",
    url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/131.png"
  }
]

coins.each do |coin|
  spinner = TTY::Spinner.new("[:spinner] create #{coin[:description]}")
  spinner.auto_spin
  Coin.find_or_create_by!(coin)
  spinner.success("(successful)")
end

=begin
Coin.create!([
  {
    description: "Bitcoin",
    acronym: "BTC",
    url_image: "https://en.bitcoin.it/w/images/en/5/50/Bitcoin.png"
  },
  {
    description: "Ethereum",
    acronym: "ETH",
    url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/2074.png"
  },
  {
    description: "Dash",
    acronym: "DASH",
    url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/131.png"
  }
]) 
=end

spinner.success("(successful)")