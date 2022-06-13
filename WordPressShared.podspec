# frozen_string_literal: true

Pod::Spec.new do |s|
  s.name          = 'WordPressShared'
  s.version       = '1.18.0'

  s.summary       = 'Shared components used in building the WordPress iOS apps and other library components.'
  s.description   = <<-DESC
                    Shared components used in building the WordPress iOS apps and other library components.

                    This is the first step required to build WordPress-iOS with UI components.
  DESC

  s.homepage      = 'https://github.com/wordpress-mobile/WordPress-iOS-Shared'
  s.license       = { type: 'GPLv2', file: 'LICENSE' }
  s.author        = { 'The WordPress Mobile Team' => 'mobile@wordpress.org' }

  s.platform      = :ios, '13.0'
  s.swift_version = '5.0'

  s.source        = { git: 'https://github.com/wordpress-mobile/WordPress-iOS-Shared.git', tag: s.version.to_s }
  s.source_files  = 'WordPressShared/**/*.{h,m,swift}'
  s.private_header_files = 'WordPressShared/Private/*.h'
  s.resource_bundles = {
    WordPressShared: ['WordPressShared/Resources/*.{ttf,otf,json}']
  }
  s.exclude_files = 'WordPressShared/Exclude'
  s.header_dir    = 'WordPressShared'

  s.dependency 'CocoaLumberjack', '~> 3.4'
  s.dependency 'FormatterKit/TimeIntervalFormatter', ' ~> 1.8'
end
