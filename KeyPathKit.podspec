Pod::Spec.new do |s|
  s.name             = 'KeyPathKit'
  s.version          = '1.3.0'
  s.summary          = 'KeyPathKit leverages Swift 4 KeyPath type in order to implement a SQL-like data manipulation API'

  s.description      = <<-DESC
Swift 4 has introduced a new type called KeyPath, with allows to access the properties of an object with a very nice syntax. For instance:

let string = "Foo"
let keyPathForCount = \String.count

let count = string[keyPath: keyPathForCount] // count == 3
The great part is that the syntax can be very concise, because it supports type inference and property chaining.

Consequently, I thought it would be nice to leverage this new concept in order to build an API that allows to perform data manipulation in a very declarative fashion.

SQL is a great language for such manipulations, so I took inspiration from it and implemented most of its standard operators in Swift 4 using KeyPath.

But what really stands KeyPathKit appart from the competition is its clever syntax that allows to express queries in a very seamless fashion. For instance :

contacts.filter(where: \.lastName == "Webb" && \.age < 40)
                       DESC

  s.homepage         = 'https://github.com/vincent-pradeilles/KeyPathKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Vincent Pradeilles' => 'vin.pradeilles+keypathkit@gmail.com' }
  s.source           = { :git => 'https://github.com/vincent-pradeilles/KeyPathKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.tvos.deployment_target = '11.0'
  s.osx.deployment_target = '10.12'
  s.watchos.deployment_target = "3.0"

  s.framework = 'Foundation'

  s.source_files = 'Sources/**/*.swift'

end
