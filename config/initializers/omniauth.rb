Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, AppConfig.facebook_app_id, AppConfig.facebook_key, :display => 'popup'
end