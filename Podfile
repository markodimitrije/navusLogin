# Uncomment the next line to define a global platform for your project
 platform :ios, '11.0'

target 'navusLogin' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

    pod 'RxSwift'
    pod 'RxCocoa'
    pod 'ReachabilitySwift', '~> 4.0.0'
    pod 'SwiftyJSON'

  target 'navusLoginTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'RxBlocking', '~> 5.0'
    pod 'RxTest',     '~> 5.0'
  end

  target 'navusLoginUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        if target.name == 'RxSwift'
            target.build_configurations.each do |config|
                if config.name == 'Debug'
                    config.build_settings['OTHER_SWIFT_FLAGS'] ||= ['-D', 'TRACE_RESOURCES']
                end
            end
        end
    end
end
