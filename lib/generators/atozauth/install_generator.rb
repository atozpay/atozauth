module Atozauth
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)
      desc "Creates Generator initializer for your application"

      def copy_initializer
        puts "create config file"
        template "sso_initializer.rb", "config/initializers/atozauth.rb"
        puts "create migration file "
        template "sso_user_migration.rb", "db/migrate/#{Time.now.strftime("%Y%m%d%H%M%S")}_create_sso_users.rb"
        puts "create model"
        template "sso_user_model.rb", "app/models/sso_user.rb"
        puts "Install complete! mantap cuks!"
      end
    end
  end
end
