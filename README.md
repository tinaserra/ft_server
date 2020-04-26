# ft_server

## INTRODUCTION 🤓

Ce sujet à pour but de vous faire découvir découvrir l’administration système en vous sensibilisant a l’importance de l’utilisation de scripts pour automatiser vos taches. Pour ce faire, nous allons vous faire découvrir la technologie "Docker" afin de vous faire installer un server web complet, qui sera capable de faire tourner plusieurs services, tel qu’un Wordpress, Phpmyadmin, ainsi qu’une base de donnée.

Sujet -> [EN](https://github.com/tinaserra/ft_server/blob/master/links/ft_server_en.pdf) | [FR](https://github.com/tinaserra/ft_server/blob/master/links/ft_server_fr.pdf)

## DOCKER 😎

### Qu’est-ce que docker ?

Docker est un logiciel libre permettant de lancer des applications dans des conteneurs logiciels.

Il permet la mise en œuvre de conteneurs s'exécutant en isolation, via une API de haut-niveau. 

Construit sur des capacités du noyau Linux, un conteneur Docker, à l'opposé de machines virtuelles traditionnelles, ne requiert aucun système d'exploitation séparé et n'en fournit aucun. Il s'appuie plutôt sur les fonctionnalités du noyau et utilise l'isolation de ressources (comme le processeur, la mémoire, les entrées et sorties et les connexions réseau) ainsi que des espaces de noms séparés pour isoler le système d'exploitation tel que vu par l'application. 

Docker accède aux capacités de virtualisation du noyau Linux, soit directement à travers la bibliothèque runc (disponible depuis Docker 0.9), soit indirectement via libcrt, LXC (Linux Containers) ou systemd-nspawn.

Utiliser Docker pour créer et gérer des conteneurs peut simplifier la mise en œuvre de systèmes distribués en permettant à de multiples applications, tâches de fond et autres processus de s'exécuter de façon autonome sur une seule machine physique ou à travers un éventail de machines isolées. 

### Qu’est-ce qu’un conteneur ?

L'objectif d'un conteneur est le même que pour un serveur dédié virtuel : héberger des services sur un même serveur physique tout en les isolant les uns des autres. 
Un conteneur est cependant moins figé qu'une machine virtuelle en matière de taille de disque et de ressources allouées.

Un conteneur permet d'isoler chaque service : le serveur web, la base de données, des applications pouvant être exécutées de façon indépendante dans leur conteneur dédié, contenant uniquement les dépendances nécessaires. 
Chaque conteneur peut être relié aux autres par des réseaux virtuels. Il est possible de monter des volumes de disque de la machine hôte dans un conteneur.

### Différences entre une VM et des conteneurs

## COMMANDES 🦁

## USEFUL LINKS 🤙🏼

### Incontournables

* [The comprehensive Introduction to Docker](http://blog.brew.com.hk/introduction-to-docker/)
* [A propos des images et des commandes](https://www.wanadev.fr/24-tuto-docker-demarrer-docker-partie-2/)
* [Comprendre et mettre en place Docker](https://guillaumebriday.fr/comprendre-et-mettre-en-place-docker)
* [Installation et foncionnement Docker](https://www.ionos.fr/digitalguide/serveur/configuration/tutoriel-docker-installation-et-premiers-pas/)

### Vidéos

* [Docker - Premiers pas 1](https://www.youtube.com/watch?v=fdlZqRZXWOc)
* [Presentation de Docker](https://www.youtube.com/watch?v=XgKOC6X8W28)

