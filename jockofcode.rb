require 'open-uri'
 require 'nokogiri'
require 'pry-byebug'

 final_result = []
 doc = Nokogiri::HTML(open("http://iwanttolearnruby.com/"))
 final_result << doc.css('.puzzles').at_css("img").to_html

 doc = Nokogiri::HTML(open("http://www.ruby-lang.org/en/"))
 temp_result = doc.at_css("h1").text.split(" ").first.downcase
 doc = Nokogiri::XML(open("https://raw.githubusercontent.com/urug/scavenger_hunt/master/xml_example.xml"))
 temp_result = temp_result + " " + doc.css("PLANT").select{|c| c.css("COMMON").text =~ /buttercup/i }.first.css("LIGHT").text

final_result << temp_result

 doc = Nokogiri::HTML(open("http://winteriscoming.net/"))
 final_result << doc.css("title").text.split(" ")[1..2].join(" ")

 doc = Nokogiri::HTML(open("https://github.com/rails/spring"))
final_result << doc.css('[itemprop=name]').first.text

doc = Nokogiri::HTML(open("http://www.miniwebtool.com/roman-numerals-converter/?number=MMXVII"))


puts "<HTML><BODY>\n"
final_result.join("<BR>")
puts "<BR>"
puts "</BODY></HTML>"