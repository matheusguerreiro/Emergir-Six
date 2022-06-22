module ApplicationHelper
  def dataBr(data)
    data.strftime("%d/%m/%Y")
  end
  def ambienteRails
    if Rails.env.development?
      'Desenvolvimento'
    elsif Rails.env.test?
      'Teste'
    else
      'Produção'
    end
  end
end
