Pod::Spec.new do |s|

  s.name         = "pixelbits"
  s.version      = "0.0.1"
  s.summary      = "iOS application styling in Swift."

  s.description  = %{
	iOS application styling in a native Swift library.
  }

  s.homepage     = "http://cocoa.ninja"
  s.license      = "MIT"

  s.author             = { "Wim Haanstra" => "wim@wim.me" }
  s.social_media_url   = "http://twitter.com/depl0y"

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/depl0y/pixelbits.git" }

  s.source_files  = "pixelbits/**/**"
  s.ios.deployment_target = '8.0'

  s.dependency "YamlSwift"
end
