# SUBLIMA

### **Sublima est un tableau interactif portant sur les changements d'états de l'eau.**
> Divisé en trois phases (l'eau liquide, la vapeur et la glace), ce projet combine l'interaction de l'utilisateur via clavier et souris à des visuels et une trame sonore à la fois rétroactifs et génératifs.

## Mode d'utilisation
1. Ouvrir le projet Max/MSP à l'adresse `sublima-maxmsp/sublima-maxmsp.maxproj`;
2. Exécuter le script Processing situé dans le dossier `sublima-p5`;

Si vous voulez tester l'application Processing sans Max/MSP, changez l'instruction à la ligne 15 de `sublima.pde` pour:
```
   allowMSP = false;
```

## Phases
- Pour sortir de la **phase gazeuse**, bougez la souris autour de l'écran. Un halo devrait apparaître en arrière-plan.
- Pour sortir de la **phase liquide**, cliquez sur toutes les orbes flottant sur l'écran.
- Il est présentement impossible de sortir de la **phase solide**.