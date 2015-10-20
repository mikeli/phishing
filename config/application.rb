require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"




Bundler.require(*Rails.groups)

module RailsSaml
  class Application < Rails::Application
	config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif,
"fontawesome-webfont.ttf",
"fontawesome-webfont.eot",
"fontawesome-webfont.svg",
"fontawesome-webfont.woff")


	config.assets.precompile << Proc.new do |path|
	  if path =~ /\.(css|js)\z/
	    full_path = Rails.application.assets.resolve(path).to_path
	    app_assets_path = Rails.root.join('app', 'assets').to_path
	    if full_path.starts_with? app_assets_path
	      puts "including asset: " + full_path
	      true
	    else
	      puts "excluding asset: " + full_path
	      false
	    end
	  else
	    false
	  end
	end
  end
end

