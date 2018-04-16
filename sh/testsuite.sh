

echo "PARAM $1"

curl https://booking.uz.gov.ua/train_search/station/?term=ternopil 2> /dev/null | grep '2218300'
if [ $? -eq 0  ] ; then  echo "Pass test 1"; else echo "Test failed 1" ; fi



curl https://booking.uz.gov.ua/train_search/station/?term=ternooooooootttt 2> /dev/null | grep '2218300'
if [ $? -eq 0  ] ; then  echo "Fail test 2"; else echo "Test passed 2" ; fi



curl -X POST https://booking.uz.gov.ua/train_search/ -H "Content-Type: application/x-www-form-urlencoded" -d "from=2200001&to=2218000&date=2018-04-15&time=00%3A00&get_tpl=1" > test1res

result=$(cat test1res | perl -pe 's/},{/,\n/g' | wc -l)

if [ $result -eq "30"  ] ; then  echo "PASS test 3"; else echo "FAIL test 3" ; fi


