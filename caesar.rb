require 'pry'

SMALL_CHAR_ALPHABET = "a".ord...(1+"z".ord)
BIG_CHAR_ALPHABET = "A".ord...(1+"Z".ord)
puts BIG_CHAR_ALPHABET.size 

def primitive_caesar_cipher(secret_text, shift)
  ##
  # secret_text (String): The sequence to encrypt or decrypt
  # shift (Integer): Use a positive integer to encrypt and a negative one to decrypt
  secret_text = secret_text.encode!(Encoding::UTF_8).split("")
  secret_text.map! {|char| (char.ord+shift).chr(Encoding::UTF_8)}
  return secret_text.join("")
end

def alphabet_only_caesar_cipher(secret_text, shift)
  ##
  # Applys the caesar chiffre only to characters.
  # 
  # secret_text (String): The sequence to encrypt or decrypt
  # shift (Integer): Use a positive integer to encrypt and a negative one to decrypt

  secret_text = secret_text.encode(Encoding::UTF_8).split("")
  if shift < 0 && shift < -26
    shift = -(-shift%26) + 26
  end
  if shift > -26 && shift < 0
    shift += 26
  end 
  if shift > 26
    shift = shift%26
  end 

  secret_text.map! do |char|
    shifted_char_ord = char.ord + shift
    # new_shift = shift < 0? -1*shift : shift
    # shifted_char_ord = new_shift<26? char.ord + new_shift : char.ord + new_shift%26
    # shifted_char_ord = shift < 0 && new_shift >= 26? shifted_char_ord * -1 : shifted_char_ord
    # TODO %26 für negative Zahlen
    if BIG_CHAR_ALPHABET.include?(char.ord)
      if shifted_char_ord < BIG_CHAR_ALPHABET.first
        shifted_char_ord += 26 
      elsif shifted_char_ord > BIG_CHAR_ALPHABET.last-1
        shifted_char_ord -= 26 
      end
      shifted_char_ord.chr(Encoding::UTF_8)
    elsif SMALL_CHAR_ALPHABET.include?(char.ord) 
      if shifted_char_ord < SMALL_CHAR_ALPHABET.first
        shifted_char_ord += 26 
      elsif shifted_char_ord > SMALL_CHAR_ALPHABET.last-1
        shifted_char_ord -= 26 
      end
      shifted_char_ord.chr(Encoding::UTF_8)
    else 
      char
    end  
  end
  return secret_text.join("")
end 

def test
  # p alphabet_only_caesar_cipher("The quick brown fox jumps over the lazy dog", 1)
  # p alphabet_only_caesar_cipher("Uif!rvjdl!cspxo!gpy!kvnqt!pwfs!uif!mbaz!eph", -1)
  p alphabet_only_caesar_cipher("The quick brown fox jumps over the lazy dog", 13)
  p alphabet_only_caesar_cipher("Gur dhvpx oebja sbk whzcf bire gur ynml qbt", 13)
  p alphabet_only_caesar_cipher("AZaz", 1) # BAba
  p alphabet_only_caesar_cipher("AZaz", -1) #ZYzy
  p alphabet_only_caesar_cipher("AZaz", 27) # BAba
  p alphabet_only_caesar_cipher("AZaz", -27) #ZYzy
  p alphabet_only_caesar_cipher("The quick brown fox jumps over the lazy dog", -27)
  p alphabet_only_caesar_cipher("Sgd pthbj aqnvm enw itlor nudq sgd kzyx cnf", 27)
  p alphabet_only_caesar_cipher("The quick brown fox jumps over the lazy dog", 27)
  p alphabet_only_caesar_cipher("Uif!rvjdl!cspxo!gpy!kvnqt!pwfs!uif!mbaz!eph", -27)
end

test
# puts alphabet_only_caesar_cipher("What a string!", 5)