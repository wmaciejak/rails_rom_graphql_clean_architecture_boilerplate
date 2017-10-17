# frozen_string_literal: true

def conn
  ROM::SQL::Gateway.instance.connection
end

RSpec.configure do |config|
  config.before(:suite) do
    db_c = DatabaseCleaner[:sequel, connection: conn]
    db_c.strategy = :transaction
    db_c.clean_with(:truncation, except: %w[spatial_ref_sys])
  end

  config.around do |example|
    DatabaseCleaner[:sequel, connection: conn].cleaning do
      example.run
    end
  end
end
