require 'nokogiri'
require 'open-uri'
​
things = [
  [
    'http://iwanttolearnruby.com/',
    lambda {|doc, path|
      img = doc.css('.puzzles img').first
      img.attribute('src').value = path + img.attribute('src').value
      img.to_html
    },
    "\n"
  ],
  [
    'http://www.ruby-lang.org/en/',
    lambda {|doc, path|
      doc.css('#intro h1').first.text.split(' ')[0]
    }
  ],
  [
    'xml_example.xml',
    lambda {|doc, path|
      doc.xpath("/html/body/catalog/plant[common='Buttercup']/light").text
    },
    "\n"
  ],
  [
    'http://winteriscoming.net/',
    lambda {|doc, path|
      doc.css('title').text.split(' ')[1..2].join(' ')
    },
    "\n"
  ],
  [
    'https://github.com/rails/spring',
    lambda {|doc, path|
      doc.css('[itemprop="name"]').first.text
    },
    "\n"
  ],
  [
    'http://www.miniwebtool.com/roman-numerals-converter/?number=MMXVII',
    lambda {|doc, path|
      doc.css('tr.tr2.p_2 td').last.text
    },
    "\n"
  ]
]
​
message = things.map{|path, blk, append_string=''|
  "#{blk.call( Nokogiri::HTML(open(path)), path)}#{append_string}"
}.join
​
# puts message.inspect
​
File.open('output.html', 'w') do |file|
  file.puts ['<html>', '<body>', message, '</body>', '</html>'].join("\n")
end