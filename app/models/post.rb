class Post < BlogModel
  METADATA += [
    :date, # datetime
    :tags,
  ]

  DEFAULT_DIR = 'posts'

  attr_accessor *METADATA

  def self.all dir: DEFAULT_DIR, path: nil
    super.sort_by{|post| [post.date, post.slug]}.reverse
  end

  def date_to_s
    date.try!(:strftime, '%F')
  end

  def time_to_s
    date.try!(:strftime, '%H%M')
  end
end
