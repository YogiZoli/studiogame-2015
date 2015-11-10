Gem::Specification.new do |s|
  s.name         = "studiogame-"
  s.version      = "1.0"
  s.author       = "YogiZoli"
  s.email        = "zoltanp.gero@gmail.com "
  s.homepage     = "http://tezisto.com"
  s.summary      = "Studio Game: This game created by following PragStudio Ruby course. Code for joy"
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))
  s.licenses     = ['MIT']

  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'studio_game.rb' ]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec'
end
