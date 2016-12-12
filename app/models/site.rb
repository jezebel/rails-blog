class Site
  attr_accessor :pages, :posts, :tags, :title, :author, :description

  SOCIAL_MEDIA = [
    :mail, :github, :twitter, :lastfm
  ]

  attr_accessor *SOCIAL_MEDIA

  def initialize
    @config = YAML.load_file(Rails.root.join('config', "config.yml"))

    @config['sources'].each{|x| process_source x}
    @config['social'].each{|k, v| process_social k, v}

    @title       = @config['title']
    @author      = @config['author']
    @description = @config['description']
  end

  def social_media
    self.class::SOCIAL_MEDIA
  end

  private

  def process_source source
    klass = source.singularize.titleize.constantize
    instance_variable_set "@#{source}", klass.send(:all, source)
  end

  def process_social service, username
    return unless username.present?

    instance_variable_set "@#{service}", social_urls(username, service)
  end

  def social_urls username, service
    {
      mail:    "mailto:#{username}",
      github:  "https://github.com/#{username}",
      twitter: "https://twitter.com/#{username}",
      lastfm:  "http://www.last.fm/user/#{username}",
    }[service.to_sym]
  end
end
