
Pod::Spec.new do |s|
  s.name             = 'KKEasyTouch'
  s.version          = '0.1.0'
  s.summary          = 'KKEasyTouch 快捷出发方法的工具'

  s.description      = <<-DESC
  KKEasyTouch 提供一个快速的出发入口，便于平时开发测试，模拟一些出发条件的场景
                       DESC

  s.homepage         = 'https://github.com/kekeyezi/KKEasyTouch'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'keke' => 'kekeyezi1992@163.com' }
  s.source           = { :git => 'https://github.com/kekeyezi/KKEasyTouch.git', :tag => s.version.to_s }
  s.ios.deployment_target = '7.0'
  s.source_files = 'KKEasyTouch/Classes/**/*'
  s.resources = 'KKEasyTouch/Assets/**/*'
end
