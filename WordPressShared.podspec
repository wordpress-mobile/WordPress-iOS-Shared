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
  s.source_files  = 'Sources/WordPressShared/**/*.swift', 'Sources/WordPressSharedObjC/**/*.{h,m}'
  s.public_header_files = 'Sources/WordPressSharedObjC/include', 'Sources/WordPressSharedObjC/WordPressShared.h'
  s.private_header_files = 'Sources/WordPressSharedObjC/Private/*.h'
  s.resource_bundles = {
    WordPressShared: [
        'Sources/WordPressShared/Resources/*.{ttf,otf,json}',
        'Sources/WordPressSharedObjC/Resources/*.{ttf,otf,json}',
    ]
  }

  s.dependency 'CocoaLumberjack', '~> 3.4'

  s.test_spec do |test|
    test.source_files = [
      'Tests/WordPressSharedTests/**/*.{swift}',
      'Tests/WordPressSharedTestsObjC/**/*.{h,m}',
    ]
    test.resources = 'Tests/WordPressSharedObjCTests/Resources/*.{jpg,gif}'

    test.dependency 'OHHTTPStubs', '~> 9.0'
    test.dependency 'OHHTTPStubs/Swift', '~> 9.0'
    test.dependency 'OCMock', '~> 3.4'
    test.dependency 'Quick', '~> 6.0'
  end
end
