# LOUGHLIMI_lab1

## Introduction: 
## Matériel:

La carte Intel DE10-Lite est une carte de développement pour système embarqué basée sur le FPGA (Field-Programmable Gate Array) Intel Cyclone V SE. 
Elle est conçue pour faciliter le développement et l'apprentissage en matière de conception de circuits numériques, d'architecture de système et de programmation de FPGA. 
Elle possède des ports d'entrée/sortie numériques et analogiques( d’un USB Blaster, de 64 MB de SDRAM, de 10 LEDs, 10 switchs et 2 boutons poussoirs.), ainsi qu'un accès à un processeur ARM Cortex-A9 pour une flexibilité accrue dans les applications embarquées.

![vv](https://user-images.githubusercontent.com/17486030/213537754-a8596423-053c-4a61-955d-452a68b3894b.png)

## L’outil utilisé:

L’outil utilisé dans ce TP est quartus 18.1 et Platform Designer qui permet de spécifier les exigences d'interface et d'intégrer les composants IP dans une représentation graphique du système. L'installation du logiciel Intel® Quartus® Prime comprend la bibliothèque IP FPGA d'Intel disponible dans le catalogue IP de Platform Designer.

il permet aussi d'intégrer des cœurs IP FPGA Intel optimisés et vérifiés dans une conception pour raccourcir les cycles de conception et maximiser les performances. Platform Designer prend également en charge l'intégration de cœurs IP de tiers ou de composants personnalisés que vous définissez.

## LAB-1 _ Let there be light :

##  Partie matérielle :

Le bloc matériel créé pour ce projet contient un horloge , Nios 2 processor , jtag uart une mémoire ram,  2 pio pour contrôler les entrées (les switchs) et les sorties  (les LEDs), et une bouton pousoire pour le control du Reset .

![ss](https://user-images.githubusercontent.com/17486030/213538541-2d15a957-9547-4fb9-8f88-bfecb0df5cc5.png)



## Partie Logicielle

le code fourni dans ce projet (le fichier /Software/Main.C ) , permet:

- [x] d'initialiser le motif en allumant la première LED, ce motif sera défini sur toutes les LED en les allumant une à une et continuera à l'infini.
 
- [x] La vitesse de fonctionnement est configurable par les interrupteurs.

- [x] Le bouton poussoir est utilisé pour réinitialiser le fonctionnement.


