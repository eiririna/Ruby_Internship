module Tryable
    def try(&block)
        yield self
        rescue NoMethodError
            nil
    end
end

class Object
    include Tryable
end

p false.try { even? } # nil
p false.try(&:even?) # nil
p 2.try(&:even?) # true
p 1.try { |obj| obj + 1 } # 2
p true.try { |obj| obj + 1 } # nil

p 1.try { |obj| obj + '' } # it still should raise error “String can't be coerced into Integer"