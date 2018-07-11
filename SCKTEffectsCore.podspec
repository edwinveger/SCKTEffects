#
# Be sure to run `pod lib lint' to ensure this is a valid spec before submitting.
#

Pod::Spec.new do |s|
  s.name             = 'SCKTEffectsCore'
  s.version          = '0.1.0'
  s.summary          = 'Provides core logic for SCKTEffects.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This framework serves as the backbone for a custom class which can be
animated using custom animation functions. You wouldn't use this on its own unless you have a custom node hierarchy that you want to animate.
It is based on SKTEffects by raywenderlich.com.
                       DESC

  s.swift_version    = '3.0'
  s.homepage         = 'https://github.com/edwinveger/SCKTEffects'
  s.license          = { :type => 'MIT', :file => 'LICENSE.txt' }
  s.author           = { 'edwinveger' => 'info@pierrecode.nl' }
  s.source           = { :git => 'https://github.com/edwinveger/SCKTEffects.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'

  s.source_files = 'SCKTEffectsCore/Classes/**/*'
end
