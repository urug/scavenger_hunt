require 'open-uri'
require 'nokogiri'

# TODO output all content for scavenger hunt to a file and then display in browser

websites = ['http://iwanttolearnruby.com/', 'http://www.ruby-lang.org/en/', 
  'http://winteriscoming.net/', 'https://github.com/rails/spring', 'http://www.miniwebtool.com/roman-numerals-converter/']

doc = Nokogiri::HTML(open(websites[0]))

img_top = doc.css('.post.ruby.puzzles')

images = img_top.css('img')

image1 = "#{websites[0]}#{images[0]['src']}"

puts image1 

# TODO use iwanttolearnruby.com, get the first image in the puzzles section 

doc = Nokogiri::HTML(open(websites[1]))
# TODO get the first word of the h1 tag in the intro and force it to lowercase

intro_h1 = doc.css('#intro h1').first
word1 = intro_h1.text.to_s.split(' ')[0].downcase
puts word1

# TODO using xpath from supplied file (xml_example.xml) get the LIGHT value for the Buttercup
doc = File.open("xml_example.xml") { |f| Nokogiri::XML(f) }
item = doc.xpath('//PLANT[COMMON="Buttercup"]/LIGHT').text
word2 = item.to_s
puts word2

#TODO take the 2nd and 3rd word from the title of website 3.  do this in one line of code
puts Nokogiri::HTML(open(websites[2])).css('title').text.to_s.split(' ')[1..2].join(' ')

# TODO get the name of the rails application preloader from it's github page using the itemprop name
doc = Nokogiri::HTML(open(websites[3]))
props = doc.css("strong[itemprop='name'] a") #['href']
word3 = props.text
puts word3

# TODO use http://www.miniwebtool.com/roman-numerals-converter/ to retrieve the arabic value of the roman numeral: MMXVII
doc = Nokogiri::HTML(open("http://www.miniwebtool.com/roman-numerals-converter/?number=MMXVII"))
doc.css('tr.tr2.p_2 td:nth-child(2)').each do |td|
  word4 = td.content
  puts word4
end







  



