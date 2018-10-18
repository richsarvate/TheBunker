import requests
import json
import urllib.parse
import subprocess

start = "<P><SPAN><STRONG>About The Show</STRONG><BR></SPAN></P><P><SPAN><A HREF=\"http://www.comedybunkerla.com\" TARGET=\"_blank\" TITLE=\"The Bunker\" REL=\"noreferrer noopener nofollow noopener noreferrer nofollow\"><SPAN>The Bunker </SPAN></A>is an underground comedy club hidden in Burbank. The top comedians in LA come here to practice their craft in secret. The show is hosted by local favorites <A HREF=\"http://www.rsarvate.com\" TARGET=\"_blank\" REL=\"noreferrer noopener nofollow noopener noreferrer nofollow\">Richard Sarvate</A> and <A HREF=\"http://www.aaronmliner.com\" TARGET=\"_blank\" REL=\"noreferrer noopener nofollow noopener noreferrer nofollow\">Aaron Mliner.</A> We feature established comedians from around the country as well as local up-and-coming stars. Our goal is to provide a truly raw alternative experience.</P><P><SPAN><A HREF=\"https://youtu.be/lpqH38W1KsQ\" TARGET=\"_blank\" REL=\"noreferrer noopener nofollow noopener noreferrer nofollow\">Watch Video</A></SPAN></P><P><STRONG>---------------------------------------------------------------------------<BR></STRONG></P><P><STRONG>LINEUPS<BR></STRONG></P><P>"

end = "</P><P>FAQ:<BR>Q. Is there a drink minimum?<BR>A. NO, the venue is BYOB</P><P><SPAN>Q. Is there parking available?</SPAN><BR><SPAN><SPAN>A. There is plenty of free street parking.</SPAN></SPAN></P><P><SPAN><SPAN>Q. Is the venue age restricted?<BR>A. YES, please have your ID as it's 21 and over. This is strictly enforced.<BR></SPAN></SPAN><STRONG><BR><IMG SRC=\"https://cdn.evbuc.com/eventlogos/267615605/aaronpatricktiny.png\"></STRONG></P><P>Check our <A HREF=\"http://www.comedybunkerla.com\" TARGET=\"_blank\" REL=\"noreferrer noopener nofollow noopener noreferrer nofollow\">website</A>, <SPAN><A HREF=\"http://www.comedybunkerla.com\" TARGET=\"_blank\" REL=\"noreferrer noopener nofollow noopener noreferrer nofollow\">email</A>, or call us at <SPAN>(747) 333-6037</SPAN> anytime</SPAN>.</P><P><STRONG>Directions:</STRONG><BR>From Burbank Blvd walk south on Meyers St about 200 feet. Make a right into the alleyway and you will see the entrace to the patio of The Bunker.<BR><SPAN>* The Bunker has open seating on a first come, first serve basis. Seats are not guaranteed past the start time on your ticket so please be here early.  Please buy your tickets online to guarantee a seat. The event sells out quickly. <BR></SPAN>* All sales are final. There are no refunds.<P>See you at the show!</P>"

result = subprocess.run(['ruby', 'getDateForNextDay.rb', 'Saturday', '0'], stdout=subprocess.PIPE)
saturdayDate = result.stdout.decode('utf-8').strip()

result = subprocess.run(['ruby', 'getLineupForDay.rb', 'Saturday', '0'], stdout=subprocess.PIPE)
saturdayLineup = result.stdout.decode('utf-8').strip().replace(",", "<br>")

lineup = "<P><STRONG>Saturday "+saturdayDate+" (</STRONG>8pm<STRONG>)</STRONG><BR>"+saturdayLineup+"</P>"

r = requests.post("https://www.eventbriteapi.com/v3/series/51130959075/",
                headers = {"Authorization": "Bearer TBNKZGTF3OZQ6XWWKGN7",},
                data = {"series_parent.description.html": start+lineup+end,},
                verify = True
                )
