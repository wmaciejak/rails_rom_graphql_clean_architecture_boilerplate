ROM::Rails::Railtie.configure do |config|
  config.gateways[:default] = [:sql, ENVied.DATABASE_URL]
end

module ROM
  module Rails
    class Railtie < ::Rails::Railtie
      def create_container
        configuration = create_configuration

        configuration.register_relation(*load_entities(relation_paths))
        configuration.register_mapper(*load_entities(mapper_paths))
        configuration.register_command(*load_entities(command_paths))

        ROM.container(configuration)
      end

      private

      def relation_paths
        [Pathname("./app").join("concepts/**/relation.rb")]
      end

      def command_paths
        [Pathname("./app").join("concepts/**/commands/**/*.rb")]
      end

      def mapper_paths
        [Pathname("./app").join("concepts/**/mappers/**/*.rb")]
      end

      def load_entities(entity)
        files = entity.map do |path|
          Dir[path]
        end

        files.flatten.map do |file|
          require file
          const_name(entity, file).constantize
        end
      end

      def const_name(entity, file)
        name = file.gsub("./app/concepts/", '').gsub('.rb', '')
        Dry::Core::Inflector.camelize(name)
      end
    end
  end
end
