require 'open-uri'

# encoding: utf-8
class HomeController < ApplicationController
  # encoding: utf-8
  def index
      @titles =Array.new
      @hrefs =Array.new
     
      
    uri= 'https://www.youtube.com/channel/UC8oSz7z588lRvzmUhLMajsQ/videos'
    doc = Nokogiri::XML(open(uri))
   
    doc.css('.yt-lockup-title').each do |x|
        @titles << x.inner_text
        end    
        
        doc.css('.yt-lockup-title a').each do |d|
        @hrefs  << d.attr('href')    # a태크 href 따오는법!!
      end
    
    
  end
  
  
  def result
    
     @searchresult =Array.new
     @r_hrefs= Array.new
     
    @searchmovie = CGI::escape(params[:input_search])
    searchurl= "https://www.youtube.com/results?search_query=#{@searchmovie}"
    searchdata = Nokogiri::XML(open(searchurl))
    
     searchdata.css('.yt-lockup-title').each do |r|
       @searchresult << r.inner_text
  end
  
  searchdata.css('.yt-lockup-title a').each do |a|
    @r_hrefs << a.attr('href')
  end
  
  end
end

