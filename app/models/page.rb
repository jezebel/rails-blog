class Page < BlogModel
  METADATA += [
    :label, # label for nav
  ]

  attr_accessor *METADATA

  def self.all dir = 'pages'
    super.sort_by{|page| page.slug}.reverse
  end

  def label
    @label ||= title
  end

  private


end
