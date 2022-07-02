namespace :dev do

  DEFAULT_PASSWORD = 12345678
  DEFAULT_FILES_PATH = File.join(Rails.root, 'lib', 'tmp')

  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner('db:drop')
      show_spinner('db:create')
      show_spinner('db:migrate')
      show_spinner('dev:add_default_admin')
      show_spinner('dev:add_default_user')
      show_spinner('dev:create_admins')
      show_spinner('dev:create_default_subjects')
    end
  end

  desc "add admin padrão"
  task add_default_admin: :environment do
    Admin.create!(
      email: 'admin@admin.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  desc "add user padrão"
  task add_default_user: :environment do
    User.create!(
      email: 'user@user.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  desc "create 6 admins"
  task create_admins: :environment do
    6.times do |i|
      Admin.create!(
        email: Faker::Internet.email,
        password: 123456,
        password_confirmation: 123456
      )
    end
  end

  desc "create default subjects"
  task create_default_subjects: :environment do
    file_name = 'subjects.txt'
    file_path = File.join(DEFAULT_FILES_PATH, file_name)

    File.open(file_path, 'r').each do |line|
      Subject.create!(
        description: line.strip
      )
    end
  end

  private
  def show_spinner(task)
    spinner = TTY::Spinner.new("[:spinner] #{task}")
    spinner.auto_spin
    %x(rails #{task})
    spinner.success("(successful)")
  end
end
