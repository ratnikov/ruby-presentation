
begin
  Dir.glob(File.dirname(__FILE__) + '/app/**/*rb').each do |file|
    require file
  end
rescue LoadError => le
  puts "Failed to load library. Error: #{le}"
end
