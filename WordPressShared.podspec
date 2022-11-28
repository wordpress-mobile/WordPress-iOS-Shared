# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

# Helper to lookup ObjC source files
module Lookup
  def self.objc_files
    directory = Pathname.new('Sources/WordPressSharedObjC')
    include_dir = directory.join('include')
    public_header_files = include_dir.glob('*.h')
                                     .map { |link| link.realpath.relative_path_from(Dir.pwd) }
    source_files = directory.glob('**/*.{h,m}').reject { |file| (file <=> include_dir) == 1 }
    {
      source_files: source_files.map(&:to_s),
      public_header_files: public_header_files.map(&:to_s)
    }
  end
end

Pod::Spec.new do |s|
  s.name          = 'WordPressShared'
  s.version       = '2.0.0-beta.2'

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
  s.source_files  = ['Sources/WordPressShared/**/*.swift'] + Lookup.objc_files[:source_files]
  s.public_header_files = ['Sources/WordPressSharedObjC/WordPressShared.h'] + Lookup.objc_files[:public_header_files]
  s.resource_bundles = {
    WordPressShared: [
      'Sources/WordPressShared/Resources/*.{ttf,otf,json}',
      'Sources/WordPressSharedObjC/Resources/*.{ttf,otf,json}'
    ]
  }

  s.test_spec do |test|
    test.source_files = [
      'Tests/WordPressSharedTests/**/*.{swift}',
      'Tests/WordPressSharedTestsObjC/**/*.{h,m}'
    ]
    test.resources = 'Tests/WordPressSharedObjCTests/Resources/*.{jpg,gif}'

    test.dependency 'OHHTTPStubs', '~> 9.0'
    test.dependency 'OHHTTPStubs/Swift', '~> 9.0'
    test.dependency 'OCMock', '~> 3.4'
    test.dependency 'Quick', '~> 6.0'
  end
end

# rubocop:enable Metrics/BlockLength
