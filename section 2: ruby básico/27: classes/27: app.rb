require_relative "27: módulo pagamento.rb"

include Pagamento

p = Visa.new
puts p.pagar