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
    echo "Использование: $0 <action> [entity_name]"
    echo "Доступные действия: create, rename, delete"
    exit 1
fi

ACTION=$1
ENTITY_NAME=$2
BASE_DIR="users"

case $ACTION in
    create)
        if [ -z "$ENTITY_NAME" ]; then
            echo "Необходимо указать имя сущности для создания."
            exit 1
        fi
        DIR_PATH="${BASE_DIR}/${ENTITY_NAME}"
        if [ -d "$DIR_PATH" ]; then
            echo "Директория $DIR_PATH уже существует."
        else
            mkdir -p "$DIR_PATH"
            send_telegram_message "Создана директория: $DIR_PATH"
        fi
        ;;
    rename)
        if [ -z "$ENTITY_NAME" ]; then
            echo "Необходимо указать имя сущности для переименования."
            exit 1
        fi
        if [ -z "$3" ]; then
            echo "Необходимо указать новое имя сущности."
            exit 1
        fi
        OLD_NAME="$2"
        NEW_NAME="$3"
        OLD_DIR_PATH="${BASE_DIR}/${OLD_NAME}"
        NEW_DIR_PATH="${BASE_DIR}/${NEW_NAME}"
        if [ ! -d "$OLD_DIR_PATH" ]; then
            echo "Директория $OLD_DIR_PATH не существует."
        else
            mv "$OLD_DIR_PATH" "$NEW_DIR_PATH"
            send_telegram_message "Переименована директория: $OLD_DIR_PATH в $NEW_DIR_PATH"
        fi
        ;;
    delete)
        if [ -z "$ENTITY_NAME" ]; then
            echo "Необходимо указать имя сущности для удаления."
            exit 1
        fi
        DIR_PATH="${BASE_DIR}/${ENTITY_NAME}"
        if [ ! -d "$DIR_PATH" ]; then
            echo "Директория $DIR_PATH не существует."
        else
            rm -rf "$DIR_PATH"
            send_telegram_message "Удалена директория: $DIR_PATH"
        fi
        ;;
    *)
        echo "Неизвестное действие: $ACTION"
        exit 1
        ;;
esac