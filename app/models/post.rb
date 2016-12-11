class Post < BlogModel
  METADATA += [
    :date, # datetime
  ]

  attr_accessor *METADATA

  def self.all dir = 'posts'
    super.sort_by{|post| [post.date, post.slug]}.reverse
  end

  def date_to_s
    date.strftime('%F')
  end

  def time_to_s
    date.strftime('%T') # %H%M.%S
  end
end
