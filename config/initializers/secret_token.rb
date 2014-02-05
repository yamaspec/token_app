# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
   token_file = Rails.root.join('.secret')
   if File.exist?(token_file)
      # Use the existing token.
      File.read(token_file).chomp
   else
      # Generate a new token and store it in token_file.
      token = SecureRandom.hex(64)
      File.write(token_file, token)
      token
   end
end

TokenApp::Application.config.secret_key_base = 'b3a292d9441f1324b66dbdbb778316784995dbdda5e519183fe55ae724d759a5100659326cb6d9ff59551c4128ae92f8eafc5eb1eb32b5e0c3207ec78e9b7daf'
