#Lloyd's script to quickly start the server & RoboCanes with default config
echo "Starting Simspark"
simspark &
wait 1
echo "starting RoboCanes"
./start.sh

