#Check for dependencies / if fresh install
if [[ `ls | grep log` == '' ]]; then
	bash ./lib/install-dependencies.sh
	echo "[Install]: Installed Dependencies" >> ./log
fi

#Check if other instance is running 
if [[ `ps | grep -i "bash ./lib/hourlyUpdate.sh"` != '' ]]; then
		kill -9 `ps | grep -m2 "bash ./lib/hourlyUpdate.sh" | cut -d" " -f1 | tail -n2`
fi

bash ./lib/hourlyUpdate.sh &

exit 1
