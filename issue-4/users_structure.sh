#!/bin/bash

if [ ! -d ~/users ]; then
  mkdir ~/users
fi

USERNAME=$1

USER_DIR=~/users/$USERNAME/
mkdir -p $USER_DIR

cd $USER_DIR
git init

PHOTOS_DIR=$USER_DIR/photos
mkdir -p $PHOTOS_DIR

for year in {2020..2024}; do
  mkdir -p $PHOTOS_DIR/$year
  touch $PHOTOS_DIR/$year/default.png
done

git add photos
git commit -m "Added photos directories and files for $USERNAME"

VIDEOS_DIR=$USER_DIR/videos
mkdir -p $VIDEOS_DIR

for year in {2020..2024}; do
  mkdir -p $VIDEOS_DIR/$year
  touch $VIDEOS_DIR/$year/default.mp4
done

git add videos
git commit -m "Added videos directories and files for $USERNAME"

DOCUMENTS_DIR=$USER_DIR/documents
mkdir -p $DOCUMENTS_DIR

for year in {2020..2024}; do
  mkdir -p $DOCUMENTS_DIR/$year
  touch $DOCUMENTS_DIR/$year/default.docx
done

git add documents
git commit -m "Added documents directories and files for $USERNAME"