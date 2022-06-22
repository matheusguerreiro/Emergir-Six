class Pessoa
  attr_accessor :idade # gerar tipo getter e setter
  def falar
    "Olá, pessoal."
  end 
  def meuId
    "Meu id é: #{self.object_id}"
    # self é o próprio objeto.
  end
  def initialize(nomeFornecido = "indigente")
    @nome = nomeFornecido # essa variável estará disponível em toda a classe
  end
  def imprimirNome
    puts @nome
  end
end

p = Pessoa.new
puts p.falar
puts p.meuId

p.imprimirNome

p1 = Pessoa.new("Matheus")
p1.imprimirNome

p2 = Pessoa.new
p2.idade = 31 # tipo setter
puts p2.idade # tipo getter

class String
  def inverter
    self.reverse
  end
end

puts "João".inverter