require './app.rb'
include Rake::DSL

task "routes:default" do
  SinatraAuthProxy.routes.each do |verb,handlers|
    puts "\n#{verb}:\n"
    handlers.each do |handler|
      puts handler[0].source.to_s
    end
  end
end
