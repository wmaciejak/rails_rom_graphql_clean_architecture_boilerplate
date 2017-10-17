Rails.logger = Logger.new(STDOUT)

module Seeds
  module Runner
    extend self

    def start!(env)
      DB.transaction do
        files_from(env).each do |file|
          Rails.logger.info "#{Time.now.strftime('%Y/%m/%d %H:%M:%S')} SEEDING #{file}"
          require File.join(Rails.root, 'db', 'seeds', "#{file}.rb")
        end
      end
    end

    private

    def files_from(env)
      send(env).map { |e| "#{env}/#{e}" }
    end

    def development
      %w[users posts comments]
    end
  end
end
