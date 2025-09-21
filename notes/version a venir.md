# Versions a venir

## Phase 0 - Fondations techniques
- Choisir l'architecture (app web locale, desktop, etc.) et les librairies front/back.
- Initialiser le repo: outils (lint, format, tests), gestion env/secret, scripts.
- Modeliser les entites (JourTravail, Session) et les formats de stockage.
- Mettre en place la persistence locale (fichier JSON ou SQLite) avec couche d'abstraction.
- Definir plan de test automatique et un fichier README de setup.

## Version 1.0 - Saisie et calcul du temps
### Objectifs
- Permettre a l'utilisateur de saisir debut, fin et pause pour un jour.
- Calculer automatiquement le total journalier.
- Sauvegarder la saisie dans la persistence locale.

### Taches clefs
- Construire le formulaire principal avec boutons Enregistrer.
- Implementer les regles metier (validation, calcul total, gestion des heures manquantes).
- Ecrire le module de stockage (lecture/ecriture et schema du fichier).
- Exposer un bouton "ouvrir les fichiers" pointant vers le repertoire de donnees.
- Ajouter tracking des erreurs et feedback visuel (etat de chargement, confirmation).
- Couvrir le flux de base via tests unitaires et un test fonctionnel.

### Definition de fait
- Scenario complet saisie -> sauvegarde -> rechargement fonctionne.
- Format des donnees documente.
- Tests passent sur l'integration continue.

## Version 1.1 - Services d'export
### Objectifs
- Produire trois exports: CSV, TXT tabulaire, TXT liste.
- Permettre a l'utilisateur de telecharger ou ouvrir chacun des formats.

### Taches clefs
- Formaliser les formats (ordre des colonnes, separateur, entete).
- Factoriser la conversion des donnees (reutilisable par chaque service).
- Integrer des boutons d'export avec retour d'etat (succes ou erreur).
- Ajouter des tests sur la structure des fichiers generes.
- Documenter comment consommer ces exports.

### Definition de fait
- Les trois fichiers sont generes avec les memes donnees pour un jour.
- Gestion des erreurs utilisateur (fichier ouvert, droits).
- Les exports sont couverts par un test snapshot ou comparaison.

## Version 1.2 - Historique et indicateurs rapides
### Objectifs
- Afficher un widget d'etat global (chargement et resume).
- Lister les 5 derniers jours avec leurs totaux.
- Calculer et afficher le previsionnel de la journee apres la saisie de l'arrivee.

### Taches clefs
- Creer les composants UI pour le widget et l'historique.
- Ajouter un service qui agrege les donnees (dernieres entrees, total, reste a faire).
- Mettre en place un cache ou loader pour eviter les relectures multiples.
- Ecrire des tests pour les calculs d'indicateurs et l'affichage conditionnel.

### Definition de fait
- Historique toujours a jour apres saisie ou edition.
- Widget rend correctement l'etat (idle, chargement, succes, erreur).
- Tests snapshot ou visuels de l'historique.

## Version 1.3 - Edition de l'historique
### Objectifs
- Permettre d'editer un jour passe via modal et calendrier.
- Colorer le calendrier selon le niveau de temps de travail.
- Rafraichir l'historique et les exports apres sauvegarde.

### Taches clefs
- Concevoir le composant calendrier et la logique de coloration.
- Pre-remplir le formulaire modal avec les donnees du jour choisi.
- Afficher un indicateur de chargement et un feedback de succes.
- Mettre a jour les services de calcul et d'historique apres modification.
- Ecrire des tests d'interaction (selection jour, sauvegarde).

### Definition de fait
- Edition d'un jour ajuste toutes les vues sans rechargement manuel.
- Coloration coherente sur plusieurs semaines.
- Tests couvrant les cas d'edition et de conflit.

## Version 1.4 - Automatisations et bonus
### Objectifs
- Envoyer des resumes (email, Discord, Drive) a partir des exports.
- Ajouter un systeme de log pour les operations critiques.
- Fournir des statistiques hebdomadaires et mensuelles.
- Proposer un calendrier recapitulatif visuel.

### Taches clefs
- Abstraire un service de notification et parametrer chaque canal.
- Selectionner une librairie de logging et definir la rotation des fichiers.
- Calculer les agregats (semaine ou mois) et afficher dans le calendrier recap.
- Programmer les envois (manuel ou planifie) avec configuration.
- Renforcer la securite (stockage des secrets, retries, validation des cibles).
- Ecrire des tests pour les integrateurs externes (mocks) et les stats.

### Definition de fait
- Notifications testees (environnement de dev plus preproduction).
- Logs consultables et filtrables.
- Tableaux ou stats valides par rapport a des jeux de donnees tests.

## Backlog technique
- Gestion multi-utilisateur ou multi-projet.
- Import de donnees existantes.
- Synchronisation cloud ou offline.
- Application mobile ou widget systeme.
- Automatisation du pointage via detection d'activite (IDE, calendrier).
