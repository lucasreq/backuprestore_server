#!/bin/bash

REPO='borgback@server-borg.lucasrequena.online:/home/borgback/backup'

if [ -z "$1" ]
then
    echo "veuillez entrer une date sous la forme Jour.Mois.Annee en argument"
else

    cd /home/gab/recuperation

    export BORG_PASSPHRASE=''

    borg extract --list \
    ${REPO}::"{hostname}_$1"

    mv home home_$1
fi