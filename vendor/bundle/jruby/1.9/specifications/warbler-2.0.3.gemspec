# -*- encoding: utf-8 -*-
# stub: warbler 2.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "warbler"
  s.version = "2.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Nick Sieger"]
  s.date = "2016-05-26"
  s.description = "Warbler is a gem to make a Java jar or war file out of any Ruby,\nRails, or Rack application. Warbler provides a minimal, flexible, Ruby-like way to\nbundle up all of your application files for deployment to a Java environment."
  s.email = "nick@nicksieger.com"
  s.executables = ["warble"]
  s.files = ["bin/warble"]
  s.homepage = "https://github.com/jruby/warbler"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--main", "README.rdoc", "-H", "-f", "darkfish"]
  s.rubygems_version = "2.4.5"
  s.summary = "Warbler chirpily constructs .war files of your Rails applications."

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rake>, [">= 10.1.0"])
      s.add_runtime_dependency(%q<jruby-jars>, [">= 9.0.0.0"])
      s.add_runtime_dependency(%q<jruby-rack>, ["< 1.3", ">= 1.1.1"])
      s.add_runtime_dependency(%q<rubyzip>, ["< 1.4", "~> 1.0"])
      s.add_development_dependency(%q<jbundler>, ["~> 0.9"])
      s.add_development_dependency(%q<rspec>, ["~> 2.10"])
    else
      s.add_dependency(%q<rake>, [">= 10.1.0"])
      s.add_dependency(%q<jruby-jars>, [">= 9.0.0.0"])
      s.add_dependency(%q<jruby-rack>, ["< 1.3", ">= 1.1.1"])
      s.add_dependency(%q<rubyzip>, ["< 1.4", "~> 1.0"])
      s.add_dependency(%q<jbundler>, ["~> 0.9"])
      s.add_dependency(%q<rspec>, ["~> 2.10"])
    end
  else
    s.add_dependency(%q<rake>, [">= 10.1.0"])
    s.add_dependency(%q<jruby-jars>, [">= 9.0.0.0"])
    s.add_dependency(%q<jruby-rack>, ["< 1.3", ">= 1.1.1"])
    s.add_dependency(%q<rubyzip>, ["< 1.4", "~> 1.0"])
    s.add_dependency(%q<jbundler>, ["~> 0.9"])
    s.add_dependency(%q<rspec>, ["~> 2.10"])
  end
end
