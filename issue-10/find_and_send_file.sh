#!/bin/bash

CHAT_ID="-4561117407"
BOT_TOKEN="7609394729:AAERm-kc-gKm43wZKmxUfAl2WZNIqKs4mK0"

send_telegram_message() {
    local message=$1
    local url="https://api.telegram.org/bot${BOT_TOKEN}/sendMessage?chat_id=${CHAT_ID}&text=${message}"
    curl -s -X POST $url > /dev/null
    if [ $? -eq 0 ]; then
        echo "Сообщение успешно отправлено!"
    else
        echo "Ошибка при отправке сообщения."
    fi
}

if [ -z "$1" ]; then
    echo "Использование: $0 <username>"
    exit 1
fi

USERNAME=$1
BASE_DIR="users"
FILE_PATH="${BASE_DIR}/${USERNAME}/documents/file.txt"

if [ -f "$FILE_PATH" ]; then
    CONTENT=$(cat "$FILE_PATH")
    send_telegram_message "$CONTENT"
else
    echo "Файл для пользователя $USERNAME не найден."
fi