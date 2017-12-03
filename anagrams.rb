# We consider two strings to be anagrams of each other if the first string's letters can be rearranged to form the second string.
# In other words, both strings must contain the same exact letters in the same exact frequency For example, bacdc and dcbac are anagrams,
# but bacdc and dcbad are not.

# Given two strings,  and , that may or may not be of the same length,
# determine the minimum number of character deletions required to make  and  anagrams.
# Any characters can be deleted from either of the strings.

input1_valid = false
until input1_valid
  begin
    a = gets.strip
    unless a.size >= 1 && a.size <= 10**4
      puts 'The size of the first string is not correct.'
      next
    end
    input1_valid = true
  end
end

input2_valid = false
until input2_valid
  begin
    b = gets.strip
    unless b.size >= 1 && b.size <= 10**4
      puts 'The size of the second string is not correct.'
      next
    end
    input2_valid = true
  end
end

count = 0

a.each_char {|letter|
  next if b.include?(letter) && a.count(letter) == b.count(letter)
  if a.count(letter) > b.count(letter)
    a = a.sub!(letter, '')
  else
    b = b.sub!(letter, '')
  end
  count += 1
}

if a.size != b.size
  b.each_char {|letter|
    next if a.include?(letter) && b.count(letter) == a.count(letter)
    if a.count(letter) > b.count(letter)
      a = a.sub!(letter, '')
    else
      b = b.sub!(letter, '')
    end
    count += 1
  }
end

puts count
