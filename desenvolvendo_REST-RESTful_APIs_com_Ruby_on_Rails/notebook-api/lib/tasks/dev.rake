namespace :dev do
  desc "Prepara o Ambiente de Desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("db:drop")
      show_spinner("db:create")
      show_spinner("db:migrate")
      show_spinner("dev:add_kinds")
      show_spinner("dev:add_contacts")
      show_spinner("dev:add_phones")
      show_spinner("dev:add_addresses")
    else
      puts "Você não está no ambiente de Desenvolvimento..."
    end
  end

  desc "adiciona tipos"
  task add_kinds: :environment do
    kinds = ["Família", "Conhecido", "Amigo", "Trabalho", "Colega"]
    kinds.each do |kind|
      Kind.create!({
        description: kind
      })
    end
  end

  desc "adiciona contatos"
  task add_contacts: :environment do
    50.times do |i|
      name = Faker::Name.first_name
      Contact.create!({
        name: name,
        email: Faker::Internet.email(name: name),
        birthdate: Faker::Date.birthday(min_age: 16, max_age: 64),
        kind: Kind.all.sample
      })
    end
  end

  desc "adiciona telefones"
  task add_phones: :environment do
    Contact.all.each do |contact|
      rand(1..2).times do |i|
        phone = Phone.create!(number:Faker::PhoneNumber.cell_phone)
        contact.phones << phone
        contact.save!
      end
    end
  end

  desc "adiciona endereços"
  task add_addresses: :environment do
    Contact.all.each do |contact|
      Address.create!({
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        contact: contact
      })
    end
  end


  private

    def show_spinner(task)
      spinner = TTY::Spinner.new("[:spinner] #{task}")
      spinner.auto_spin
      %x(rails #{task})
      spinner.success("com Sucesso!")
    end

end
