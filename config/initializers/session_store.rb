# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_scavnet_session',
  :secret      => 'cf5cbc0976675e1de7cc76da35f8e6f4c01fd243acb8e17ec6bcdad0c912b1dd4816277f04affa3008722a50578db65f4149e6b90ef13fad697b33f1009bfeed'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
