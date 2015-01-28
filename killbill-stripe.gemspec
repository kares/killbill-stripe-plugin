version = File.read(File.expand_path('../VERSION', __FILE__)).strip

Gem::Specification.new do |s|
  s.name        = 'killbill-stripe'
  s.version     = version
  s.summary     = 'Plugin to use Stripe as a gateway.'
  s.description = 'Kill Bill payment plugin for Stripe.'

  s.required_ruby_version = '>= 1.9.3'

  s.license = 'Apache License (2.0)'

  s.author   = 'Kill Bill core team'
  s.email    = 'killbilling-users@googlegroups.com'
  s.homepage = 'http://kill-bill.org'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.bindir        = 'bin'
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.rdoc_options << '--exclude' << '.'

  s.add_dependency 'killbill', '3.2.1.2'
  s.add_dependency 'activemerchant', '~> 1.44.1'
  s.add_dependency 'offsite_payments', '~> 2.0.1'
  s.add_dependency 'activerecord', '~> 4.1.0'
  s.add_dependency 'activerecord-bogacs', '~> 0.2.0'
  s.add_dependency 'actionpack', '~> 4.1.0'
  s.add_dependency 'actionview', '~> 4.1.0'
  s.add_dependency 'activesupport', '~> 4.1.0'
  s.add_dependency 'money', '~> 6.2.1'
  s.add_dependency 'monetize', '~> 0.4.1'
  s.add_dependency 'sinatra', '~> 1.3.4'
  if defined?(JRUBY_VERSION)
    s.add_dependency 'activerecord-jdbc-adapter', '~> 1.3.12'
    # NOTE: deprecated - kept for compatibility due **adapter: jdbcmysql** :
    #s.add_dependency 'activerecord-jdbcmysql-adapter', '~> 1.3.12'
    # Required to avoid errors like java.lang.NoClassDefFoundError: org/bouncycastle/asn1/DERBoolean
    s.add_dependency 'jruby-openssl', '~> 0.9.6'
  end

  s.add_development_dependency 'jbundler', '~> 0.4.1'
  s.add_development_dependency 'rake', '>= 10.0.0'
  s.add_development_dependency 'rspec', '~> 2.12.0'
  if defined?(JRUBY_VERSION)
    s.add_development_dependency 'jdbc-mariadb', '~> 1.1.7'
    s.add_development_dependency 'jdbc-sqlite3', '~> 3.8.6'
  else
    s.add_development_dependency 'sqlite3', '~> 1.3.7'
  end
end
