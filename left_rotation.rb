# A left rotation operation on an array of size  shifts each of the array's elements  unit to the left. For example, if  left rotations are performed on array , then the array would become .
#
# Given an array of  integers and a number, , perform  left rotations on the array. Then print the updated array as a single line of space-separated integers.
#
# Input Format
#
# The first line contains two space-separated integers denoting the respective values of  (the number of integers) and (the number of left rotations you must perform).
# The second line contains  space-separated integers describing the respective elements of the array's initial state.
#
#     Constraints
# 1<= n <= 10**5
# 1<= d <= n
# 1<= ai <= 10**6
#
# Output Format
#
# Print a single line of  space-separated integers denoting the final state of the array after performing  left rotations.

input1_valid = false
until input1_valid
  begin
    input1 = gets.strip.split(' ')

    if input1.size != 2
      puts 'First input line should consist of 2 integers!'
      next
    end

    unless input1[0].to_i >= 1 && input1[0].to_i <= 10**5
      puts 'The size of the table is not correct.'
      next
    end

    unless input1[1].to_i >= 1 && input1[1].to_i <= input1[0].to_i
      puts 'The rotation size is not correct.'
      next
    end

    input1_valid = true
  rescue
    puts 'Incorrect input! Please retry.'
  end
end

input2_valid = false
until input2_valid
  begin
    input2 = gets.strip.split(' ')
    if input2.size != input1[0].to_i
      puts 'Incorrect number of integers!'
      next
    end

    input2_valid = true
    input2.each do |i|
      next if i.to_i >= 1 && i.to_i <= 10**6
      puts 'Incorrect argument detected.'
      input2_valid = false
      break
    end
  rescue
    puts 'Incorrect input! Please retry.'
  end
end

temp = input2.dup
input2.each_with_index do |i, j|
  if j - input1[1].to_i < 0
    k = j - input1[1].to_i + input1[0].to_i
    temp[k] = i
  else
    temp[j - input1[1].to_i] = i
  end
end

s = ''
temp.each do |i|
  s += i.to_s + ' '
end
puts s
