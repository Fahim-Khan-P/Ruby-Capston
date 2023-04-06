require 'fileutils'

def create_dir
  Dir.exist?('./storage') ? nil : create_files
end

def create_files
  Dir.mkdir('./storage')
  FileUtils.touch('./storage/game.json')
  FileUtils.touch('./storage/author.json')
end
