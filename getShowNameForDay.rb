require 'bundler'
Bundler.require
require 'date'

def date_of_next(day)
  	date  = Date.parse(day)
	delta = Date.parse("Sunday") <= Date.today ? 0 : 7
	return (date+delta)	
end
 
# Authenticate a session with your Service Account
session = GoogleDrive::Session.from_config("config.json")
 
# Get the spreadsheet by its title
spreadsheet = session.spreadsheet_by_title("Comedy Bunker Info")
# Get the first worksheet
worksheet = spreadsheet.worksheet_by_title("Booking")
# Print out the first 6 columns of each row

nextdate=date_of_next(ARGV[0]).to_s

lineups = []

worksheet.rows.each { |row| 

	if (nextdate==row.first(1)[0].to_s)
		puts row[3]
		break
	end
}
