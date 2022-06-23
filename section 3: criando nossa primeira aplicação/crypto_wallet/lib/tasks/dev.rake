namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      showSpinner("db:drop")
      showSpinner("") {%x(rails db:create)} # só pra mostrar que funciona, yield.
      showSpinner("db:migrate")
      showSpinner("db:seed")
    else
      puts 'Você não está em ambiente de desenvolvimento...'
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
