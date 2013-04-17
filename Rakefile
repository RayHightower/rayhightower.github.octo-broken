require 'guard'

begin
  require 'jasmine'
  load 'jasmine/tasks/jasmine.rake'
rescue LoadError
  task :jasmine do
    abort "Jasmine is not available. In order to run jasmine, you must: (sudo) gem install jasmine"
  end
end

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