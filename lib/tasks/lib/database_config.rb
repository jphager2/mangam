class DatabaseConfig
  def initialize(app_name)
    @app_name = app_name
    @path = ENV['rails_root'] + '/config/database.yml'

    use_app_name_as_database_names
  end

  def use_app_name_as_database_names
    file = File.read(@path)
    File.open(@path, 'w') do |f| 
      f.write(file.gsub('rails4_1', @app_name))
    end
  end
end
