# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  # Set up authentication.
  # In this application, LDAP information may be provided in an initializer
  # (see config/initializers/ldap_intializer.rb.sample). It may also be skipped
  # if not using LDAP. CAS information should be provided in an intializer or
  # environment.rb (see config/initializers/cas_initializer.rb.sample) or 
  # ruby-cas documentaiton.
  authenticate_rpi User, :username_field => 'rcsid', 
    :admin_field => 'is_admin', :autoadd_users => true,
    :fullname_field => 'name', :sudo_enabled => true,
    :ldap_address => LDAP_ADDRESS, :ldap_port => LDAP_PORT,
    :ldap_dn => LDAP_DN
end
