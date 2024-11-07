#!/bin/bash

create_project_structure() {
    local project_name=$1
    local project_dir=$2


    mkdir -p "$project_dir/$project_name/src/scripts"
    mkdir -p "$project_dir/$project_name/src/styles"
    mkdir -p "$project_dir/$project_name/src/images"


    touch "$project_dir/$project_name/src/scripts/.gitkeep"
    touch "$project_dir/$project_name/src/styles/.gitkeep"
    touch "$project_dir/$project_name/src/images/.gitkeep"
    touch "$project_dir/$project_name/README.md"
    touch "$project_dir/$project_name/.gitignore"

    echo "Структура проекта $project_name успешно создана в директории $project_dir."
}

echo "Введите название проекта:"
read project_name

echo "Введите директорию для создания проекта:"
read project_dir

if [ ! -d "$project_dir" ]; then
    echo "Директория $project_dir не существует."
    exit 1
fi

create_project_structure "$project_name" "$project_dir"