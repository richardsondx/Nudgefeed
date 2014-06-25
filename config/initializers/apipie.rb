Apipie.configure do |config|
  config.app_name                = "Nudgefeed"
  config.api_base_url            = "/api"
  config.doc_base_url            = "/apidoc"
  # where is your API defined?
  config.api_controllers_matcher = ["#{Rails.root}/app/controllers/api/v1/*.rb", "#{Rails.root}/app/controllers/api/v1/main/*.rb"]
end
