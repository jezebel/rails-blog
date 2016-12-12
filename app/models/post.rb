class Post < BlogModel
  METADATA += [
    :date, # datetime
    :tags,
  ]

  DEFAULT_DIR = 'posts'

  attr_accessor *METADATA

  def self.all dir = DEFAULT_DIR, site: nil
    super.sort{|post| post.date}.reverse
  end

  def date_to_s
    date.try!(:strftime, '%F')
  end

  def time_to_s
    date.try!(:strftime, '%T') # %H%M.%S
  end
end
