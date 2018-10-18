def print_comedian(name)

  return '<li class=\"comedian-tile\"><div class=\"headshot\"><img alt=\"'+name+'\" src=\"https://s3-us-west-1.amazonaws.com/comedyoakland/headshots/'+name.gsub(/\s+/, "")+'.jpg\" /><\/div><div><h1 class=\"comic-name\">'+name+'<\/h1><\/div><\/li>'

end

def print_ticket_button(showName)

	ticketLink = "https://thelastcomedyshow.eventbrite.com"

	case showName
	when "The Last Comedy Show on Earth"
		ticketLink = "https://thelastcomedyshow.eventbrite.com"
	else
		ticketLink = "https://thelastcomedyshow.eventbrite.com"
	end

	return '<div class=\"eventbrite\"><a href=\"'+ticketLink+'\"><img alt=\"Buy Tickets on Eventbrite\" src=\"https://i.imgur.com/0eV8t0o.png\" /><\/a><\/div><div class=\"price\">$10 online / $12 at the door<\/div>'

end


def print_lineup(comedians)

	lineup = '<ul class=\"lineup\">'

	for item in comedians.split(',')
  		lineup += print_comedian(item)	
	end

        lineup+='<\/ul>'

	return lineup;

end

def output_something(comedians, date, showName)

	if showName.nil? || showName.empty?
		puts ''
	else
		puts 'document.write("<div class=\"show-wrapper\"><div class=\"show-heading-wrapper\"><h1 class=\"show-heading\">'+date+" - "+showName+'<\/h1><\/div><div class=\"show-body\"><div class=\"description\">Featuring comedians from Comedy Central, HBO, and Late Night, The Bunker brings you the best comedy experience in Los Angeles<\/div>'+
		+print_lineup(comedians)+
		+print_ticket_button(showName)+'<\/div><\/div><style type=\"text/css\">body {\n  font-family: \'Roboto\' !important;\n}\n.comedian-tile {\n  padding: 10px;\n}\n.headshot {\n  width: 150px;\n  height: 150px;\n  overflow: hidden;\n}\n.headshot img {\n  width: 150px;\n}  \nul.lineup li  {\n  display: inline-block;\n  vertical-align: top;\n  font-size: 14px;\n  text-align: center;\n  max-width: 150px;\n  font-family: \'Roboto\' !important;\n  width: 150px;\n}\n.show-wrapper {\n  background-color: black;\n  -webkit-border-bottom-left-radius: 20px;\n  -webkit-border-bottom-right-radius: 20px;\n  -moz-border-radius-bottomleft: 20px;\n  -moz-border-radius-bottomright: 20px;\n  border-bottom-left-radius: 20px;\n  border-bottom-right-radius: 20px;\n}\n.wsite-section-content .container {\n  background-color: #000000 !important;\n}\n.show-body {\n  padding: 20px;\n}\n.description {\n  margin-bottom: 10px;\n}\n.show-heading-wrapper {\n  background-color: #000;\n}\n.show-heading {\n  background-color: #000000;\n  font-family: \'Roboto\' !important;\n  font-size: 22px;\n  font-weight: bold;\n  padding: 20px;\n  -webkit-border-top-left-radius: 20px;\n  -webkit-border-top-right-radius: 20px;\n  -moz-border-radius-topleft: 20px;\n  -moz-border-radius-topright: 20px;\n  border-top-left-radius: 20px;\n  border-top-right-radius: 20px;\n}\n.details {\n  padding: 20px;\n}\n.price {\n  font-weight: bold;\n  font-size: 18px;\n  margin: 10px 0px 5px 0px;\n}\n.minimum {\n  margin: 10px 0px 25px 0px;\n}\n.faq {\n  margin: 5px 0px\n}\n.faq a {\n  text-decoration: underline;\n}\n.show-type-photo img {\n  max-width: 100%;\n}\nh1.comic-name {\n  font-size: 16px;\n  margin: 5px 0px 5px 0px;\n}\n.eventbrite {\n  padding-top: 20px;\n}\n@media only screen and (max-width: 450px) {\n  ul.lineup li {\n    width: 40%;  \n  }\n  .headshot {\n    width: 130px;\n    height: 130px;\n    overflow: hidden;\n  }\n  .headshot img {\n   width: 130px;\n  }  \n}<\/style>");'
	end
end

output_something(ARGV[0],ARGV[1], ARGV[2]);
