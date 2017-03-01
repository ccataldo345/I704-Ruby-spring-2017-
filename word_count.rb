words01 = %w(hello world)

def count(words)
  word_count = 0 if word_count.nil?
  words.each do |word|
      word_count += 1
  end

word_count
end

puts count(words01)
