def LongestWord(sen)

  words = sen.split(" ").map do |i|
    /[\w]+/.match(i)
    # puts i
  end
  
  longest = words.max_by do |i|
    i.to_s.length
  end

  # code goes here
  return longest
         
end
   
# keep this function call here    
puts LongestWord(STDIN.gets)
