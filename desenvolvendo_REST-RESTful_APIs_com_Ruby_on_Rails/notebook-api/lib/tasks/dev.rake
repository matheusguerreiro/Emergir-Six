namespace :dev do
  desc "Prepara o Ambiente de Desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("db:drop")
      show_spinner("db:create")
      show_spinner("db:migrate")
      show_spinner("dev:add_contacts")
    else
      puts "Você não está no ambiente de Desenvolvimento..."
    end
  end

  desc "adiciona contatos"
  task add_contacts: :environment do
    50.times do |i|
      name = Faker::Name.first_name
      Contact.create({
        name: name,
        email: Faker::Internet.email(name: name),
        birthdate: Faker::Date.birthday(min_age: 16, max_age: 64)
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
