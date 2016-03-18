require "test_helper"
require_relative "../lib/password_validator.rb"

class PasswordValidatorTest < Minitest::Test
  # We'll try a password with all-lower-case-letters
  def test_rejects_all_lower_case_passwords
    result = valid_password?("1abjils&a")
    refute(result, "'1abjils&a' should be invalid because it contains no caps")
  end

  # We'll try a password with all-caps
  def test_rejects_all_caps_passwords
    result = valid_password?("1ABJILS&A")
    refute(result, "'1ABJILS&A' should be invalid because it contains no lower-case letters")
  end

  # We try a password of only 7 characters, expecting rejection
  def test_rejects_password_of_7_characters
    result = valid_password?("1Abils&")
    refute(result, "'1ABils&' should be invalid because it only has 7 characters")
  end

  # We try a password with no numbers
  # on the method that checks for numbers.
  def test_rejects_passwords_without_numbers
    result = valid_password?("Abjils&a")
    refute(result, "'Abjils&a' should be invalid because it contains no numbers")
  end

  # We try an invalid password without non-alphanumeric characters
  # on the method that checks for non-alphanumeric characters.
  def test_rejects_passwords_without_non_alphanumerics
    result = valid_password?("1Abjilsa")
    refute(result, "'1Abjils&a' should be invalid because it has no non-alphanumeric characters")
  end

  # We try an invalid password containing the substring "password"
  # on the method that checks the presence of the substring "password".
  def test_rejects_passwords_containing_forbidden_words
    result = valid_password?("1Abjpasswordils&a")
    refute(result, "'1Abjpasswordils&a' should be invalid because it contains 'password'")
  end

  def test_valid_password
    result = valid_password?("1Abils&a")
    assert(result, "'1Abils&a' should be valid")
  end
end
