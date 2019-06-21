# Tuto utilisation BORGbackup centos

borgbackup est un logitiel de sauvegarde qui gère la [déduplication](https://fr.wikipedia.org/wiki/D%C3%A9duplication). Il supporte le chiffrement et la compression.

Lien github vers BorgBackup: [BorgGithub](https://github.com/borgbackup/borg)

## Installation

il faut d'abord avoir les outils necessaires 
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

et ensuite installer borgbackup

```shell
pip3.6 install borgbackup
```

##utilisation

1. On commence par initier un repo
    
    ```shell
    borg init --encryption=repokey /path/to/repo
    ```

2. On crée un depot de backup (le {now} sert a faire un backup avec le jours actuel)

    ```shell
    borg create /path/to/repo::{now} ~/src ~/Documents
    ```

3.  Cette commande permet de créer une nouvelles archive le --stats crée des statistiques sur la nouvelles archive.
    ```shell
    borg create --stats /path/to/repo::{now} ~/src ~/Documents
    ```

4. Cette commande permet de lister toutes les archives portant le nom "Monday" on peut aussi l'utiliser sans parametre pour tout lister
    ```bash
    borg list /path/to/repo::Monday
    ``` 

5. Cette commande permet de restorer toutes les backup se nommant "Monday" 
    ```shell
    borg extract /path/to/repo::Monday
    ```

6. Cette commande permet de supprimer les archives ici "Monday"
    ```shell
    borg delete /path/to/repo::Monday
    ```

