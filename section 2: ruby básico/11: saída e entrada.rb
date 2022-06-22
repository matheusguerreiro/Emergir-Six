# saida
puts "digite seu nome:"

# entrada
nome = gets

# resultado, outra saida
puts "seu nome é #{nome.chomp}!"

# \n e .chomp
# a variável tem um \n(enter) no final, .chomp tira isso para não quebrar a linha.

# coerção, to_i, to_f, to_s... converter para inteiro, real, string...

puts "digite seu salário:"
salario = gets.chomp.to_f

puts "seu salário é: R$#{salario}"