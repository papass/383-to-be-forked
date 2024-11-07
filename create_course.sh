#!/bin/bash

create_course_structure() {
    local course_name=$1
    mkdir -p "$course_name/Студенты"
    echo "Создана структура папок для курса: $course_name"
}

add_grades() {
    local course_name=$1
    local student_count=$2
    local students=()

    echo "Добавьте фамилии студентов:"
    for ((i=1; i<=student_count; i++)); do
        read -p "Студент $i: " student
        students+=("$student")
    done

    echo "Оценки добавлены в файл \"Оценки.txt\" для курса \"$course_name\"."
    echo "Студент: Оценка" > "$course_name/Студенты/Оценки.txt"
    for student in "${students[@]}"; do
        echo "$student: 5" >> "$course_name/Студенты/Оценки.txt"
    done
}

check_and_create_course_folder() {
    local course_name=$1
    if [ ! -d "$course_name" ]; then
        create_course_structure "$course_name"
    else
        echo "Папка курса \"$course_name\" уже существует."
    fi
}

edit_grades() {
    local course_name=$1
    local students=("$course_name/Студенты"/*)
    local student_count=${#students[@]}

    if [ "$student_count" -eq 0 ]; then
        echo "В папке курса нет студентов."
        return
    fi

    echo "Список студентов:"
    for ((i=0; i<student_count; i++)); do
        echo "$((i+1)): $(basename "${students[i]}")"
    done

    read -p "Выберите номер студента для редактирования: " student_number
    if [[ "$student_number" -lt 1 || "$student_number" -gt "$student_count" ]]; then
        echo "Неверный номер студента."
        return
    fi

    local student_file="${students[$((student_number-1))]}/Оценки.txt"
    read -p "Введите новую оценку для $(basename "${students[$((student_number-1))]}") : " new_grade
    echo "$(basename "${students[$((student_number-1))]}") : $new_grade" > "$student_file"
    echo "Оценка для $(basename "${students[$((student_number-1))]}") обновлена."
}

echo "Укажите название курса:"
read course_name

echo "Сколько студентов в группе?"
read student_count

check_and_create_course_folder "$course_name"
add_grades "$course_name" "$student_count"
edit_grades "$course_name"