after_line  = '//= require jquery' + "\n"
line_to_add = '//= require jquery.turbolinks' + "\n"
path = ENV['rails_root'] + '/app/assets/javascripts/application.js'

application_js = File.read(path)
File.open(path, 'w') do |f| 
  # sub out if it is already somewhere in the file
  application_js.gsub!(line_to_add, '') 
  f.write(application_js.gsub(after_line, (after_line + line_to_add)))
end

