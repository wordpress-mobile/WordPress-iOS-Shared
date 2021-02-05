Pod::Spec.new do |s|
  s.name          = "WordPressShared"
  s.version       = "1.15.0-beta.1"
  s.summary       = "Shared components used in building the WordPress iOS apps and other library components."

  s.description   = <<-DESC
                    Shared components used in building the WordPress iOS apps and other library components.

                    This is the first step required to build WordPress-iOS with UI components.
                    DESC

  s.homepage      = "https://github.com/wordpress-mobile/WordPress-iOS-Shared"
  s.license       = "GPLv2"
  s.author        = { "WordPress" => "mobile@automattic.com" }
  s.platform      = :ios, "11.0"
  s.swift_version = '5.0'
  s.source        = { :git => "https://github.com/wordpress-mobile/WordPress-iOS-Shared.git", :tag => s.version.to_s }
  s.source_files  = 'WordPressShared/**/*.{h,m,swift}'
  s.private_header_files = "WordPressShared/Private/*.h"
  s.resource_bundles = {
    'WordPressShared': ['WordPressShared/Resources/*.{ttf,otf,json}']
  }
  s.exclude_files = 'WordPressShared/Exclude'
  s.requires_arc  = true
  s.header_dir    = 'WordPressShared'

  s.dependency 'CocoaLumberjack', '~> 3.4'
  s.dependency 'FormatterKit/TimeIntervalFormatter', ' ~> 1.8'
end
