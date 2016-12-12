module ApplicationHelper
  def svg_icon_path name
    file_path = "#{Rails.root}/app/assets/images/icons/icon-#{name}.svg"
    svg_path file_path
  end

  def svg_path file_path
    File.read(file_path).html_safe if File.exists?(file_path)
  end
end
