class HashWithIndifferentAccess < Hash
  def [](key)
    return super(key) if include?(key)
    case key
    when Symbol then return super(key.to_s) if include?(key.to_s)
    when String then return super(key.to_sym) if include?(key.to_sym)
    end
  end
end

class Hash
  def with_indifferent_access
    HashWithIndifferentAccess[self]
  end
end
