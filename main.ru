#?This is a class to save the keyword
class RequestKeyWord
  @keyWordRequested = ''

  def setkeyWordRequested
    puts "Please enter the keyword:"
    @keyWordRequested = gets.chomp
    return @keyWordRequested.downcase.gsub(/[^a-z]/, '') #Removing not alphabetic letters
  end
end

#?This is a classs to save the phrase
class RequestEncriptedPhrase
  @phraseToEncrypt = ''
  def setEncryptedWord
    puts "Please enter the word to encryt:"
    @phraseToEncrypt = gets.chomp
    return @phraseToEncrypt
  end

end

#?This is a class to encrypt the phrase
class EncryptPhrase
  def initialize(keyWord, phraseToEncryptDeconstructed)
    @keyWord = keyWord
    @phraseToEncryptDeconstructed = phraseToEncryptDeconstructed
  end

  def shift_character(char, shift)
    base = char.downcase == char ? 'a'.ord : 'A'.ord
    ((char.ord - base + shift) % 26 + base).chr
  end

  def algorithmToEncrypt()
    key = @keyWord * (@phraseToEncryptDeconstructed.length /  @keyWord.length) +  @keyWord [0...(@phraseToEncryptDeconstructed.length % @keyWord.length)]
    encrypted_text = ''
    @phraseToEncryptDeconstructed.each_char.with_index do |char, index|
      shift = key[index].ord - 'a'.ord
      encrypted_char = shift_character(char, shift)
      encrypted_text << encrypted_char
    end

    return "RESULT\nThe phrase '#{@phraseToEncryptDeconstructed}' encrypted is '#{encrypted_text}' with the keyword '#{@keyWord}'."
  end
end

requestKeyword = RequestKeyWord.new().setkeyWordRequested();
requestPhrase = RequestEncriptedPhrase.new().setEncryptedWord();
phraseEncrypted = EncryptPhrase.new(requestKeyword,requestPhrase).algorithmToEncrypt()
print phraseEncrypted