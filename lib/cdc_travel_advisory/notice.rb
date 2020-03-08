class CdcTravelAdvisory::Notice
    attr_accessor :issue, :last_update, :summary, :more_info_url, :key_points
    @@all = []
    
    def initialize(issue, last_update, summary, more_info_url, key_points)

        @@all << self
    end


    def self.all
        @@all
    end

    

end
