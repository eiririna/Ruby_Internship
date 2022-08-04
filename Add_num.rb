def add_num(param)
    Proc.new { |num| num + param }
end

p add_num_1 = add_num(1) # proc

p add_num_1.call(3) # 4
p add_num_1.call(5.7) # 6.7

add_num_m10 = add_num(-10)

p add_num_m10.call(44) # 34
p add_num_m10.call(-20) # -30