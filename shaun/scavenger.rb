require 'nokogiri'
require 'open-uri'
require 'pry'

File.open('output.html', 'w') do |f|
  #step 1
  doc = Nokogiri.HTML(open('http://iwanttolearnruby.com/').read)
  img = doc.xpath('//div[contains(@class, "puzzles")]//img').first
  f.write("<img src='http://iwanttolearnruby.com/#{img.attribute('src')}' />" + "\n")

  #step 2
  doc = Nokogiri.HTML(open('http://www.ruby-lang.org/en/').read)
  h1 = doc.xpath('//h1').first

  #step 3
  doc = Nokogiri.XML(open('../xml_example.xml').read)
  light_attr = doc.xpath('/CATALOG/PLANT/COMMON[text()="Buttercup"]/following-sibling::LIGHT')
  f.write("#{h1.text.split.first.downcase} #{light_attr.text}\n")

  #step 4
  doc = Nokogiri.HTML(open('http://winteriscoming.net/').read)
  title = doc.xpath('//title').first
  f.write(title.text.split[1..2].join(' ') + "\n")

  #step 5
  doc = Nokogiri.HTML(open('https://github.com/rails/spring').read)
  itemprop = doc.xpath('//*[@itemprop="name"]').first
  f.write(itemprop.text + "\n")

  #step 6
  doc = Nokogiri.HTML(open('http://www.miniwebtool.com/roman-numerals-converter/?number=MMXVII').read)
  mystery_number = doc.xpath('//td[text()="Arabic Number"]/following-sibling::td').first
  f.write(mystery_number.text + "\n")
end
