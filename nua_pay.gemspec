$:.push File.expand_path("../lib", __FILE__)
require "nua_pay/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name          = "nua_pay"
  spec.version       = NuaPay::VERSION
  spec.authors       = ["Nitanshu Rehani"]
  spec.email         = ["nitanshu.nik@gmail.com"]
  spec.summary       = %q{This gem hold the methods for the nua pay api's}
  spec.description   = %q{This gem contains class for scheme, mandate, direct debit, payment schedules  and  account info }
  spec.homepage         = "https://flender.ie/"
  spec.license       = "MIT"

  spec.files = Dir[
      "{app,config,db,lib}/**/*",
      "MIT-LICENSE",
      "Rakefile",
      "README.md"
  ]
  spec.require_paths = ["lib"]

  spec.add_dependency 'rails', '~> 5.0.0', '>= 5.0.0.1'
  spec.add_development_dependency "rest-client", "~> 2.0.0"
  spec.add_development_dependency "rake", "~> 10.0"
end
