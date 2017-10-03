# A kidnapper wrote a ransom note but is worried it will be traced back to him. He found a magazine and wants to know if he can cut out whole words from it and use them to create an untraceable replica of his ransom note. The words in his note are case-sensitive and he must use whole words available in the magazine, meaning he cannot use substrings or concatenation to create the words he needs.
#
#     Given the words in the magazine and the words in the ransom note, print Yes if he can replicate his ransom note exactly using whole words from the magazine; otherwise, print No.
#
#     Input Format
#
#     The first line contains two space-separated integers describing the respective values of  (the number of words in the magazine) and  (the number of words in the ransom note).
#     The second line contains  space-separated strings denoting the words present in the magazine.
#     The third line contains  space-separated strings denoting the words present in the ransom note.

# Constraints
#
#     1<=m,n<=30000
#     1<=length of any word<=5

#     Each word consists of English alphabetic letters (i.e.,  to  and  to ).
#         The words in the note and magazine are case-sensitive.
#     Output Format
#
# Print Yes if he can use the magazine to create an untraceable replica of his ransom note; otherwise, print No.

input1_valid = false
until input1_valid
  begin
    input1 = gets.strip.split(' ')

    if input1.size != 2
      puts 'First input line should consist of 2 integers!'
      next
    end

    unless input1[0].to_i >= 1 && input1[0].to_i <= 3*10**4
      puts 'The size of the number of words in the magazine is not correct.'
      next
    end

    unless input1[1].to_i >= 1 && input1[1].to_i <= 3*10**4
      puts 'The size of the number of words in the ransom note is not correct.'
      next
    end

    input1_valid = true
  rescue
    puts 'Incorrect input! Please retry.'
  end
end

if input1[1].to_i > input1[0].to_i
  puts 'No'
else
  input2 = nil
  input2_valid = false
  until input2_valid
    begin
      input2 = gets.strip.split(' ')
      if input2.size != input1[0].to_i
        puts 'Incorrect number of words for magazine! ' + input2.size.to_s
        next
      end

      input2_valid = true unless input2.find { |i| i.size < 1 || i.size > 5 }
    rescue StandardError => e
      puts 'Incorrect input! Please retry.' + e.message
    end
  end

  input3 = nil
  input3_valid = false
  until input3_valid
    begin
      input3 = gets.strip.split(' ')
      if input3.size != input1[1].to_i
        puts 'Incorrect number of words for ransom note! ' + input3.size.to_s
        next
      end

      input3_valid = true unless input3.find { |i| i.size < 1 || i.size > 5 }
    rescue
      puts 'Incorrect input! Please retry.'
    end
  end

  result = 'No'
  result = 'Yes' if (input3 & input2).flat_map { |n| [n]*[input3.count(n), input2.count(n)].min }.sort == input3.sort
  puts result
end
