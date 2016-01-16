Pod::Spec.new do |s|

  s.name         = "pixelbits"
  s.version      = "0.2"
  s.summary      = "iOS application styling in Swift."

  s.description  = %{
	iOS application styling in a native Swift library.
  }

  s.homepage     = "http://cocoa.ninja"
  s.license      = "MIT"

  s.author             = { "Wim Haanstra" => "wim@wim.me" }
  s.social_media_url   = "http://twitter.com/depl0y"

  s.platform     = :ios, "9.0"

  s.source       = { :git => "https://github.com/depl0y/pixelbits.git", :tag => "v#{s.version}" }
  s.requires_arc = true
  s.source_files  = "pixelbits/**/*.{h,m,swift}"
  s.ios.deployment_target = '9.0'

end
