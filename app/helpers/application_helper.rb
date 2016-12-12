module ApplicationHelper
  def svg_icon_path name
    file_path = "#{Rails.root}/app/assets/images/icons/icon-#{name}.svg"
    svg_path file_path
  end

  def svg_path file_path
    File.read(file_path).html_safe if File.exists?(file_path)
  end

  def blog_model_image blog_model
    image   = blog_model.image
    caption = blog_model.caption

    content_tag :figure, class: 'post-image' do
      image_tag image, alt: caption do
        content_tag :figcaption do
          "-- #{caption}"
        end
      end
    end
  end
end
