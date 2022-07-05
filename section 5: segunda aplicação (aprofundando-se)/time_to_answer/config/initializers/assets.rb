# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.

# app/assets
Rails.application.config.assets.precompile += %w( admins_backoffice.js admins_devise.js users_backoffice.js users_devise.js users_devise.css admins_backoffice.css admins_devise.css site.css users_backoffice.css )

# /lib/assets
Rails.application.config.assets.precompile += %w( custom.min.js sb-admin-2.js custom.min.css sb-admin-2.css img.jpg )

# /vendor/assets
Rails.application.config.assets.precompile += %w( jquery-v2.2.4/dist/jquery.min.js )
