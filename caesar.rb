require 'pry'

SMALL_CHAR_ALPHABET = "a".ord.."z".ord
BIG_CHAR_ALPHABET = "A".ord.."Z".ord

def primitive_caesar_cipher(secret_text, shift)
  ##
  # secret_text (String): The sequence to encrypt or decrypt
  # shift (Integer): Use a positive integer to encrypt and a negative one to decrypt
  secret_text = secret_text.encode!(Encoding::UTF_8).split("")
  secret_text.map! {|char| (char.ord+shift).chr(Encoding::UTF_8)}
  return secret_text.join("")
end

def alphabet_only_caesar_cipher(secret_text, shift)
  secret_text = secret_text.encode!(Encoding::UTF_8).split("")
  secret_text = secret_text.map do |char|
    shifted_char_ord = shift<26 && shift>-26? char.ord + shift : char.ord + shift%26
    if BIG_CHAR_ALPHABET.include?(char.ord)
      if shifted_char_ord < BIG_CHAR_ALPHABET.first
        shifted_char_ord += 26 
      elsif shifted_char_ord > BIG_CHAR_ALPHABET.last
        shifted_char_ord -= 26 
      end
      shifted_char_ord.chr(Encoding::UTF_8)
    elsif SMALL_CHAR_ALPHABET.include?(char.ord) 
      if shifted_char_ord < SMALL_CHAR_ALPHABET.first
        shifted_char_ord += 26 
      elsif shifted_char_ord > SMALL_CHAR_ALPHABET.last
        shifted_char_ord -= 26 
      end
      shifted_char_ord.chr(Encoding::UTF_8)
    else 
      char
    end  
  end
  return secret_text.join("")
end 

p alphabet_only_caesar_cipher("The quick brown fox jumps over the lazy dog", 1)
p alphabet_only_caesar_cipher("Uif!rvjdl!cspxo!gpy!kvnqt!pwfs!uif!mbaz!eph", -1)
p alphabet_only_caesar_cipher("The quick brown fox jumps over the lazy dog", 13)
p alphabet_only_caesar_cipher("Gur dhvpx oebja sbk whzcf bire gur ynml qbt", -13)
p alphabet_only_caesar_cipher("AZaz", 1)
p alphabet_only_caesar_cipher("ZAza", -1)
p alphabet_only_caesar_cipher("The quick brown fox jumps over the lazy dog", 27)
p alphabet_only_caesar_cipher("Uif!rvjdl!cspxo!gpy!kvnqt!pwfs!uif!mbaz!eph", -27)
