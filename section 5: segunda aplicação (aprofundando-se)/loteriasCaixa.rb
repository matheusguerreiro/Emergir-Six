# loterias caixa

def mega_sena(qtd=6)
  arr = []
  while arr.length < qtd do
    r_n = rand(1..60)
    arr.include?(r_n) ? r_n = rand(1..60) : arr.push(r_n)
  end
  arr.sort().each do |n| print n < 10 ? "(0#{n})" : "(#{n})" end
  puts ""
  return
end

def lotofacil(qtd=15)
  arr = []
  while arr.length < qtd do
    r_n = rand(1..25)
    arr.include?(r_n) ? r_n = rand(1..25) : arr.push(r_n)
  end
  arr.sort().each do |n| print n < 10 ? "(0#{n})" : "(#{n})" end
  puts ""
  return
end

puts ""
puts "####################"
puts "## Loterias Caixa ##"
puts "####################"
puts "## 1 # Mega-Sena ###"
puts "## 2 # Lotofácil ###"
puts "####################"
puts ""

print "Opção: "
opt = gets.to_i

puts ""

if opt == 1
  puts "você escolheu ## Mega-Sena ##"
  puts ""
  print "Quantidade de Números: "
  qtd = gets.to_i
  puts ""
  if qtd == 0
    qtd = 6
  elsif (qtd > 0 && qtd < 6) || (qtd > 0 && qtd > 15)
    puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    puts "!! ERRO !!!!!!!!!!!!!!!!!!!"
    puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    puts "!! Quantidade mínima: 06 !!"
    puts "!! Quantidade Máxima: 15 !!"
    puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    puts ""
    return
  end
  puts "############################################################"
  puts "######################## Mega-Sena #########################"
  puts "############################################################"
  mega_sena(qtd)
  puts "############################################################"
  puts ""
elsif opt == 2
  puts "você escolheu ## Lotofácil ##"
  puts ""
  print "Quantidade de Números: "
  qtd = gets.to_i
  puts ""
  if qtd == 0
    qtd = 15
  elsif (qtd > 0 && qtd < 15) || (qtd > 0 && qtd > 20)
    puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    puts "!! ERRO !!!!!!!!!!!!!!!!!!!"
    puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    puts "!! Quantidade mínima: 15 !!"
    puts "!! Quantidade Máxima: 20 !!"
    puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    puts ""
    return
  end
  puts "################################################################################"
  puts "################################## Lotofácil ###################################"
  puts "################################################################################"
  lotofacil(qtd)
  puts "################################################################################"
  puts ""
end