source 'https://cdn.cocoapods.org/'

inhibit_all_warnings!
use_frameworks!

platform :ios, '11.0'

def wordpress_shared_pods
  pod 'CocoaLumberjack', '~> 3.4'
  pod 'FormatterKit/TimeIntervalFormatter', '1.8.2'
end

target 'WordPressShared' do
  project 'WordPressShared.xcodeproj'

  wordpress_shared_pods
end

target 'WordPressSharedTests' do
  project 'WordPressShared.xcodeproj'

  wordpress_shared_pods

    pod 'OHHTTPStubs', '~> 8'
    pod 'OHHTTPStubs/Swift', '~> 8'
  pod 'OCMock', '~> 3.4'
  pod 'Specta', '1.0.7'
  pod 'Expecta', '1.0.6'
end

abstract_target 'CLI' do
  # This branch supports remote configurations.
  # See https://github.com/realm/SwiftLint/pull/3058
  pod 'SwiftLint',
    git: 'https://github.com/realm/SwiftLint',
    branch: 'feature/remote-child-parent-configs'
end
