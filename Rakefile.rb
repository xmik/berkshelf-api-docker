task :build do
  image_name = 'berkshelf-api-docker'
  image_tag = File.open('./scripts/version.txt','r').readlines[0].chomp()
  Rake.sh("docker build -t #{image_name}:#{image_tag} .")
end
