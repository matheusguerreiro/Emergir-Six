print 'digite um número: '
x = gets.chomp.to_i

# if
if x > 2
  puts "if: SIM!"
end

# if else também tem

# unless
unless x > 2
  puts "é MENOR!"
else
  puts "é MAIOR!"
end

# case
case x
when 0..5
  puts 'entre 0 e 5!'
when 5..10
  puts 'entre 5 e 10!'
else
  puts 'maior que 10!'
end

# ternária
sexo = "M"
puts sexo == "F" ? "SIM" : "NÃO"
sexo == "M" ? (puts "SIM") : (puts "NÃO")