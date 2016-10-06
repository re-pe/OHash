# This is class of ordered hash

class TArray
  attr_reader :keys

  def initialize
    @array = Array.new
    @keys = Hash.new
  end
  
  def [](*params)
    if params.empty?
      @array[@array.length]
    else
      arr = Array.new
      params.each do |param|
        if param.is_a? Integer
          arr[param] = @array[param] if param >= arr.length
        elsif param.is_a? String
          
        end
      end
    end
  end
  
  def []=(*params, value)
    if params.empty?
      @array.push({:val => value})
    else
      params.each do |param|
        hash = Hash.new
        hash[:val] = value
        if param.is_a? Integer
          @array[param] = hash
        elsif param.is_a? String
          hash[:key] = param 
          @array.push hash
        end
      end
    end
    set_keys
  end

  def set_keys
    @keys = Hash.new
    @array.each_index do |index|
      if @array[index].is_a? Hash
        if @array[index].key?(:key)
          @keys[@array[index][:key]] = index
        end
      end
    end
  end

  def to_s
    result = ""
    @array.each do
      | member |
      if (member.is_a? Hash) && (member.key?(:val)) 
        result << " #{member[:key]}:" if member.key?(:key)
        result << " #{member[:val]};"
      end
    end
    "(#{result[0...-1]} )"
  end
end

tArray = TArray.new 
tArray['a'] = 101
tArray[] = 102
tArray['c'] = 103

tArray[] = 101
tArray['b'] = 102
tArray[] = 103
tArray[1,11] = 1000
tArray[] = [1000, 1001]

print "tArray = ", tArray, "\n"
print "tArray.keys = ", tArray.keys, "\n"
