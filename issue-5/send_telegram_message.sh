#!/bin/bash

if [ -z "$1" ]; then
  echo "Использование: $0 <SOME_TEXT>"
  exit 1
fi

CHAT_ID="-4561117407"
BOT_TOKEN="7609394729:AAERm-kc-gKm43wZKmxUfAl2WZNIqKs4mK0"

SOME_TEXT=$1

URL="https://api.telegram.org/bot${BOT_TOKEN}/sendMessage?chat_id=${CHAT_ID}&text=${SOME_TEXT}"

curl -s -X POST $URL > /dev/null

if [ $? -eq 0 ]; then
  echo "Сообщение успешно отправлено!"
else
  echo "Ошибка при отправке сообщения."
fi