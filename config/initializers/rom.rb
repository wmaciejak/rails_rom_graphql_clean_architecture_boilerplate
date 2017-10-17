ROM::Rails::Railtie.configure do |config|
  config.gateways[:default] = [:sql, ENVied.DATABASE_URL]
end
