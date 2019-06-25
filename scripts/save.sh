#!/bin/bash

REPO='[username]@[serveur]' #connection au serveur en ssh

LIST=(
  [chemin d'un dossier a sauvergarder]
  [chemin d'un dossier a sauvergarder]
  #/home/[username]/dossierasauvegarder
)

export BORG_PASSPHRASE=''

 borg create --info --stats \
   ${REPO}::'{hostname}_{now:%d.%m.%Y}' \
   "${LIST[@]}"

 borg prune ${REPO} \
   --keep-daily=7 --keep-weekly=4 --keep-monthly=6
