# Sauvegarde automatique distante
Pour sauvegarder nos dossier sur un serveur distant nous allons utiliser le logiciel Borgbackup.

Borgbackup est un logitiel de sauvegarde qui gère la [déduplication](https://fr.wikipedia.org/wiki/D%C3%A9duplication). Il supporte le chiffrement et la compression.

Lien github vers BorgBackup: [BorgGithub](https://github.com/borgbackup/borg)

## Installation du serveur (Centos 7)

#### /!\ les scripts fonctionnent aussi sous ubuntu, pour ce faire, adaptez les commandes 

il faut en premier mettre en place l'environnement 
```shell
sudo yum update
sudo yum install yum-utils
sudo yum groupinstall development
```
Installer également IUM repo:
```shell
sudo yum install https://centos7.iuscommunity.org/ius-release.rpm
```

Ensuite installer python3.6 et ses pack

```shell
sudo yum install python36u
sudo yum install python36u-pip
sudo yum install python36u-devel
```

Et dernier installer borgbackup

```shell
pip3.6 install borgbackup
```

## Sauvegarde client

Vous devez aussi installer Borgbackup sur le pc client (votre pc), faites comme avec le serveur si votre pc est sous Centos 7.  

Pour automatiser la sauvegarde vous aurez besoin du script [save.sh](https://github.com/lucasreq/backuprestore_server/blob/master/scripts/save.sh).
   
/!\ Il faudra modifier le script pour l'adapter a votre ordinateur, pour ce faire, les modification à effectuer sont entourée de [ ].

une fois le [script de sauvegarde](https://github.com/lucasreq/backuprestore_server/blob/master/scripts/save.sh) installer sur votre ordinateur, il faut lui donner le droit de s’exécuter pour cela utiliser la commande 
```shell
chmod +x save.sh
```
Vous pouvez désormais lancer le scripts manuellement ou utiliser la [crontab](http://www.mgroup.fr/index.php?post/2013/03/29/centos_crontab) pour le lancer automatiquement.

## Récupération client

Pour récupérer vos sauvegardes vous aurez besoins du script [recup.sh](https://github.com/lucasreq/backuprestore_server/blob/master/scripts/recup.sh).

/!\ Il faudra modifier le script pour l'adapter a votre ordinateur, pour ce faire, les modification à effectuer sont entourée de [ ].

Une fois adapter a votre ordinateur il suffira de donner les droits au scripts grâce à la commande 
```shell
chmod +x recup.sh
```
Lorsque vous lancer le script, celui ci attend en argument la date de la sauvegarde que vous voulez récupérer sous la forme jour.mois.année.

exemple:
./recup 25.06.2019

*les dossiers récupérés  seront nommé home_j.m.a*
