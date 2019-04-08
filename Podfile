source 'https://github.com/CocoaPods/Specs.git'

inhibit_all_warnings!
use_frameworks!

platform :ios, '10.0'

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

  pod 'OHHTTPStubs', '6.1.0'
  pod 'OHHTTPStubs/Swift', '6.1.0'
  pod 'OCMock', '~> 3.4'
  pod 'Specta', '1.0.7'
  pod 'Expecta', '1.0.6'
end
