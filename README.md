# Modélisation Statistique : Régression Linéaire Multiple

## Objectif du Projet

Ce projet vise à prédire les **charges d'assurance médicale** en utilisant un modèle de **régression linéaire multiple**. Nous analysons plusieurs variables telles que l'âge, l'indice de masse corporelle (BMI), le statut de fumeur, le sexe, et la région géographique pour comprendre leur impact sur les coûts d'assurance.

## Jeu de Données

Le jeu de données utilisé dans ce projet contient des informations sur les assurés, notamment :

- **age** : Âge de l'assuré
- **bmi** : Indice de masse corporelle
- **children** : Nombre d'enfants
- **smoker** : Statut de fumeur (oui/non)
- **sex** : Sexe de l'assuré (homme/femme)
- **region** : Région géographique
- **charges** : Coûts d'assurance médicale (la variable cible)

## Outils Utilisés

- **Langage** : R
- **Bibliothèques** :
  - `ggplot2` : Pour la visualisation des données
  - `readxl` : Pour le chargement des données depuis un fichier Excel
  - `car` : Pour les tests de colinéarité
  - `lmtest` : Pour l'analyse des résidus

## Méthodologie 

### 1. Prétraitement des Données

- **Traitement des valeurs manquantes** : Le jeu de données ne contient pas de valeurs manquantes, aucune imputation n'est nécessaire.
- **Encodage des variables catégoriques** : Les variables catégoriques comme `sex`, `smoker`, et `region` ont été encodées en variables binaires ou en dummies pour la régression.

### 2. Analyse Exploratoire

- **Distribution des variables** : Utilisation de `ggplot2` pour visualiser la distribution des variables, notamment l'âge, le BMI, et les charges.
- **Corrélation** : Analyse des corrélations entre les variables quantitatives via un `heatmap` produit par `corrplot`. On observe des corrélations importantes entre les charges et certaines variables comme le statut de fumeur.

### 3. Construction du Modèle

- **Régression linéaire multiple** : 
  - Le modèle est construit avec la fonction `lm()` de R.
  - Variables indépendantes : `age`, `sex`, `bmi`, `children`, `smoker`, `region`.
  - Variable dépendante : `charges`.

## Résultats

Les variables les plus influentes sur les charges d'assurance sont :
- **Le statut de fumeur** : Les fumeurs ont des charges significativement plus élevées.
- **L'indice de masse corporelle (BMI)** : Plus le BMI est élevé, plus les charges augmentent.
- **L'âge** : L'âge a également un impact important, les personnes plus âgées payant plus cher.

Le modèle final présente de bons résultats avec un ajustement satisfaisant, permettant une prédiction fiable des charges d'assurance en fonction des caractéristiques des assurés.

## Conclusion 

Le modèle de régression linéaire multiple développé est efficace pour prédire les charges d'assurance médicale en fonction de caractéristiques démographiques et comportementales. Les résultats mettent en évidence l'importance de certaines variables, notamment le statut de fumeur et l'indice de masse corporelle, dans la détermination des coûts d'assurance. Ce modèle peut être utilisé pour des analyses futures et pour aider les compagnies d'assurance à mieux comprendre les facteurs influençant les charges.
