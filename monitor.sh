#!/bin/bash
echo "----Memory usage----"
MEM=$(top bn1 | grep "buff")
echo "$MEM"
echo "---"
MEM_TOTAL=$(top bn1 | grep "buff" | cut -d':' -f 2 | cut -d',' -f 1 | tr -d '[[:blank:]]' | tr -d '[[:alpha:]]')
echo "$MEM_TOTAL : total"
echo "---"

MEM_FREE=$(top bn1 | grep "buff" | cut -d':' -f 2 | cut -d',' -f 2 | tr -d '[[:blank:]]' | tr -d '[[:alpha:]]')
echo "$MEM_FREE : free"
echo "---"

MEM_USED=$(top bn1 | grep "buff" | cut -d':' -f 2 | cut -d',' -f 3 | tr -d '[[:blank:]]' | tr -d '[[:alpha:]]')
echo "$MEM_USED : used"
echo "---"

MEM_BUFF=$(top bn1 | grep "buff" | cut -d':' -f 2 | cut -d',' -f 4 | tr -d '[[:blank:]]' | tr -d '[[:alpha:]]')
echo "$MEM_BUFF : buff cache"
echo "---"
