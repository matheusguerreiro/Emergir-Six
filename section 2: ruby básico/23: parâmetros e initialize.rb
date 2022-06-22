class Pessoa
  def falar(nome = "João")
    "Olá, #{nome}!"
  end
  # esse método sempre vai inicializar
  def initialize(cont = 1)
    cont.times do |i|
      puts "initialize... #{i}"
    end
  end
end

p = Pessoa.new
puts p.falar("Matheus")
puts p.falar

p1 = Pessoa.new(5)