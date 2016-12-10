class SiteConfig
  def initialize
    config = YAML.load_file(Rails.root.join('config', "config.yml"))
    process_hash(config)
    self
  end

  private

  def process_hash(config_hash)
    config_hash.each do |key, value|
      if value.is_a? Hash
        process_hash(value)
      else
        self.class.send(:attr_accessor, key.to_sym)
        instance_variable_set("@#{key}", value)
      end
    end
  end
end

Rails.application.config.site_config = SiteConfig.new
