def convert_dec_to_bin(n)
  if (n > 1)
    convert_dec_to_bin(n / 2) + (n % 2).to_s
  else
    n.to_s
  end
end

def convert_bin_to_dec(n)
  if (n == 0)
    return 0
  else
    return (n % 10 + 2 * convert_bin_to_dec(n / 10))
  end
end

bit_sum = 0
(1..gets.chomp.to_i).each { |i|
  bit_sum = bit_sum | convert_dec_to_bin(i).to_i
}

p convert_bin_to_dec(bit_sum)