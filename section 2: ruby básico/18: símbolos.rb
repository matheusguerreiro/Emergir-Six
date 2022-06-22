puts "Matheus".object_id
puts "Matheus".object_id
puts "Matheus".object_id # ids diferentes

puts :matheus.object_id
puts :matheus.object_id
puts :matheus.object_id # ids iguais

# hashes adoram símbolos, exemplo:
h = {curso: "ruby on rails"}
print h