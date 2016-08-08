def character_frequencies(array_of_characters)
  array_of_characters.each_with_object(Hash.new(0)) do |element, hash|
    hash[element] += 1
  end
end

puts character_frequencies(['a', 'a', 'b', 'a', 'c', 'd', 'c'])
