Pod::Spec.new do |s|
  s.name             = 'KeyPathKit'
  s.version          = '1.0.0'
  s.summary          = 'Swift 4 has introduced a new type called KeyPath, with allows to access the properties of an object with a very nice syntax.'

  s.description      = <<-DESC
  SQL is a great language for such manipulations, so I took inspiration from it and implemented most of its standard operators in Swift 4 using KeyPath.

  But what really stands KeyPathKit appart from the competition is its clever syntax that allows to express queries in a very seamless fashion.
                       DESC

  s.homepage         = 'https://github.com/vincent-pradeilles/KeyPathKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Vincent Pradeilles' => 'vincent.pradeilles@gmail.com' }
  s.source           = { :git => 'https://github.com/vincent-pradeilles/KeyPathKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.tvos.deployment_target = '11.0'
  s.osx.deployment_target = '10.12'
  s.watchos.deployment_target = "3.0"

  s.framework = 'Foundation'

  s.source_files = 'Sources/*.swift'

end
