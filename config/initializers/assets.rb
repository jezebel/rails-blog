# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
Rails.application.config.assets.paths += Dir.glob("pages/*/").map{|x| File.join Rails.root, x}
Rails.application.config.assets.paths += Dir.glob("posts/*/*/*/").map{|x| File.join Rails.root, x}

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += Dir.glob("pages/*/*.{jpg,png}").map{|x| File.basename(x)}
Rails.application.config.assets.precompile += Dir.glob("posts/*/*/*/*.{jpg,png}").map{|x| File.basename(x)}
