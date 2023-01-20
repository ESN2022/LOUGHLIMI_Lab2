# LOUGHLIMI_lab2

## LAB-2 _ Counter :
## Introduction:
Le laboratoire 2, intitulé "Let's count stuff", a pour objectif de créer un système Nios II de base, d'implémenter un compteur décimal à un chiffre et de l'afficher sur un afficheur 7 segments. Pour ce faire, nous devrons écrire le logiciel du compteur, créer un composant bin_to_7seg.vhd et câbler le système. Nous poursuivrons ensuite en implémentant un compteur à trois chiffres et en l'affichant sur un afficheur 7 segments en utilisant soit du matériel ou du logiciel pour convertir le nombre en BCD. Enfin, nous ajouterons un timer à notre design pour compter avec des interruptions et en écrivant une ISR (Interruption Service Routine) pour incrémenter un compteur à 4 bits, la valeur du compteur étant envoyée à une instance VHDL et en concevant un décodeur binaire vers 7 segments


![Capture5](https://user-images.githubusercontent.com/17486030/213668340-39e82fb5-3730-42ff-b852-da3093372db8.PNG)


##  Partie matérielle :

Dans ce laboratoire, nous utilisons un système de blocs (qsys) qui comprend non seulement la base, mais aussi deux composants PIO (Peripheral Input/Output) et un composant timer. Le premier PIO permet de transmettre la valeur du compteur de la partie logicielle vers la partie matérielle, tandis que le second PIO permet à la partie logicielle de récupérer les états des 8 premiers switchs. Le timer, quant à lui, permet de déclencher une interruption régulièrement.

En ce qui concerne les blocs matériels que j'ai codés personnellement, ils sont au nombre de trois. Le premier, appelé DoubleDabble, reçoit la valeur du compteur du logiciel et retourne cette même valeur décomposée en centaine, dizaine et unités. Le deuxième, appelé bin_to_7seg, prend en entrée l’une des trois sorties du bloc précédent et se charge de l’afficher correctement sur un afficheur 7 segments. Le dernier, appelé Top-Level Entities, permet de câbler le bloc qsys avec les blocs précédents et les pins de la clock, du bouton poussoir pour le reset, des 3 afficheurs 7 segments et des 8 switchs.


![Capture6](https://user-images.githubusercontent.com/17486030/213668601-d6bcc858-94ff-428d-a036-246e3175e557.PNG)



## Partie Logicielle
Le logiciel fonctionne de la manière suivante :

- [x] Tout d'abord, la période du timer, qui détermine la vitesse de comptage, est modulée en fonction de la valeur numérique sur 7 bits qui résulte de l'état des 7 premiers switchs.
- [x] Ensuite, le timer est démarré.
- [x] Lorsque le timer arrive à zéro, il déclenche la fonction d'interruption prévue.
- [x] Selon la position du 8ème switch, la valeur du compteur est incrémentée ou décrémentée en restant entre 0 et 999. Cette valeur est ensuite transmise au composant DoubleDabble.
- [x] La période du timer est de nouveau modulée en utilisant la même méthode.
- [x] Enfin, le timer est redémarré pour continuer à compter.




![Capture8](https://user-images.githubusercontent.com/17486030/213680061-095bb24a-6436-45fc-98af-a5a2c3427600.PNG)
