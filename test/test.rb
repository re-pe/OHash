# This is orgered hash
class OHash
  attr_accessor :hash, :order

  def initialize
    @hash = Hash.new #{ nil }
    @order = Array.new #{ nil }
  end

end

ohash = OHash.new

print 'ohash.hash["a"].nil? => ', ohash.hash["a"].nil?, "\n"
print 'ohash.order[5].nil? => ', ohash.order[5].nil?, "\n"
