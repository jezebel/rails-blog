module SiteConfig
  def self.call
    _config = YAML.load_file(Rails.root.join('config', "config.yml"))
    Rails.application.config.site_config = OpenStruct.new(_config)
  end
end

SiteConfig.call
