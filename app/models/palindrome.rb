module Palindrome

  def self.palindrome?(word)
    word[0..word.size / 2].casecmp(
      word.reverse[0..word.size / 2].downcase
    ).zero?
  end

end