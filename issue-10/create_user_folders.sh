#!/bin/bash

# Создаем структуру папок
mkdir -p users/{user1,user2,user3,user4,user5}/{documents,photos,videos}

# Заполняем файлы для демонстрации
echo "Hello from user1" > users/user1/documents/file1.txt
echo "Hello from user2" > users/user2/documents/file2.txt
echo "Hello from user3" > users/user3/documents/file3.txt
echo "Hello from user4" > users/user4/documents/file4.txt
echo "Hello from user5" > users/user5/documents/file5.txt