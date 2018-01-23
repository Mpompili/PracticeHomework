

def add(first, second)
  first + second
end

def subtract(first, second)
  first - second
end

def sum(array)
  return 0 if array.empty?
  array.reduce(:+)
end

def multiply(first, second)
  first * second
end

def power(first, second)
  first**second
end
