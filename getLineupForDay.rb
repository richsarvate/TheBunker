require 'bundler'
Bundler.require
require 'date'

def date_of_next(day)
  	date  = Date.parse(day)
	delta = Date.parse("Sunday") <= Date.today ? 0 : 7
	return (date+delta)	
end
 
# Authenticate a session with your Service Account
session =  GoogleDrive::Session.from_config("config.json")
#session = GoogleDrive::Session.from_service_account_key("client_secret.json")


# Get the spreadsheet by its title
spreadsheet = session.spreadsheet_by_title("Comedy Bunker Info")

# Get the first worksheet
worksheet = spreadsheet.worksheet_by_title("Booking")
# Print out the first 6 columns of each row

nextdate=date_of_next(ARGV[0]).to_s

lineups = []

worksheet.rows.each { |row| 

	puts nextdate
	puts row.first(1)[0].to_s

	if (nextdate==row.first(1)[0].to_s)
		comedians = [];
	
		row.drop(6).each { |comedian|
			if (!comedian.empty?)
				comedians.push(comedian.sub(/\(.*\)/, '').strip)
			end
		}

		lineups.push(comedians.join(","))

	end


}

puts lineups[ARGV[1].to_i]

