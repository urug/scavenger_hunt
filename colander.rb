require 'pry'
require 'nokogiri'
require 'open-uri'
def grab_first_site
  doc =  Nokogiri::HTML(open("http://iwanttolearnruby.com/"))
  divs = doc.css('div.puzzles')
  img = divs.first.css('img')
  src = img[0]['src']
  path = "http://iwanttolearnruby.com/#{src}"
end
def grab_second_site
  doc =  Nokogiri::HTML(open("http://www.ruby-lang.org/en/"))
  h1 = doc.css('h1')
  word = h1.first.text.downcase
end
def grab_xml_file
  doc = File.open("xml_example.xml") { |f| Nokogiri::XML(f) }
  binding.pry
end
def grab_third_site
  doc =  Nokogiri::HTML(open("http://winteriscoming.net/"))
  title = doc.css('title')
  split = title.text.split
  item = "#{split[1]} #{split[2]}"
end
grab_third_site
grab_xml_file
grab_second_site
grab_first_site