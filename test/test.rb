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

module E
  module A
    def foo
      puts 'E::A::foo'
    end
    def helper
        puts 'E::A::helper'
        foo
    end    
  end

  module B
    extend A
    def B.bar
      puts 'E::B::bar'
      helper
    end
  end
end

#puts E::A.foo => error
puts E::B.bar

module Foo
  def self.included base
    #base.send :include, InstanceMethods
    base.include InstanceMethods
    base.extend ClassMethods
  end

  module InstanceMethods
    def bar1
      'bar1'
    end
  end

  module ClassMethods
    def bar2
      'bar2'
    end
  end
end

class Test
  include Foo
end

puts Test.new.bar1 # => "bar1"
puts Test.bar2 # => "bar2"
