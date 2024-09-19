# Projet : Book Track (Système de Gestion de Bibliothèque)

## Objectif

Vous allez devoir développer un système simple de gestion de livres, où les utilisateurs peuvent emprunter et retourner des livres, et où l'historique des opérations est suivi.

Vous devrez implémenter deux classes principales :
- **Book** : pour représenter un livre.
- **Library** : pour gérer une collection de livres.

## Prérequis

- Avoir des connaissances de base en Dart.
- Forker ce dépôt pour commencer à travailler sur votre propre copie du projet.

## Étapes du projet

### 1. Forker ce dépôt

1. Cliquez sur le bouton **Fork** en haut à droite de cette page.
2. Clonez votre dépôt forké en utilisant la commande suivante dans votre terminal :
   ```bash
   git clone https://github.com/<votre-nom-utilisateur>/biblio_track.git
   cd biblio_track
   ```

### 2. Structure du projet

Voici la structure de base du projet que vous allez compléter :

```
biblio_track/
├── lib/
│   ├── book.dart           # Classe Book à implémenter
│   ├── library.dart        # Classe Library à implémenter
│   └── biblio_track.dart   # Point d'entrée du programme
└── test/
    └── book_library_test.dart   # Tests à exécuter (déjà fournis)
```

### 3. Implémentation des classes

#### **Classe `Book` (`lib/book.dart`)**

Vous devez implémenter la classe `Book` avec les spécifications suivantes :

- **Propriétés** :
  - `String title` : le titre du livre.
  - `String? author` : l'auteur du livre (optionnel).
  - `bool isAvailable` : indique si le livre est disponible (initialisé à `true` par défaut).
  - `List<String> history` : liste des actions effectuées sur le livre (emprunt, retour).

- **Méthodes** :
  - `Future<void> borrow()` : emprunte le livre (délais simulé de 2 secondes).
  - `Future<void> returnBook()` : retourne le livre après 2 secondes.
  - `void log(String action)` : enregistre une action dans l'historique du livre.
  - `void showHistory()` : affiche l'historique des actions sur le livre.

#### **Mixin `History` (`lib/book.dart`)**

Vous devez implémenter un mixin `History` qui sera appliqué à la classe `Book`. Ce mixin permet de gérer l'historique des actions (emprunt, retour).

- Méthodes à implémenter dans le mixin `History` :
  - `void log(String action)` : ajoute une action à l'historique.
  - `void showHistory()` : affiche toutes les actions dans l'historique.

#### **Classe `Library` (`lib/library.dart`)**

Vous devez implémenter la classe `Library<T>` avec les spécifications suivantes :

- **Propriétés** :
  - `List<T> resources` : une liste de ressources, où `T` peut être n'importe quel type (dans ce projet, il s'agira de livres).

- **Méthodes** :
  - `void add(T resource)` : ajoute une ressource à la bibliothèque.
  - `void showAvailableBooks()` : affiche uniquement les livres disponibles dans la bibliothèque.

### 4. Pousser votre code

Une fois que vous avez terminé votre implémentation, vous devrez :

1. Ajouter et committer vos changements :
   ```bash
   git add .
   git commit -m "Step1"
   ```

2. Pousser votre code sur votre dépôt forké :
   ```bash
   git push origin main
   ```

### 5. Créer une Pull Request

Vous poussez votre code sur votre dépôt forké, créez une **Pull Request** (PR) vers le dépôt d'origine pour soumettre votre solution. Voici comment :

1. Allez sur la page de votre dépôt forké sur GitHub.
2. Cliquez sur le bouton **New pull request**.
3. Donnez un titre à votre Pull Request, puis soumettez-la.

---

Bon codage !

---
