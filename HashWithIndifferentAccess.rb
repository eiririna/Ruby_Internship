class HashWithIndifferentAccess < Hash
  def [](key)
    return super(key) if include?(key)
    if key === Symbol
      return super(key.to_s) if include?(key.to_s)
    elsif key === String
      return super(key.to_sym) if include?(key.to_sym)
    end
  end
end

class Hash
  def with_indifferent_access
    HashWithIndifferentAccess[self]
  end
end

h = { a: 'apple' }.with_indifferent_access
puts h[:a]