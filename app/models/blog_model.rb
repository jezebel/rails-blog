class BlogModel
  include ActiveModel

  METADATA = [
    :title,        # title
    :subtitle,     # displays below title
    :image,        # feature image
    :caption,      # text below image (optional)
    :layout,       # override which view to use
    :permalink,    # in-case can't use slug?
    :published_at,
  ]

  attr_accessor *METADATA

  attr_accessor :markdown

  # /pages/:slug/:slug.md
  # /posts/:year/:month/NN-slug/NN-slug.md
  def self.all dir, site: nil
    Dir.glob("#{dir}/**/*.md").map do |filename|
      # if invalid, return nil
      self.new(filename, site: site)
    end.compact
  end

  def self.find slug
    all.detect{|x| x.slug == slug}
  end

  def initialize filename, site: nil
    @img_path  = File.join('/', File.dirname(filename))
    # @img_path = Rails.root.join(File.dirname(filename))
    @slug      = File.basename @img_path
    @markdown  = File.read filename
    @site      = site || Rails.application.config.site_config

    if @markdown =~ /^(-{3,}\s*\n.*?\n?)^(-{3,}\s*$\n?)/m
      @markdown = @markdown[($1.size + $2.size)..-1]
      set_metadata YAML.load($1) || {}
    end
  end

  def id
    slug
  end

  def slug
    @slug
  end

  def title
    @title ||= @slug.titleize # or do I want blank?
  end

  def publish!
    @published_at = Time.now
  end

  def html parser = @site.parser
    parser.renderer.img_path = @img_path
    parser.render(markdown).html_safe
  end

  private

  def set_metadata metadata_hash
    metadata_hash.each do |key, value|
      send("#{key}=", value)
    end
  end
end
