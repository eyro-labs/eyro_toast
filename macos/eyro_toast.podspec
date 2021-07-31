#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint eyro_toast.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'eyro_toast'
  s.version          = '0.0.1'
  s.summary          = 'A simple yet powerful Flutter plugin for showing Toast Mobile, Desktop and Web.'
  s.description      = <<-DESC
A simple yet powerful Flutter plugin for showing Toast Mobile, Desktop and Web.
                       DESC
  s.homepage         = 'https://github.com/eyro-labs/eyro_toast'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Eyro Labs' => 'admin@cubeacon.com' }
  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.dependency 'FlutterMacOS'

  s.platform = :osx, '10.11'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end
