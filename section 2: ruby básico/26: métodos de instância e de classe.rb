class Pessoa
  def falar # instância
    "Olá, pessoal."
  end

  def self.gritar(grito) # classe, não precisa instanciar
    "#{grito}!!!!"
  end
end

p = Pessoa.new
puts p.falar

puts Pessoa.gritar("Ahá")