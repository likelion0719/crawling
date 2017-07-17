require 'open-uri'

class HomeController < ApplicationController
  def index
      @titles =Array.new
      @hrefs =Array.new
    uri= 'https://www.youtube.com/channel/UC8oSz7z588lRvzmUhLMajsQ/videos'
    doc = Nokogiri::HTML(open(uri))

   
    doc.css('.yt-lockup-title').each do |x|
        @titles << x.inner_text
        end    
        
        doc.css('.yt-lockup-title a').each do |d|
        @hrefs  << d
      end
      
    
    
  end
end

