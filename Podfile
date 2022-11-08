# frozen_string_literal: true

source 'https://cdn.cocoapods.org/'

inhibit_all_warnings!
use_frameworks!

platform :ios, '13.0'

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

  pod 'OHHTTPStubs', '~> 9.0'
  pod 'OHHTTPStubs/Swift', '~> 9.0'
  pod 'OCMock', '~> 3.4'
  pod 'Quick', '~> 6.0'
  pod 'Expecta', '1.0.6'
end
