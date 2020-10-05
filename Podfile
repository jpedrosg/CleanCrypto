# Uncomment the next line to define a global platform for your project
 platform :ios, '13.2'

target 'CleanCrypto' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  # Pods Project:
  pod 'SDWebImage'
  pod 'PromiseKit'
  pod 'OHHTTPStubs/Swift'
  
  target 'CleanCryptoTests' do
    inherit! :search_paths
    # Pods Unit Tests:
    pod 'Nimble', '8.0.4'
    pod 'Quick', '2.2.0'
  end

  target 'CleanCryptoSnapshotsTests' do
    # Pods for Snapshots Tests:
    inherit! :search_paths
    pod 'iOSSnapshotTestCase'
    pod 'KIF', :configurations => ['Debug']
    pod 'KIF/IdentifierTests', :configurations => ['Debug']
  end

end
