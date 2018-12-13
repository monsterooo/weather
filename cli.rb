require 'inifile'

HOME = ENV['HOME']
CONFIG = "#{HOME}/.weather"

module Tty
  module_function

  def blue
    bold 34
  end

  def red
    bold 31
  end

  def reset
    escape 0
  end

  def bold(code = 39)
    escape "1;#{code}"
  end

  def underline
    escape "4;39"
  end

  def escape(code)
    "\033[#{code}m" if STDOUT.tty?
  end
end

class Array
  def shell_s
    cp = dup
    first = cp.shift
    cp.map { |arg| arg.gsub " ", "\\ " }.unshift(first).join(" ")
  end
end


def ohai(*args)
  puts "#{Tty.blue}==>#{Tty.bold} #{args.shell_s}#{Tty.reset}"
end

def system(*args)
  abort "Failed during: #{args.shell_s}" unless Kernel.system(*args)
end

def sudo(*args)
  args.unshift("-A") unless ENV["SUDO_ASKPASS"].nil?
  ohai "/usr/bin/sudo", *args
  system "/usr/bin/sudo", *args
end

if !File.exists? CONFIG
  sudo 'touch', CONFIG
end

init = IniFile.load(CONFIG)


testInit = {}
testInit['tenderloin'] = { 'gritty' => 'yes' }
init.merge(testInit)
init.each_section do |section|
  puts "I want #{section} printed here!"
end