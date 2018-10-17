update:
	@echo "updating the schedule"
	@ruby updateSchedule.rb "`ruby getLineupForDay.rb Saturday 0`" "Saturday `ruby getDateForNextDay.rb Saturday` 8pm" "`ruby getShowNameForDay.rb Saturday 0`"> bunkerScheduleSat8pm.js

	@python3 updateEventbriteDesc.py

	@echo "pushing updates to git"
	@git add .
	@git commit -m "updating the schedule"
	@git push
