require 'net/http'

class CEP
  attr_reader :logradouro, :bairro, :localidade, :uf

  def initialize(cep)
    cep_encontrado = encontrar(cep)
    preencher_dados(cep_encontrado)
  end

  def endereco
    "#{@logradouro}, #{@bairro}, #{@localidade} - #{@uf}"
  end


  private
  def encontrar(cep)
    ActiveSupport::JSON.decode(
        Net::HTTP.get(
            URI("https://viacep.com.br/ws/#{cep}/json/")
        )
    )
  end
  def preencher_dados(cep_encontrado)
    @logradouro = cep_encontrado["logradouro"]
    @bairro = cep_encontrado["bairro"]
    @localidade = cep_encontrado["localidade"]
    @uf = cep_encontrado["uf"]
  end
end