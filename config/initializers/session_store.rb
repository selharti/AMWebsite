# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_AgileWebSite_session',
  :secret      => 'dda6c1dbad92d3dc3a31845d366de8275bce4997172c403ca9ca6ea4b3889042d6c44736c7624cbcc7e8b68326394a6e23d3ca8273528c9b361645290e559da8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
ActionController::Base.session_store = :active_record_store
