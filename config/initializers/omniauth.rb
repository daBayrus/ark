fb = YAML.load_file(Rails.root.join("config/facebook.yml"))[Rails.env]

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, fb['app_id'], fb['secret_key']
  #provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
end

