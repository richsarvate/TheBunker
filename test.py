import subprocess
result = subprocess.run(['ruby', 'getDateForNextDay.rb', 'Thursday', '0'], stdout=subprocess.PIPE)
print(result.stdout.decode('utf-8').strip())

r2 = subprocess.run(['ruby', 'getLineupForDay.rb', 'Thursday', '0'], stdout=subprocess.PIPE)
print(r2.stdout.decode('utf-8').strip().replace(",", "<br>"))


