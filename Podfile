# Uncomment the next line to define a global platform for your project
 platform :ios, '14.2'

target 'foodCatalogue' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for foodCatalogue
  pod 'Alamofire'
  pod 'SDWebImage'
  pod 'RealmSwift'
  pod 'RxSwift'
  pod 'FoodCatalogueModule', :git => 'https://github.com/AldoVernando/FoodCatalogueModuleLib.git'
  pod 'FoodDetailModule', :git => 'https://github.com/AldoVernando/FoodDetailModuleLib.git'
  pod 'FavoriteFoodModule', :git => 'https://github.com/AldoVernando/FavoriteFoodModuleLib.git'

  target 'foodCatalogueTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'foodCatalogueUITests' do
    # Pods for testing
  end

  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
      end
    end
  end
  
end
