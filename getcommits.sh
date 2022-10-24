#!/bin/sh
rm -f ./allinputs.txt
rm -f ./finalresult.txt
export GREPRESULT=0
MYARG1=$1
# echo "Debug -  MYARG1 = $MYARG1"
while true
   do
      # echo "Debug - Fetching $MYARG1"
      curl -s $MYARG1 -o ./input1.html
      html2text -o ./input1.txt ./input1.html
      grep "committed" ./input1.txt >> ./allinputs.txt
      # Getting next URL to crawl
      export MYARG1=`grep "Older" ./input1.html | sed s/^.*https/https/g| sed s/branch.master.*/branch=master/g | sed s/amp\;//g | sed s/^.*BtnGroup.*//g`
      # Hunt for string 'disabled="disabled">Older</button></div>' and exit
      export GREPRESULT=`grep -c "..........disabled..Older" ./input1.html`
      # echo "Debug - GREPRESULT = $GREPRESULT"
      if expr $GREPRESULT;
      then
      #   echo "Debug - Break loop"
         break
      fi
      # echo "Debug - End of loop - MYARG1 = $MYARG1"
   done
# echo "Debug - Out of loop"
gawk -f findfirstid.awk ./allinputs.txt > ./finalresult.txt
echo "Final Result"
cat ./finalresult.txt
