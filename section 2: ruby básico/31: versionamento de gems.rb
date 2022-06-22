require 'cpf_utils'


aCpfs = []

while aCpfs.length < 5 do
  cpf = CpfUtils.cpf
  aCpfs.push(cpf)
end

puts aCpfs