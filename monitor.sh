#!/bin/bash
echo "Mem(KiB)"
MEM=$(top bn1 | grep "buff")
echo "$MEM"

MEM_TOTAL=$(top bn1 | grep "buff" | cut -d':' -f 2 | cut -d',' -f 1 | tr -d '[[:blank:]]' | tr -d '[[:alpha:]]')
echo "$MEM_TOTAL : total"
for ((c=0;c<50;c++))
do
	echo -n "="
	sleep 0.02
done
echo ""

MEM_FREE=$(top bn1 | grep "buff" | cut -d':' -f 2 | cut -d',' -f 2 | tr -d '[[:blank:]]' | tr -d '[[:alpha:]]')
echo "$MEM_FREE : free"
EQ=$((50*$MEM_FREE/$MEM_TOTAL))
for ((c=0;c<$EQ;c++))
do
	echo -n "="
	sleep 0.02
done
echo ""

MEM_USED=$(top bn1 | grep "buff" | cut -d':' -f 2 | cut -d',' -f 3 | tr -d '[[:blank:]]' | tr -d '[[:alpha:]]')
echo "$MEM_USED : used"
EQ=$((50*$MEM_USED/$MEM_TOTAL))
for ((c=0;c<$EQ;c++))
do
	echo -n "="
	sleep 0.02
done
echo ""

MEM_BUFF=$(top bn1 | grep "buff" | cut -d':' -f 2 | cut -d',' -f 4 | tr -d '[[:blank:]]' | tr -d '[[:alpha:]]' | tr -d '[[:punct:]]')
echo "$MEM_BUFF : buff/cache"
EQ=$((50*$MEM_BUFF/$MEM_TOTAL))
for ((c=0;c<$EQ;c++))
do
	echo -n "="
	sleep 0.02
done
echo ""

echo ""
PING=$(ping -c 1 google.com)
echo "Ping Test"
if [ $? -eq 0 ];
then
	echo "Ping successful. Connected!"
else
	echo "Ping failed. Not Connected!"
fi

echo ""
echo "Uptime"
uptime

echo ""
echo "Disk usage"
df