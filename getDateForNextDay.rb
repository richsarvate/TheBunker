require 'date'

def date_of_next(day)
  	date  = Date.parse(day)
	delta = Date.parse("Sunday") <= Date.today ? 0 : 7
  	d = Date.parse((date + delta).to_s)

	d.strftime("%b %d %Y")
end

puts date_of_next ARGV[0]
