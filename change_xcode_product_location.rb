#!/usr/bin/ruby
dir = ENV["TARGET_TEMP_DIR"]
file = File.join(dir, "module.modulemap")
print file
Dir[file].each do |file_name|
  text = File.read(file_name)
  path = `xcode-select -p`.strip << "/"
  new_contents = text.gsub(/\/Applications\/Xcode.app\/Contents\/Developer\//, path)
  File.open(file_name, "w") {|file| file.puts new_contents }
end
