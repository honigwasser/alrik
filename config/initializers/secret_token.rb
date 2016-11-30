# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

# Although this is not needed for an api-only application, rails4
# requires secret_key_base or secret_token to be defined, otherwise an
# error is raised.
# Using secret_token for rails3 compatibility. Change to secret_key_base
# to avoid deprecation warning.
# Can be safely removed in a rails3 api-only application.
HeldenApi::Application.config.secret_token = '12453c39415d12de9088190127e94a1446cb0f86a530685c2c6bc139d806353a9bae03646e0176bb4a3c6e3aee86ce2a70f817b9ca1e98f94f4eab2353a97100' # rubocop:disable LineLength
HeldenApi::Application.config.secret_key_base = '12453c39415d12de9088190127e94a1446cb0f86a530685c2c6bc139d806353a9bae03646e0176bb4a3c6e3aee86ce2a70f817b9ca1e98f94f4eab2353a97100' # rubocop:disable LineLength
