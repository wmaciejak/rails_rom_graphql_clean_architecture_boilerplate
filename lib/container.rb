class Container
  class DryContainer
    include Dry::Container::Mixin
  end

  attr_reader :app, :container

  class << self
    attr_reader :instance
  end

  def self.configure
    container = DryContainer.new
    yield(container)
    @instance = new(Rails.application, container)
    freeze
  end

  def initialize(app, container)
    @app = app
    @container = container
  end

  def [](name)
    container[name]
  end

  def self.auto_register_repositories(container)
    Dir[Pathname.new("./app/concepts/**/repository.rb")].map do |file|
      name = file.gsub("./app/concepts/", '').gsub('/repository.rb', '')
      container.register(name, memoize: true) do
        "#{name.camelize}::Repository".constantize.new(ROM.env)
      end
    end
  end
end
