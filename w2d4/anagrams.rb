def first_anagram?(str1, str2)
  str1.split(//).permutation.to_a.include?(str2.split(//))
end

# p first_anagram?("osman", "soman")

def second_anagram?(str1, str2)
  return false if str1.length != str2.length

  split_arry1 = str1.split('')
  split_arry2 = str2.split('')

  str1.length.times do |i|
    str2.length.times do |j|
      if split_arry1[i] == split_arry2[j]
        split_arry1[i] = nil
        split_arry2[j] = nil
        break
      end
    end
  end
  split_arry1.all? {|el| el.nil? }
end

# p second_anagram?('gizmo', 'sally')
# p second_anagram?('elvis', 'lives')

def third_anagram?(str1, str2)
  str1.split(//).sort == str2.split(//).sort
end
p third_anagram?('gizmo', 'sally')
p third_anagram?('elvis', 'lives')

def fourth_anagram?(str1,str2)
  hash1 = Hash.new { |hash, key| hash[key] = 0 }

  str1.each_char do |char|
    hash1[char] +=1

  end
  str2.each_char do |char|
    hash1[char] -=1
  end

  hash1.values.all?{|el| el == 0}
end
p fourth_anagram?('gizmo', 'sally')
p fourth_anagram?('elvis', 'lives')
