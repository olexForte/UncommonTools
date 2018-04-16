
TOMORROW=$(date -v+1d +%Y-%m-%d)
URL="https://booking.uz.gov.ua/train_search/"
TMP_FILE=$(date +%Y%m%d).txt
echo "$TOMORROW  $URL  $TMP_FILE"
curl -X POST $URL -H "Content-Type: application/x-www-form-urlencoded" -d "from=2200001&to=2218000&date=$TOMORROW&time=00%3A00&get_tpl=1" > $TMP_FILE

 


