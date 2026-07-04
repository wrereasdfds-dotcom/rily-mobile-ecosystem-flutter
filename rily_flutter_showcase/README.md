# RiLy Mobile Ecosystem — Flutter Showcase

Projet Flutter prêt pour GitHub, conçu pour montrer exactement les compétences demandées sur un stage Mobile Flutter : reprise d’un projet existant, architecture claire, intégration API REST/JSON, authentification, réservation, correction UI, Git/GitHub, documentation et préparation build Android/iOS.

> Statut : projet personnel de démonstration technique. Il peut être présenté dans un formulaire de stage comme preuve GitHub / portfolio.

## Modules inclus

### 1. Beauty Booking
Application type salon de beauté :
- liste des salons ;
- détail d’un salon ;
- services disponibles ;
- réservation d’un créneau ;
- statut de réservation ;
- UI responsive mobile.

### 2. Parking Booking
Application type réservation parking :
- liste des parkings ;
- disponibilité des places ;
- prix horaire ;
- réservation ;
- validation simple des données ;
- écran de confirmation.

### 3. Authentification
- écran login ;
- session utilisateur en mémoire ;
- protection des écrans internes ;
- architecture prête pour brancher une vraie API.

## Stack technique

- Flutter
- Dart
- Provider pour le state management
- HTTP / REST API architecture
- JSON parsing
- GitHub Actions CI
- Architecture feature-first
- Tests widget simples
- Documentation API et technique

## Pourquoi ce projet est aligné avec l’offre S B Solutions MA

L’offre demande une personne capable de :

- comprendre une architecture Flutter existante ;
- finaliser des écrans ;
- corriger des bugs UI ;
- intégrer des APIs backend ;
- gérer authentification et parcours utilisateur ;
- travailler avec Git/GitHub ;
- préparer des builds Android/iOS ;
- documenter les changements.

Ce repository couvre ces points avec une structure propre et facile à lire.

## Structure

```text
lib/
  core/
    constants/
    network/
    theme/
    widgets/
  features/
    auth/
    beauty/
    parking/
    reservations/
    home/
docs/
  api_contract.md
  technical_notes.md
.github/
  workflows/flutter_ci.yml
```

## Installation

```bash
git clone https://github.com/YOUR_USERNAME/rily-mobile-ecosystem-flutter.git
cd rily-mobile-ecosystem-flutter
flutter pub get
flutter run
```

Si le dossier Android/iOS n’existe pas encore après extraction du ZIP :

```bash
flutter create . --platforms=android,ios
flutter pub get
flutter run
```

## Identifiants démo

```text
Email: achraf.demo@rily.app
Password: demo1234
```

## Mode API

Le projet est livré avec un `MockApiClient` pour fonctionner sans backend. Pour brancher un vrai backend :

```bash
flutter run --dart-define=API_BASE_URL=https://api.example.com
```

Puis remplacer les méthodes mock par des appels HTTP dans `lib/core/network/api_client.dart`.

## Livrables démontrés

- écran login ;
- dashboard ;
- module salons beauté ;
- module parkings ;
- réservation ;
- liste des réservations ;
- services API mockés ;
- modèles Dart ;
- state management Provider ;
- documentation technique ;
- workflow CI GitHub.

## Roadmap

- connecter Firebase Auth ou backend JWT ;
- ajouter stockage local avec SharedPreferences ;
- ajouter notifications push ;
- ajouter paiement ;
- publier version Android interne ;
- ajouter tests unitaires plus complets.

## À mettre dans le formulaire

```text
GitHub : https://github.com/YOUR_USERNAME/rily-mobile-ecosystem-flutter
Projet Flutter/Dart démontrant une application mobile de réservation beauté + parking, avec architecture feature-first, authentification, state management Provider, intégration REST/JSON mockée, correction UI, documentation et préparation build Android/iOS.
```
