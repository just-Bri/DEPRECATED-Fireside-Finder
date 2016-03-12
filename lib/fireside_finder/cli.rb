# our CLI Controller
class FiresideFinder::CLI

  def call
    puts "Please enter an address or zip-code to find nearby Fireside Gathering:"
    list_local
    menu
  end

  def list_local
    @local_gatherings = Scraper::scrape_list
  end

  def menu
    user_input = nil
    while user_input != "exit"
      puts "Enter the number of the event you'd like more info on, or type exit to exit:"
      user_input = gets.strip.downcase
      case user_input
      when "1"
        puts "more info on 1"
      when "2"
        puts "more info on 2"
      end
    end
  end
end
