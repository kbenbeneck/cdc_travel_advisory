class CdcTravelAdvisory::Scraper
    attr_accessor :issue, :last_update, :summary,  :more_info_url, :key_points
    
    def self.all
        self.scrape_notices
    end

    

    def self.get_notices
        doc = Nokogiri::HTML(open("https://wwwnc.cdc.gov/travel/notices"))
        
        
        scraped_notices = doc.css(".list-block li")
        
        scraped_notices.each do |node|
                     
            notice = CdcTravelAdvisory::Notice.new(@issue, @last_update, @summary, @more_info_url, @key_points)
                
             notice.issue = node.css("a:nth-of-type(2)").text.strip
                notice.last_update = node.css("> span.date").text, 
                notice.summary = node.css("#summary")[0].text, 
                notice.more_info_url = node.css("a")[2]["href"]
                # more_info_site = "https://wwwnc.cdc.gov/"
                # more_info_site << notice.more_info_url   
                
                #notice.key_points = Nokogiri::HTML(open(more_info_site)).css(".bullet-list li").text
                #notice.key_points = Nokogiri::HTML(open(more_info_site)).css(".notice li").text 

                
            
        end 
    end
    
    def self.get_details(selection)
        doc = Nokogiri::HTML(open("https://wwwnc.cdc.gov/#{selection.more_info_url}"))
        
        selection.key_points = doc.css(".notice li").text.strip
    end
    
    
    
    

end


