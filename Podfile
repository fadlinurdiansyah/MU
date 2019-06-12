# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'MU' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

pod 'Firebase/Core', '~> 4.9.0'
pod 'Firebase/Storage'
pod 'Firebase/Auth'
pod 'Firebase/Database'
pod 'SwiftyJSON'
pod 'Alamofire'
pod 'AlamofireNetworkActivityLogger'
pod 'SDWebImage', '~> 5.0'
pod 'NVActivityIndicatorView'
pod 'SwiftyOnboard'
pod 'CHIPageControl'
pod 'ReachabilitySwift'
pod 'UIScrollView-InfiniteScroll'
pod 'PullToRefresher'
pod 'Hero'
pod 'Parchment'
pod 'XLPagerTabStrip'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    if ['SwiftyJSON', 'ReachabilitySwift', 'NVActivityIndicatorView', 'Parchment','XLPagerTabStrip'].include? target.name
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '4.2'
      end
    end
  end
end
