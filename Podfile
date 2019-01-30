source 'https://github.com/CocoaPods/Specs.git'

inhibit_all_warnings!
use_frameworks!

platform :ios, '10.0'

target 'WordPressShared' do
  project 'WordPressShared.xcodeproj'

  pod 'CocoaLumberjack', '~> 3.4'

  target 'WordPressSharedTests' do
    inherit! :search_paths

    pod 'OHHTTPStubs', '6.1.0'
    pod 'OHHTTPStubs/Swift', '6.1.0'
    pod 'OCMock', '~> 3.4'
    pod 'Specta', '1.0.7'
    pod 'Expecta', '1.0.6'
  end
end
