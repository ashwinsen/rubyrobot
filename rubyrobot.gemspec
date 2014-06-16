$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift File.expand_path('../lib/model', __FILE__)
$LOAD_PATH.unshift File.expand_path('../lib/robot_states', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'rubyrobot'
  s.version     = '1.0.0'
  s.authors     = ['Ashwin Sen P']
  s.description = 'Ruby Robot'
  s.summary     = "rubyrobot_#{s.version}"
  s.email       = 'ashwin_sen2001@yahoo.com'

  s.date        = '2014-06-15'


  s.platform    = Gem::Platform::RUBY

  s.rubygems_version = '>= 2.0.0'
  s.files            = (Dir['lib/*'] + Dir['lib/**/*']).reject {|path| path =~ /\.gitignore$/ }
  s.test_files       = Dir.glob('spec/*')
  s.executables      = %w(rubyrobot)
  s.rdoc_options     = %w(--charset=UTF-8)
  s.require_path     = %w(lib)
end