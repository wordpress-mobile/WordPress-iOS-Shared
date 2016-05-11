Pod::Spec.new do |s|
  s.name         = "WordPress-iOS-Shared"
  s.version      = "0.5.10"
  s.summary      = "Shared components used in building the WordPress iOS apps and other library components."

  s.description  = <<-DESC
                   Shared components used in building the WordPress iOS apps and other library components.

                   This is the first step required to build WordPress-iOS with UI components.
                   DESC

  s.homepage     = "http://apps.wordpress.com"
  s.license      = "GPLv2"
  s.author             = { "Automattic" => "mobile@automattic.com", "Aaron Douglas" => "astralbodies@gmail.com", "Diego Rey Mendez" => "diegoreymendez@gmail.com", "Sergio Estevao" => "sergioestevao@gmail.com" }
  s.social_media_url   = "http://twitter.com/WordPressiOS"
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/wordpress-mobile/WordPress-iOS-Shared.git", :tag => s.version.to_s }
  s.source_files = 'WordPress-iOS-Shared/Core/*.{h,m,swift}', 'WordPress-iOS-Shared/Private/*.{h,m,swift}'
  s.private_header_files = "WordPress-iOS-Shared/Private/*.h"
  s.ios.resource_bundle = { 'WordPress-iOS-Shared' => 'WordPress-iOS-Shared/Assets/*.{ttf,otf}' }
  s.exclude_files = 'WordPress-iOS-Shared/Exclude'
  s.prefix_header_file = "WordPress-iOS-Shared/WordPress-iOS-Shared-Prefix.pch"
  s.requires_arc = true
  s.header_dir = 'WordPressShared'

  s.dependency 'CocoaLumberjack', '~> 2.2.0'
end
