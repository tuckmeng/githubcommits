BEGIN {
c = 1
ids[1] = ""
print "Id\tCommitDate"
print "==\t=========="
}

{
# print "Debug - $1 is " $1
if ($1 in ids) {
   #   print "Debug - In id. Ignore" $0
   next
   }
   else {
   # Not in array, store in array to compare later
   ids[$1] = "yes"
   c++
   gsub(",","",$4)
   $4 = $4+0
   if ($4 < 10) {
      $4 = "0" $4
   }
   myprintline = $1 "\t" $5 $3 $4
   gsub("Jan","01",myprintline)
   gsub("Feb","02",myprintline)
   gsub("Mar","03",myprintline)
   gsub("Apr","04",myprintline)
   gsub("May","05",myprintline)
   gsub("Jun","06",myprintline)
   gsub("Jul","07",myprintline)
   gsub("Aug","08",myprintline)
   gsub("Sep","09",myprintline)
   gsub("Oct","10",myprintline)
   gsub("Nov","11",myprintline)
   gsub("Dec","12",myprintline)
   print myprintline
   }
}
