module SpreeAutosuggest
  module Generators
    class InstallGenerator < Rails::Generators::Base
      class_option :auto_run_migrations, type: :boolean, default: false

      def add_javascripts
        append_file 'app/assets/javascripts/store/all.js', "//= require store/spree_autosuggest\n"
     end
     
     def add_stylesheets
        inject_into_file 'app/assets/stylesheets/store/all.css', " *= require store/spree_autosuggest\n", :before => /\*\//, :verbose => true
     end	
      def add_migrations
        run 'bundle exec rake railties:install:migrations FROM=spree_autosuggest'
      end
     source_root File.expand_path('../../templates', __FILE__)
      def copy_locale
        directory assets_source_path, assets_destination_path
        directory js_source_path, js_destination_path
      end


      def assets_source_path
        '../../../../vendor/assets/stylesheets/'
      end

      def assets_destination_path
        'app/assets/stylesheets/'
      end

      def js_source_path
        '../../../../vendor/assets/javascripts/'
      end

      def js_destination_path
        'app/assets/javascripts/'
      end
      def run_migrations
        run_migrations = options[:auto_run_migrations] || ['', 'y', 'Y'].include?(ask 'Would you like to run the migrations now? [Y/n]')
        if run_migrations
          run 'bundle exec rake db:migrate'
        else
          puts 'Skipping rake db:migrate, don\'t forget to run it!'
        end
      end
    end
  end
end
