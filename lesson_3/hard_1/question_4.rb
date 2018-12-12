# IP checker

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  if dot_separated_words.size == 4 
    while dot_separated_words.size > 0 do
      word = dot_separated_words.pop
    
      break unless is_an_ip_number?(word)
    end
    return true
  else
    p "The IP is not a valid length."
    return false
  end
end


p dot_separated_ip_address?('324.45.345.3')