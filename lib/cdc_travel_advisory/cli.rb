class CdcTravelAdvisory::CLI

    def call    
        list_notices
        menu
        goodbye
    end

    def list_notices         
        
        puts "CDC Travel Health Notices:"
        CdcTravelAdvisory::Scraper.get_notices
        @notices = CdcTravelAdvisory::Notice.all
        
        @notices.each.with_index(1) do |notice, i|
            puts "#{i}. #{notice.issue}."
        end
    end
    
    def menu
        
        input = nil 
        while input != "exit"
            puts "Enter the number you'd like more info on or type exit:"
            input = gets.strip.downcase

            if input.to_i > 0 && input.to_i <= @notices.length
                the_notice = @notices[input.to_i-1]
                puts "#{the_notice.issue}."
                puts "Last Updated: #{the_notice.last_update[0]}"
                puts "#{the_notice.summary}"
                puts "For more information type info."
            elsif input == "info"
                CdcTravelAdvisory::Scraper.get_details(the_notice)
                puts "#{the_notice.key_points}"

            elsif input == "list"
                list_notices
            else
                puts "Please type the corresponding number, list, or exit."
            end
        end
    end

    def goodbye
        puts "Don't let the Travel Bugs bite!"
    end
end
