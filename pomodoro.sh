#!/bin/bash
read -p "Quantos minutos (25min)? " minutes
progress=0
end=$(($minutes * 60))
end=5
width=10
velo=$(($end / $width))
END=`date +'%H:%M:%S' --date='+5seconds'`

echo "End time at $END"
#while [ "`date +'%H:%M:%S'`" != "$END" ]; do
while true; do
  printf "\rProgress: " 1>&2

  percent=$(( 100 * $progress / $end ))
  printf "%3d%% [" $percent 1>&2

  bar=$(( $width * $progress / $end ))
  for i in $(seq 1 $bar); do printf "=" 1>&2; done
  for i in $(seq $bar $(( $width-1 ))); do printf " " 1>&2; done

  printf "]" 1>&2
  if [[ progress -eq end ]]; then
    #`mplayer ding.wav > /dev/null 2>&1`
    echo FIM
    break;
  fi
  progress=$progress+$velo
  sleep 1
done
