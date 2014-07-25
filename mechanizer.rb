require 'mechanize'

mechanize = Mechanize.new

page = mechanize.get('http://playersclothing.com/')

puts page.title
