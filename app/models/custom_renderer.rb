class CustomRenderer < Redcarpet::Render::HTML

  # not using the below right now
  # attr_accessor :img_path

  # I feel really stupid but I don't know what Sprockets things
  # to include, in what order, and what to configure :(
  # I am FINALLY giving up and just passing "self" from the view
  # because we know that image_tag works there!
  attr_accessor :context

  def image(link, title, alt_text)
    context.send :blog_model_image, link, title, alt_text
  end

end
