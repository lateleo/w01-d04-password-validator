require "test_helper"
require_relative "../lib/password_validator.rb"

class PasswordValidatorTest < Minitest::Test
  # We'll try a password with all-lower-case-letters
  def test_rejects_all_lower_case_passwords
    result = at_least_one_caps?("1abjils&a")
    refute(result, "'1abjils&a' should be invalid because it contains no caps")
  end

  # We try a password with a valid mix of upper and lower-case characters
  # on the method that checks for caps.
  def test_caps_accepts_mixed_case_passwords
    result = at_least_one_caps?("1Abjils&a")
    assert(result, "'1Abjils&a' should be valid because it is mixed case")
  end

  # We'll try a password with all-caps
  def test_rejects_all_caps_passwords
    result = at_least_one_lower_case?("1ABJILS&A")
    refute(result, "'1ABJILS&A' should be invalid because it contains no lower-case letters")
  end

  # We try a password with a valid mix of upper and lower-case characters
  # on the method that checks for lowercase.
  def test_lowercase_accepts_mixed_case_passwords
    result = at_least_one_lower_case?("1Abjils&a")
    assert(result, "'1Abjils&a' should be valid because it is mixed case")
  end

  # We try a password of 8 characters, expecting success
  def test_accepts_password_of_8_characters
    result = at_least_eight_characters?("1Abjils&")
    assert(result, "'1ABjils&' has 8 characters, should be valid")
  end

  # We try a password of only 7 characters, expecting rejection
  def test_rejects_password_of_7_characters
    result = at_least_eight_characters?("1Abils&")
    refute(result, "'1ABils&' has 8 characters, should be valid")
  end

  # We try a valid password with numbers
  # on the method that checks for numbers.
  def test_accepts_passwords_with_numbers
    result = at_least_one_number?("1Abjils&a")
    assert(result, "'1Abjils&a' should be valid because it contains a number")
  end

  # We try a password with no numbers
  # on the method that checks for numbers.
  def test_rejects_passwords_without_numbers
    result = at_least_one_number?("Abjils&a")
    refute(result, "'Abjils&a' should be invalid because it contains no numbers")
  end

  # We try a valid password with non-alphanumeric characters
  # on the method that checks for non-alphanumeric characters.
  def test_accepts_passwords_with_non_alphanumerics
    result = at_least_one_non_alphanumeric?("1Abjils&a")
    assert(result, "'1Abjils&a' should be valid because it contains a non-alphanumeric character")
  end

  # We try an invalid password without non-alphanumeric characters
  # on the method that checks for non-alphanumeric characters.
  def test_rejects_passwords_without_non_alphanumerics
    result = at_least_one_non_alphanumeric?("1Abjilsa")
    refute(result, "'1Abjils&a' should be invalid because it doesn't contain a non-alphanumeric character")
  end

  # We try an invalid password containing the substring "password"
  # on the method that checks the presence of the substring "password".
  def test_rejects_passwords_containing_password
    result = doesnt_contain_password?("1Abjpasswordilsa")
    refute(result, "'1Abjpasswordilsa' should be invalid because it contains 'password'")
  end

  # We try a valid password lacking the substring "password"
  # on the method that checks the presence of the substring "password".
  def test_accepts_passwords_not_containing_password
    result = doesnt_contain_password?("1Abjpassilsa")
    assert(result, "'1Abjpassilsa' should be valid because it doesn't contain 'password'")
  end

  def test_valid_password
    result = valid_password?("1Abils&a")
    assert(result, "'1Abils&a' should be valid")
  end
end
