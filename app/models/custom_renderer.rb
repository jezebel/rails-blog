class CustomRenderer < Redcarpet::Render::HTML

  include ActionView::Helpers::AssetTagHelper
  include ActionView::Context

  attr_accessor :asset_path

  def image(link, title, alt_text)
    content_tag :figure, class: 'post-image' do
      # image_tag File.join(asset_path, link), alt: alt_text, title: title do
      image_tag image_path(link), alt: alt_text, title: title do
        content_tag :figcaption do
          "-- #{title}"
        end
      end
    end
  end

end
