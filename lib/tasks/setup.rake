require 'rake'
require 'stringio'

require_relative 'lib/database_config.rb'

ENV['rails_root'] = File.expand_path('../../..', __FILE__)

task :test do
  name = ENV['rails_root'].sub(/.+\//, '').sub(/[\.-]/, '_')
  puts name 
end

namespace :setup do

  task :database do
    name = ENV['rails_root'].sub(/.+\//, '').sub(/[\.-]/, '_')
    DatabaseConfig.new(name)

    `git add config/database.yml`
    `git ci -m 'set up database'`
  end

  task :foundation do
    input, temp = StringIO.new, $stdin
    6.times {input.puts("Y")}
    input.rewind
    $stdin = input
    puts 'Press Enter to continue'
    # foundation will ask to override the app layout file
    puts `rails g foundation:install`
    $stdin = temp

    require_relative 'lib/foundation_config.rb'

    git = 'git add app/assets/javascripts/application.js ' <<
          'app/assets/stylesheets/application.css ' <<
          'app/views/layouts/application.html.erb ' <<
          'app/assets/stylesheets/foundation_and_overrides.scss '
    `#{git}`
    puts `git commit -m 'setup foundation'` 
  end
end


