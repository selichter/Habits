# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

target 'Habits' do
  use_frameworks!

  pod 'SwiftLint'

  target 'HabitsTests' do
    inherit! :search_paths
    pod 'Nimble', "~> 7.3.1"
    pod 'Quick'
  end

  target 'HabitsUITests' do
    inherit! :search_paths
    pod 'XCTest-Gherkin'
  end

end