module Pagamento
  def pagar(bandeira, numero, valor)
    "Pagando com o cartão de bandeira #{bandeira} de número #{numero} o valor de R$#{valor.to_f}"
  end
end