def print_lineup() 

  lineup = "";
  lineup += print_comedian("Chris Thayer")
  lineup += print_comedian("Samson Koletkar")

  puts lineup;

end


def print_comedian(name)

  return 'document.write("<li class=\"comedian-tile\"><div class=\"headshot\"><img alt=\"'+name+'\" src=\"https://s3-us-west-1.amazonaws.com/comedyoakland/headshots/'+name.gsub(/\s+/, "")+'.jpg\" /><\/div><div><h1 class=\"comic-name\">'+name+'<\/h1><\/div><\/li>'

end

print_lineup();
