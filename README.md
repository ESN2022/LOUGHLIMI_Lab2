# LOUGHLIMI_lab2

## LAB-2 _ Counter :
## Introduction:

Dans ce compte rendu, nous allons décrire les étapes nécessaires pour afficher les données de gyroscopie de notre carte DE10-Lite .


Nous allons commencer par décrire l'architecture système, puis nous allons décrire les étapes nécessaires pour mettre en place un système de base Nios. Ensuite, nous expliquerons comment interface l'accéléromètre à l'aide de l'interface I2C ou SPI en utilisant les IP Opencore disponibles dans QSYS. Nous allons également réécrire les fonctions I2C_READ et I2C_Write selon nos spécifications pour effectuer la lecture et l'écriture des données. Nous allons ensuite afficher les données d'accélération à travers JTAG_UART. Ensuite, nous allons calibrer le capteur en utilisant la gravité et I2C_Write. Enfin, nous ajouterons le (timer + PIO + BinTo7Seg) setup de ESN 11 dans notre design et implémenterons un bouton pour permuter entre les différents axes.

![Capture5](https://user-images.githubusercontent.com/17486030/213668340-39e82fb5-3730-42ff-b852-da3093372db8.PNG)


##  Partie matérielle :




![Capture6](https://user-images.githubusercontent.com/17486030/213668601-d6bcc858-94ff-428d-a036-246e3175e557.PNG)



## Partie Logicielle

Le logiciel fonctionne de la manière suivante :
   
    
    
    
    
- [x] Calibrer l'accéléromètre de notre carte (en utilisant la gravité)
- [x] Interroger les données d'accélération toutes les secondes
- [x] Lire les accélérations le long des axes X, Y et Z
- [x] Afficher ces valeurs sur l'afficheur 7 segments (l'accélération peut être négative)
- [x] Permuter entre les valeurs en utilisant un bouton poussoir


![Capture8](https://user-images.githubusercontent.com/17486030/213680061-095bb24a-6436-45fc-98af-a5a2c3427600.PNG)
