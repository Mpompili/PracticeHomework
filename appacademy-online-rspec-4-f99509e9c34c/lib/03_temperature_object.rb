class Temperature
  
  def initialize(option)
    if option[:f]
      self.fahrenheit = option[:f]
    else
      self.celsius = option[:c]
    end
  end

  def fahrenheit=(temp)
    @temperature = ftoc(temp)
  end

  def celsius=(temp)
    @temperature = temp
  end

  def in_fahrenheit
    ctof(@temperature)
  end

  def in_celsius
    @temperature
  end

  def ftoc(temp)
    (temp - 32) * (5 / 9.0)
  end

  def ctof(temp)
    (temp * 9 / 5.0) + 32
  end

  def self.from_celsius(temp)
    self.new(c: temp)
  end

  def self.from_fahrenheit(temp)
    self.new(f: temp)
  end

end

class Celsius < Temperature
  def initialize(temp)
    self.celsius = temp
  end
end

class Fahrenheit < Temperature    #ctof (temp * 9 / 5.0) + 32
  def initialize(temp)
    self.fahrenheit = temp
  end
end

    # (temp - 32) * (5 / 9.0)



# class Temperature
#   # key and value, key tells you what temperatature value is
#   # representative of.
#   # accesss the hash
#   def self.from_celsius(num)
#     Temperature.new(:c => num)
#   end
#
#   def self.from_fahrenheit(num)
#     Temperature.new(:f => num)
#   end
#
#   attr_accessor :hash
#   def initialize(options = {})
#     @hash = options
#   end
#
#   def in_celsius
#     if @hash.key?(:c)
#       @hash[:c]
#     elsif @hash.key?(:f)
#       ((@hash[:f] - 32) * 5.0 / 9.0).round(2)
#     end
#   end
#
#   def in_fahrenheit
#     if @hash.key?(:f)
#       @hash[:f]
#     elsif @hash.key?(:c)
#       p "this works for some wierd reason: #{@hash}, and its key: #{@hash.keys.first}"
#       ((@hash[:c] * 9.0 / 5.0) + 32).round(2)
#     end
#   end
#
#
# end
#
#   class Celsius < Temperature
#
#
#     def initialize(num)
#       p "this is cel num: #{num}"
#       @num = { c: num }
#       p "this is @num #{@num}"
#     end
#   end
#
#   class Fahrenheit < Temperature
#
#
#     def initialize(num)
#       p "this is far num: #{num}"
#       @num = { f: num }
#       p @num
#     end
#   end
