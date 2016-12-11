class BlogModel
  include ActiveModel
  include HasMarkdown

  METADATA = [
    :title,    # title
    :subtitle, # displays below title
    :image,    # feature image
    :caption,  # text below image (optional)
  ]

  attr_accessor *METADATA
  attr_accessor :markdown

  # /pages/:slug/:slug.md
  # /posts/:year/:month/NN-slug/NN-slug.md
  def self.all dir
    Dir.glob("#{dir}/**/**/**/*.md").map do |filename|
      # if invalid, return nil
      self.new(filename)
    end.compact
  end

  def self.find slug
    all.detect{|x| x.slug == slug}
  end

  def initialize filename
    @slug     = File.basename(filename).gsub(/.md/, '')
    @markdown = File.read(filename)

    if @markdown =~ /^(-{3,}\s*\n.*?\n?)^(-{3,}\s*$\n?)/m
      @markdown = @markdown[($1.size + $2.size)..-1]
      set_metadata YAML.load($1) || {}
    end
  end

  def slug
    @slug
  end

  def title
    @title ||= @slug.titleize # or do I want blank?
  end

  private

  def set_metadata metadata_hash
    metadata_hash.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end
end
