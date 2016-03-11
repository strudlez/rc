#!/bin/sh
BIN="$(dirname ${BASH_SOURCE[0]})/../bin"
PA_VOL="$BIN/pa-vol"
PA_MUTE="$BIN/pa-mute"
max=100000
step=10
inc=$(($max/$step))

pct=$(($($PA_VOL)))
if [ "$($PA_MUTE)" = "no" ]; then
  vbox=■
else
  vbox=-
fi

vol=''
for i in `seq 1 $step`; do
  if [ $pct -gt 0 ]; then
    pct=$(($pct - $inc))
    vol="$vol$vbox"
  else
    vol="$vol "
  fi
done

echo "[$vol]"
