require 'guard'

begin
  require 'jasmine'
  load 'jasmine/tasks/jasmine.rake'
rescue LoadError
  task :jasmine do
    abort "Jasmine is not available. In order to run jasmine, you must: (sudo) gem install jasmine"
  end
end

task default: [:spec]

desc "compile coffeescript from guardfile"
task :cc do
  Guard.setup
  Guard::Dsl.evaluate_guardfile(:guardfile => 'Guardfile')
  Guard.run_all({})
end

desc "watch for coffeescript"
task :wc do
  system 'guard'
end

desc "test setup & bootstrap dummy app"
task :test_setup do
  p 'Bootstrap cwoctopress app'
  system 'bundle install; rake generate'
  p 'Copying files and directories'
  system 'cp ../../../../_config.yml _config.yml'
  system 'cp ../../../../plugins/search_generator.rb plugins/search_generator.rb'
  system 'cp ../../../../plugins/ext.rb plugins/ext.rb'
  p 'Syncing source & sass folders'
  system 'rsync -a ../../support/source .'
  system 'rsync -a ../../support/sass .'
  p 'updating site'
  system 'rake generate'
end
