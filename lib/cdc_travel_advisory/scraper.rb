class CdcTravelAdvisory::Scraper
    attr_accessor :issue, :last_update, :summary,  :more_info_url, :key_points
    
    def self.all
        self.scrape_notices
    end

    def self.scrape_notices
        notices = []
        notices << self.get_notices
        notices
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
                more_info_site = "https://wwwnc.cdc.gov/"
                more_info_site << notice.more_info_url
                notice.key_points = Nokogiri::HTML(open(more_info_site)).css(".bullet-list li").text 
                notice.key_points = Nokogiri::HTML(open(more_info_site)).css(".notice > ul > li").text.strip 
                

                
            
        end 
    end
    
    

end


