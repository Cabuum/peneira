# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|

  config.mailer_sender = 'noreply@peneira.co'

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]

  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128

  config.reset_password_within = 6.hours

  config.sign_out_via = [:delete, :get]

  config.omniauth :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
                  { :scope => 'email, offline_access', :provider_ignores_state => true,
                    :client_options =>
                      { :ssl =>
                        { :ca_file => '/usr/lib/ssl/certs/ca-certificates.crt' } } }
end
