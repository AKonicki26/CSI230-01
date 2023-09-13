fullIP=$(bash GetIP.bash)
IP=$(bash GetIPwoPrefix.bash)
length="${#IP}"
echo "${fullIP:length+1}"
