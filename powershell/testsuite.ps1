
# test 1 ----------

$resultsfile = "results.html"

echo "<br>" > $resultsfile

if ((Invoke-WebRequest https://booking.uz.gov.ua/train_search/station/?term=Ternopil).content | Select-String  -Pattern '2218300' ) { echo "Test 1 Pass" >> $resultsfile } else {echo "Test 1 Fail" >> $resultsfile}

# test 2 ---------

echo "<br>" >> $resultsfile

if(((Invoke-WebRequest https://booking.uz.gov.ua/train_search/station/?term=Something).content |  Measure-Object –Char ).characters -eq 2) { echo "Test 2 Pass" >> $resultsfile } else {echo "Test 2 Fail" >> $resultsfile}

# test 3 ---------

echo "<br>" >> $resultsfile

$params = @{"from"="2200001";
"to"="2218000";
"date"="$(Get-date -UFormat '%Y-%m-%d')";
"time"="00:00";
"get_tpl"="1";
}

$res=(Invoke-WebRequest -Uri  https://booking.uz.gov.ua/train_search/  -Method POST -Body $params).content

if (((echo $res | ConvertFrom-Json).data.list.num  |  Measure-Object -line).lines -eq 23)  { echo "Test 3 Pass" >> $resultsfile } else {echo "Test 3 Failed" >> $resultsfile}

echo "<br>" >> $resultsfile