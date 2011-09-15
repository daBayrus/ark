module Facebook
  config = YAML.load_file(Rails.root.join("config/facebook.yml"))[Rails.env]
  APP_ID     = config["app_id"]
  SECRET_KEY = config["secret_key"]

  class << self

    def image_url(id)
      "http://graph.facebook.com/#{id}/picture"
    end

  end

end
