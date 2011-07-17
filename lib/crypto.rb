require 'openssl'
require 'digest/sha2'

module Crypto
  KEY = "2bb80d537b1da3e38bd30361aa855686bde0eacd7162fef6a25fe97bf527a25bd1a3eb8c9aab32ec19cfda810d2ab351873b5dca4e16e7f57b3c1932113314c869a98a49b7fd103058639be84fb88c19c998c8ad3639cfc5deb458018561c847"
      
  def self.encrypt(plain_text)
    crypto = start(:encrypt)

    cipher_text = crypto.update(plain_text)
    cipher_text << crypto.final

    cipher_hex = cipher_text.unpack("H*").join

    return cipher_hex
  end
  
  def self.decrypt(cipher_hex)
    crypto = start(:decrypt)
    
    cipher_text = [cipher_hex].pack("H*")
    
    plain_text = crypto.update(cipher_text)
    plain_text << crypto.final

    return plain_text
  end

  private

  def self.start(mode)
    crypto = OpenSSL::Cipher::Cipher.new('aes-256-ecb').send(mode)
    crypto.key = Digest::SHA256.hexdigest(KEY)
    return crypto
  end
end
