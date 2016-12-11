class Post < BlogModel
  METADATA += [
    :date, # datetime
  ]

  DEFAULT_DIR = 'posts'

  attr_accessor *METADATA

  def self.all dir = DEFAULT_DIR
    super.sort_by{|post| [post.date, post.slug]}.reverse
  end

  def date_to_s
    date.strftime('%F')
  end

  def time_to_s
    date.strftime('%T') # %H%M.%S
  end
end
