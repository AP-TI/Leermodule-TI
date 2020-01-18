# Postman

## Database

> werkt hetzelfde als files, vandaar enkel een get-voorbeeld:

![getDB](afb/createDatabase.png)

## Files

> sidenote: soms kan het belangrijk zijn om ingelogd te zijn: dit zijn de credentials van je fauxton (couchdb), zoals bijvoorbeeld username 'admin', password 'admin':

![auth](afb/authAdmin.png)

### Get

![get](afb/getLimoen.png)

### Put

> Initial: aanmaken van het object: zonder "_rev"

> De eerste keer is het niet nodig om er "_rev" bij te zetten. Dit wordt automatisch gegenereerd.

![put1](afb/putLimoen.png)

> Wijziging wanneer het object al bestaat: met "_rev"

![put2](afb/wijzigLimoen.png)


### Delete

![delete](afb/deleteLimoen.png)

## Views

### Get

![getView](afb/getView.png)

### Put

> Initial: aanmaken van het object: zonder "_rev"

> Wijzigen: met "_rev" zoals bij een file

![putView](afb/putNewView.png)


### Delete

![delete](afb/deleteView.png)