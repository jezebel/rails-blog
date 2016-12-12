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
end
