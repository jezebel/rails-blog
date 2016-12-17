class Page < BlogModel
  METADATA += [
    :label, # label for nav
  ]

  DEFAULT_DIR = 'pages'

  attr_accessor *METADATA

  def self.all dir: DEFAULT_DIR, path: nil
    super.sort_by{|page| page.slug}
  end

  def label
    @label ||= title
  end
end
