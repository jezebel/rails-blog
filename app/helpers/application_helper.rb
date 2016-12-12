module ApplicationHelper
  def svg_icon_path name
    file_path = "#{Rails.root}/app/assets/images/icons/icon-#{name}.svg"
    svg_path file_path
  end

  def svg_path file_path
    File.read(file_path).html_safe if File.exists?(file_path)
  end

  def blog_model_image src, title, alt
    content_tag :figure, class: 'post-image' do
      image_tag src, alt: alt do
        content_tag :figcaption do
          "-- #{title}"
        end
      end
    end
  end

  def html_from_markdown(text)
    options = {
      filter_html:     true,
      hard_wrap:       false,
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true,
      fenced_code_blocks: true
    }

    extensions = {
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: false
    }

    renderer = CustomRenderer.new(options)
    parser   = Redcarpet::Markdown.new(renderer, extensions)
    renderer.context = self
    parser.render(text).html_safe
  end
end
