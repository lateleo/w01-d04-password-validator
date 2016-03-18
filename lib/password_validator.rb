#require "pry"

def valid_password?(password)
  (password != password.downcase) &&
  (password != password.upcase) &&
  (password.length >= 8) &&
  (/[0-9]/.match(password) != nil) &&
  (/[^0-9A-Z]/.match(password.upcase) != nil) &&
  not_forbidden?(password)
end

def not_forbidden?(password)
  forbidden_words = ["password"] # can add words to this list as necessary.
  result = true
  forbidden_words.each {|word| result = false if password.downcase.include?(word)}
  result
end


#binding.pry
