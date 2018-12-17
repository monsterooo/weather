require 'inifile'
require "thor"

HOME = ENV['HOME']
CONFIG = "#{HOME}/.weather"

# class MyCLI < Thor
#   desc "hello NAME", "say hello to NAME"
#   def hello(name)
#     puts "Hello #{name}"
#   end
# end

class MyCLI < Thor
  desc "hello NAME", "say hello to NAME"
  long_desc <<-LONGDESC
    `cli hello` will print out a message to a person of your
    choosing.

    You can optionally specify a second parameter, which will print
    out a from message as well.

    > $ cli hello "Yehuda katz" "Carl Lerche"

    > from: Carlerche
  LONGDESC
  def hello(name)
    puts "Hello #{name}"
  end
end

MyCLI.start(ARGV);

# if !File.exists? CONFIG
#   sudo 'touch', CONFIG
# end

# init = IniFile.load(CONFIG)


# testInit = {}
# testInit['tenderloin'] = { 'gritty' => 'yes' }
# init.merge(testInit)
# init.each_section do |section|
#   puts "I want #{section} printed here!"
# end