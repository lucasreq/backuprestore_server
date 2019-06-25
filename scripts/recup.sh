#!/bin/bash

REPO='[username]@[server]:[chemin du dossier de sauvegarde]'

if [ -z "$1" ] #/!\ ne pas toucher c'est la condition du if
then
    echo "veuillez entrer une date sous la forme Jour.Mois.Annee en argument"
else

    cd [chemin du dossier ou vous allez récupérer la sauvegarde]

    export BORG_PASSPHRASE=''

    borg extract --list \
    ${REPO}::"{hostname}_$1"

    mv home home_$1
fi
