Pod::Spec.new do |s|
  s.name = 'SwifterSwift'
  s.version = '6.0.0'
  s.summary = 'A handy collection of native Swift extensions to boost your productivity.'
  s.homepage = 'https://github.com/SwifterSwift/SwifterSwift'
  s.license = { type: 'MIT', file: 'LICENSE' }
  s.documentation_url = 'http://swifterswift.com/docs'
  s.authors = { 'SwifterSwift Contributors' => 'https://github.com/SwifterSwift/SwifterSwift/graphs/contributors' }
  
  s.ios.deployment_target = '10.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.swift_versions = ['5.6']
  s.source = { git: 'https://github.com/SwifterSwift/SwifterSwift.git', tag: s.version.to_s }
  s.source_files = 'Sources/**/*.swift'

  # SwiftStdlib Extensions
  s.subspec 'SwiftStdlib' do |sp|
    sp.source_files  = 'Sources/Stdlib/*.swift'
  end

  # Foundation Extensions
  s.subspec 'Foundation' do |sp|
    sp.source_files  = 'Sources/Foundation/*.swift'
  end
end
