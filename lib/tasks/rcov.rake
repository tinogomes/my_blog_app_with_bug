require 'rcov/rcovtask'

namespace :test do 
  Rcov::RcovTask.new(:rcov) do |t|
    t.pattern = ENV["FROM"] || FileList['test/**/*_test.rb']
    t.output_dir = "doc/coverage"
    t.rcov_opts = ["--text-summary", "--rails", "-x gem,TextMate", "--charset UTF8", "--html"]
  end

  namespace :rcov do
    desc "Delete current coverage data."
    task(:clean) { rm_rf "doc/coverage" }
    
    desc "Open current coverage index page."
    task(:open) { system 'open "doc/coverage/index.html"' if PLATFORM["darwin"] }

    desc "Show current rcov version"
    task :version do
      system "rcov --version"
    end
  end
  
  desc "Analyze code coverage of the unit tests."
  task :coverage => ['test:rcov', 'test:rcov:open']

end

