class Pessoa
  attr_accessor :nome, :email
end

class PessoaFisica < Pessoa
  attr_accessor :cpf

  def falar(fala)
    puts fala
  end
end

class PessoaJuridica < Pessoa
  attr_accessor :cnpj

  def pagarFornecedor
    puts "pagando fornecedor..."
  end
end

p = Pessoa.new
p.nome = "Matheus"
p.email = "m@gmail.com"
puts p.nome
puts p.email

pF = PessoaFisica.new
pF.nome = "João"
pF.email = "j@hotmail.com"
pF.cpf = 12345678900
pF.falar("#{pF.nome} está falando...")
puts pF.nome
puts pF.email
puts pF.cpf

pJ = PessoaJuridica.new
pJ.nome = "Soriano"
pJ.email = "s@bus.com"
pJ.cnpj = 2318937648922
pJ.pagarFornecedor
puts pJ.nome
puts pJ.email
puts pJ.cnpj
