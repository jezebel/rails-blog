atom_feed(
  root_url: 'https://ana.dj',
  url: 'https://ana.dj' + request.path
) do |feed|
  feed.title site.title
  feed.updated @posts[0].date if @posts.length > 0

  @posts.each do |post|
    feed.entry(post,
               url: post_url(post.id, port: 443, format: 'html'),
               published: post.date
    ) do |entry|
      entry.title post.title
      entry.content post.html(self, parser: site.parser), type: 'html'

      entry.author do |author|
        author.name site.author
      end
    end
  end
end
