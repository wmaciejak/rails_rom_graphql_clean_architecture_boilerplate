# frozen_string_literal: true

module Utils
  class BaseResolver
    class << self
      def batch_load(opts)
        if opts[:mode] == :many
          array_strategy(opts)
        elsif opts[:mode] == :single
          single_strategy(opts)
        else
          raise ArgumentError, "Argument :mode is defined wrongly"
        end
      end

      def array_strategy(opts)
        define_method("call") do |object, _, _|
          BatchLoader.for(object.id).batch(cache: opts[:cache] || false) do |object_ids, loader|
            grouped_hash = repository.send(opts[:fetch_method], object_ids)
                                     .group_by(&opts[:key].to_sym)
            object_ids.each { |object_id| loader.call(object_id, grouped_hash[object_id]) }
          end
        end
      end

      def single_strategy(opts)
        define_method("call") do |object, _, _|
          BatchLoader.for(object.send(opts[:key]))
                     .batch(cache: opts[:cache] || false) do |object_ids, loader|
            repository
              .send(opts[:fetch_method], object_ids)
              .each { |record| loader.call(record[:id], record) }
          end
        end
      end

      def repository(name)
        define_method("repository") do
          Container.instance["repositories.#{name}"]
        end
      end
    end
  end
end
