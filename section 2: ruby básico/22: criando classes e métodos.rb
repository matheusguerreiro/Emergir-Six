class Pessoa
  def falar
    "Olá, pessoal!"
  end
end

# require_relative ...

p = Pessoa.new

puts p.class
puts p.falar