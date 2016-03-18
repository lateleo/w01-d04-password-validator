#require "pry"

def valid_password?(password)
    at_least_one_caps?(password) &&
    at_least_eight_characters?(password) &&
    at_least_one_lower_case?(password) &&
    at_least_one_number?(password) &&
    at_least_one_non_alphanumeric?(password) &&
    doesnt_contain_password?(password)
end

# Takes a string
# Returns true or false depending on if the string
# has at least one capital letter
def at_least_one_caps?(password)
  password != password.downcase
end

# Takes a string
# Returns true or false depending on if the string
# has at least one lower-case letter
def at_least_one_lower_case?(password)
  password != password.upcase
end

# Takes a string
# Returns true or false depending on if the string
# is at least 8 characters long.
def at_least_eight_characters?(password)
  password.length >= 8
end

# Takes a string
# Returns true or false depending on if the string
# contains at least one numeric character.
def at_least_one_number?(password)
  password.chars.each do |char|
    return true if ("0".."9").include?(char)
  end
  false
end

# Takes a string
# Returns true or false depending on if the string
# contains at least one non-alphanumeric character.
def at_least_one_non_alphanumeric?(password)
  password.upcase.chars.each do |char|
    return true if !("0".."9").include?(char) && !("A".."Z").include?(char)
  end
  false
end

# Takes a string
# Returns true or false depending on if the string
# contains the substring "password".
def doesnt_contain_password?(password)
  !password.downcase.include?("password")
end

#binding.pry
