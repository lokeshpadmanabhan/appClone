# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'

target 'appClone' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for appClone

  target 'appCloneTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'appCloneUITests' do
    # Pods for testing
  end

pod 'Appirater'
pod 'SDWebImage', '~> 5.0'
# firebase
pod 'FirebaseAnalytics'
pod 'FirebaseAuth'
pod 'FirebaseCrashlytics'
pod 'FirebaseFirestore'
pod 'FirebaseDatabase'
pod 'FirebaseFunctions'
pod 'FirebaseStorage'

end

post_install do |installer|
     installer.generated_projects.each do |project|
           project.targets.each do |target|
               target.build_configurations.each do |config|
                   config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
                end
           end
    end
 end
