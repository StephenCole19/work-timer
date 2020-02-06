# HourlyUpdate V1.2.1
# Usage: bash hourlyUpdate.sh &

# Get default Browser
browser=`x=~/Library/Preferences/com.apple.LaunchServices/com.apple.launchservices.secure.plist;\ 
plutil -convert xml1 $x;\
grep 'https' -b3 $x | awk 'NR==2 {split($2, arr, "[><]"); print arr[3]}';` #plutil -convert binary1 $x`

browserEX=""

if [[ $browser == "com.google.chrome" ]] ; then
	browserEX="google"
else
	browserEX="firefox"
fi

echo "Start work timer!"

currentTime=`date +'%I:%M'`
hour=`date +'%I'`


while [[ $currentTime != "5:00" ]]; do
	currentTime=`date +'%I:%M'`
	
	alertTimes=("09:30" "10:00" "11:00" "12:00" "01:00" "02:00" "03:00" "04:00" "04:05" "04:10" "05:00")
	
	for t in ${alertTimes[@]}; do
		#echo "Current: $currentTime , Alert:$t"
		if [[ $currentTime ==	$t ]]; then
			
			python3 ./lib/open-window.py $browserEX
			python3 ./lib/move-mouse.py			
	
			for x in {1..10}; do
				echo "beep"
				echo -en "\007"
				sleep 1
			done

			echo "See you in an hour!!"

		fi
	done

	sleep 30

done

echo "Time to Leave!"
