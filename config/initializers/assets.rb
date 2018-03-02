# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.precompile += %w( *.eot *.woff *.ttf *.svg *.otf *.png *.jpg *.jpeg *.gif *.scss *.sass *.js bootstrap/dist/css/bootstrap.css font-awesome/css/font-awesome.css common/ionicons.css common/bootstrap-datepicker3.css common/bootstrap-timepicker.css admin-lte/dist/css/AdminLTE.css admin-lte/dist/css/skins/skin-blue.css )

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('vendor', 'node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
