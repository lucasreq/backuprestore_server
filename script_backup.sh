#!/bin/bash

REPO='borgback@server-borg.lucasrequena.online:/home/borgback/backup'

LIST=(
  /media/doc_back/documentimportant
  /media/doc_back/codebombenucleaire
)

export BORG_PASSPHRASE=''

 borg create --info --stats \
   ${REPO}::'{hostname}_{now:%d.%m.%Y}' \
   "${LIST[@]}"

 borg prune ${REPO} \
   --keep-daily=7 --keep-weekly=4 --keep-monthly=6