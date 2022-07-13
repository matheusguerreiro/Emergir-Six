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
      show_spinner('dev:create_default_questions_and_answers')
      # show_spinner('dev:add_answers_to_redis')
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
      first_name: 'user',
      last_name: 'de tal',
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

  desc "create default questions and answers"
  task create_default_questions_and_answers: :environment do
    Subject.all.each do |subject|
      rand(5..10).times do |i| # criar de 5 a 10 questões por assunto

        params = create_question_params(subject)
        answers_array = params[:question][:answers_attributes]

        create_question_answers(params, answers_array)

        # seleciona uma resposta aleatória para ser a correta
        create_correct_answer(answers_array)

        Question.create!(params[:question]) # cria a questão com as alternativas
      end
    end
  end

  desc "reset subjects counter"
  task reset_subjects_counter: :environment do
    show_spinner('dev:reset_subjects_counter') do
      Subject.find_each do |subject|
        Subject.reset_counters(subject.id, :questions)
      end
    end
  end

  # desc "add answers to redis"
  # task add_answers_to_redis: :environment do
  #   show_spinner('dev:add_answers_to_redis') do
  #     Answer.find_each do |answer|
  #       Rails.cache.write(answer.id, "#{answer.question_id}@@#{answer.correct}")
  #     end
  #   end
  # end


  private

  def create_question_params(subject = Subject.all.sample)
    {question: { # a questão
      description: "#{Faker::Lorem.paragraph} #{Faker::Lorem.question}",
      weight: rand(1..2),
      subject: subject,
      answers_attributes: []
    }}
  end

  def create_question_answers(params, answers_array = [])
    rand(2..4).times do |j| # cria as respostas
      answers_array.push(
        {description: Faker::Lorem.sentence, correct: false}
      )
    end
  end

  def create_correct_answer(answers_array = [])
    index = rand(answers_array.size)
    answers_array[index] = {description: Faker::Lorem.sentence, correct: true}
  end

  def show_spinner(task)
    spinner = TTY::Spinner.new("[:spinner] #{task}")
    spinner.auto_spin
    %x(rails #{task})
    spinner.success("(successful)")
  end
end
