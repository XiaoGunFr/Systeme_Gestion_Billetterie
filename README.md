# Système de Gestion de Billetterie

Projet de base de données avancée pour la gestion d'un système de billetterie d'événements (films, concerts) avec réservations et gestion de créneaux de connexion.

## Prérequis

- PostgreSQL (version 12 ou supérieure)
- Bash (pour les scripts d'initialisation)

## Installation

1. **Cloner le projet**

2. **Configurer la base de données**
   
   Modifiez les fichiers `init.sh` et `drop.sh` :
   ```bash
   DB_USER=votre_utilisateur
   DB_NAME=votre_base_de_donnees
   ```

3. **Initialiser la base de données**
   ```bash
   chmod +x init.sh drop.sh
   ./init.sh
   ```

## Structure du projet

```
.
├── Creation/
│   ├── sql/              # Scripts SQL de création
│   │   ├── create_table.sql
│   │   ├── create_triggers.sql
│   │   └── insert_data.sql
│   └── csv/              # Données d'exemple
│       ├── users.csv
│       ├── categories.csv
│       └── etablissements.csv
├── Etudes/
│   ├── scenarios.sql     # Fonctions métier
│   └── affichages.sql    # Fonctions d'affichage
├── init.sh               # Script d'initialisation
└── drop.sh               # Script de suppression
```

## Fonctionnalités principales

### Gestion des utilisateurs
- 3 statuts : Normal (5 billets max), VIP (10), VVIP (20)
- Système de connexion avec créneaux limités
- Détection des utilisateurs suspects

### Gestion des événements
- Films et concerts
- Événements privés avec pré-inscription
- Sous-événements VIP

### Gestion des billets
- Pré-réservation et confirmation
- Système de promotions
- Échange de billets entre utilisateurs
- 6 catégories de places (Unique, UniqueVIP, Carré Or, Cat1-4)

### Système temporel
- Gestion du temps simulée (jour/heure)
- Nettoyage automatique des événements passés

## Exemples d'utilisation

### Réserver un billet
```sql
SELECT transaction_reservation_billet('user@example.com', 'billet-id', 10);
```

### Inscrire à un événement privé
```sql
SELECT inscription_evenement_prive('user@example.com', 'FilmIronMan1VIP');
```

### Afficher les événements disponibles
```sql
SELECT * FROM affichage_evenement();
```

### Avancer dans le temps
```sql
SELECT increment_temps_heure();  -- +1 heure
SELECT increment_temps_jour();   -- +1 jour
```

## Réinitialisation

Pour supprimer toutes les tables et recommencer :
```bash
./drop.sh
./init.sh
```

## Auteurs

- @guillaume-xue
- @XiaoGunFr

## Licence

MIT License - voir le fichier [LICENCE](LICENCE)
