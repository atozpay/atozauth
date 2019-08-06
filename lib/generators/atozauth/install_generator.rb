module Atozauth
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)
      desc "Creates Generator initializer for your application"

      def copy_initializer
        puts "create config file"
        template "sso_initializer.rb", "config/initializers/atozauth.rb"
        unless migration_exist?
          puts "create migration file "
          template "sso_user_migration.rb", "db/migrate/#{Time.now.strftime("%Y%m%d%H%M%S")}_create_sso_users.rb"
          puts "create model"
          template "sso_user_model.rb", "app/models/sso_user.rb"
        end
        puts "Install complete! mantap cuks!"
      end

      def rails5?
        Rails.version.start_with? '5'
      end

      def migration_version
        if rails5?
          "[#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}]"
        end
      end

      def migration_exist?
         Dir.glob("#{File.join(destination_root, migration_path)}/[0-9]*_*.rb").grep(/\d+_create_sso_users.rb$/).first
      end

      def migration_path
        @migration_path ||= File.join("db", "migrate")
      end
    end
  end
end
