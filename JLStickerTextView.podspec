Pod::Spec.new do |s|

  s.name         = "JLStickerTextView"
  s.version      = "0.1.2"
  s.summary      = "add text(multiple line support) to imageView, edit, rotate or resize them as you want, then render the text on image"

  s.homepage     = "https://github.com/dannn5n2/JLStickerTextView"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author       = { "dannn5n2" => "dannn5n2@gmail.com" }

  s.source       = { :git => "https://github.com/dannn5n2/JLStickerTextView.git", :tag => "0.1.2" }

  s.platform = :ios, "10.0"

  s.source_files  = "Source"

  s.requires_arc = false

  s.frameworks = "UIKit"

end
