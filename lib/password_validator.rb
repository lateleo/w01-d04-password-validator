#require "pry"

# Returns true or false based on whether or not the password is valid.
def valid_password?(password)
  (password != password.downcase) &&
  (password != password.upcase) &&
  (password.length >= 8) &&
  (/[0-9]/.match(password) != nil) &&
  (/[^0-9A-Z]/.match(password.upcase) != nil) &&
  not_forbidden?(password)
end

# Returns true or false based on whether or not
# the password contains no forbidden words.
def not_forbidden?(password)
  forbidden_words = ["password"] # can add words to this list as necessary.
  result = true
  forbidden_words.each {|word| result = false if password.downcase.include?(word)}
  result
end


#binding.pry
