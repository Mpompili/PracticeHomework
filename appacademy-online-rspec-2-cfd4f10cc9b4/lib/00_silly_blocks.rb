def reverser(&prc)
  sentence = prc.call
  words = sentence.split(' ')
  words.map(&:reverse).join(' ')
end


def adder(surplus = 1, &prc)
  prc.call + surplus
end

def repeater(times = 1, &prc)
  times.times { prc.call }
end
