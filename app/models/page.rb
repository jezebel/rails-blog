class Page < BlogModel
  METADATA += [
    :label, # label for nav
  ]

  DEFAULT_DIR = 'pages'

  attr_accessor *METADATA

  def self.all dir = DEFAULT_DIR, site: nil
    super.sort_by{|page| page.slug}.reverse
  end

  def label
    @label ||= title
  end
end
