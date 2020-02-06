# HourlyUpdate V1.2.1
# Usage: bash hourlyUpdate.sh &

#------------------------------------------------------------------------------------

#Get default browser
get_default () {
	browser=`x=~/Library/Preferences/com.apple.LaunchServices/com.apple.launchservices.secure.plist;\ 
		plutil -convert xml1 $x;\
		grep 'https' -b3 $x | awk 'NR==2 {split($2, arr, "[><]"); print arr[3]}';`	
}

#Parses browser package to return a code to send to open-window.py
check_browser () {
	if [[ $1 == "com.google.chrome" ]] ; then
		browserEx="google"
	else
		browserEx="firefox"
	fi	
}

#Terminal beeps
beep () {
	for x in {1..10}; do
		echo "beep"
		echo -en "\007"
		sleep 1
	done
}

#-------------------------------------main------------------------------------------

get_default

check_browser $browser

echo "Start work timer!"

currentTime=`date +'%I:%M'`
hour=`date +'%I'`


while [[ $currentTime != "5:00" ]]; do
	currentTime=`date +'%I:%M'`
	
	alertTimes=("09:30" "10:00" "11:00" "12:00" "01:00" "02:00" "03:00" "04:00" "04:10" "05:00")
	
	for t in ${alertTimes[@]}; do
		if [[ $currentTime ==	$t ]]; then
			
			python3 ./lib/open-window.py $browserEx
			python3 ./lib/move-mouse.py			

			beep

			echo "See you in an hour!!"
		fi
	done

	sleep 30

done

echo "Time to Leave!"


#-----------------------------------------------------------------------------
