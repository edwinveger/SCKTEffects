
Pod::Spec.new do |s|
  s.name             = 'SCKTEffectsSceneKit'
  s.version          = '0.1.0'
  s.summary          = 'Provides custom timing functions for SceneKit.'
  s.description      = <<-DESC
Builds on SCKTEffectsCore to provide custom animation functions for SCNNodes.
                       DESC

  s.homepage         = 'https://github.com/edwinveger/SCKTEffects'
  s.license          = { :type => 'MIT', :file => 'LICENSE.txt' }
  s.author           = { 'edwinveger' => 'info@pierrecode.nl' }
  s.source           = { :git => 'https://github.com/edwinveger/SCKTEffects.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'SCKTEffectsSceneKit/Classes/**/*'
  s.frameworks = 'SceneKit'
  s.dependency 'SCKTEffectsCore'
end
