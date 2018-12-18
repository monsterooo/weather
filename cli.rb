require 'inifile'
require "thor"
require "http"
require "nokogiri"

HOME = ENV['HOME']
CONFIG = "#{HOME}/.weather"
TESTAPI = 'http://flash.weather.com.cn/wmaps/xml/china.xml';

class Weather < Thor
  desc "search NAME", "搜索您所在城市的编码"
  def search(name)
    puts "正在搜索城市数据..."
    search = HTTP.get(TESTAPI).to_s
    xml_doc  = Nokogiri::XML(search)
    city = xml_doc.xpath("//city")
    puts city
  end
end

Weather.start(ARGV);

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