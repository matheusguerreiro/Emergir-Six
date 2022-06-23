namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      showSpinner("db:drop")
      showSpinner("") {%x(rails db:create)} # só pra mostrar que funciona, yield.
      showSpinner("db:migrate")
      showSpinner("dev:addMT")
      showSpinner("dev:addCoins")
    else
      puts 'Você não está em ambiente de desenvolvimento...'
    end
  end

  desc "Cadastro de moedas"
  task addCoins: :environment do
    coins = [
      {
        description: "Bitcoin",
        acronym: "BTC",
        url_image: "https://en.bitcoin.it/w/images/en/5/50/Bitcoin.png",
        mining_type: MiningType.find_by(acronym: "PoW")
      },
      {
        description: "Ethereum",
        acronym: "ETH",
        url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/2074.png",
        mining_type: MiningType.all.sample
      },
      {
        description: "Dash",
        acronym: "DASH",
        url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/131.png",
        mining_type: MiningType.all.sample
      }
    ]

    coins.each do |coin|
      spinner = TTY::Spinner.new("[:spinner] - #{coin[:acronym]} created")
      spinner.auto_spin
      Coin.find_or_create_by!(coin)
      spinner.success("(successful)")
    end
  end

  desc "Cadastro de Tipos de Mineração"
  task addMT: :environment do
    miningTypes = [
      {
        description: "Proof of Work",
        acronym: "PoW"
      },
      {
        description: "Proof of Stake",
        acronym: "PoS"
      }
    ]
    miningTypes.each do |mt|
      spinner = TTY::Spinner.new("[:spinner] - #{mt[:acronym]} created")
      spinner.auto_spin
      MiningType.find_or_create_by!(mt)
      spinner.success("(successful)")
    end
  end

  private
    def showSpinner(task)
      spinner = TTY::Spinner.new("[:spinner] #{task}")
      spinner.auto_spin
      task != "" ? %x(rails #{task}) : yield
      spinner.success("(successful)")
    end
end
