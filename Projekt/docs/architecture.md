# Arhitektuur

## Ülevaade

Süsteem põhineb kolmel Docker konteineril, mis töötavad ühes võrgus.

```
[Kasutaja brauser]
        |
        | HTTP port 80
        |
   [Nginx konteiner]
        |
        | HTTP port 8080 (sisevõrk)
        |
 [Manager.io konteiner]
        |
        | Docker volume
        |
   [manager_data]
        |
   [Backup konteiner] → [backup_data]
```

---

## Komponendid

### Nginx
- Reverse proxy
- Ainuke avalikult ligipääsetav teenus (port 80)
- Suunab liikluse Manager.io-le

### Manager.io
- Raamatupidamistarkvara
- Töötab sisevõrgus (port 8080, ei ole otse internetist nähtav)
- Andmed salvestatakse `manager_data` volume'isse

### Backup teenus
- Alpine Linux konteiner
- Käivitab `backup.sh` skripti iga päev
- Loeb `manager_data` volume'ist andmeid
- Salvestab varukoopiad `backup_data` volume'isse
- Hoiab varukoopiad 7 päeva

---

## Turvalisus

- Manager.io ei ole otse internetist ligipääsetav
- Kõik teenused suhtlevad suletud Docker võrgus (`app_network`)
- Ainult Nginx on avalik

---

## Võrk

Kõik teenused on samas Docker võrgus `app_network`. Teenused näevad üksteist nimepidi (nt `nginx` saab ühenduda `manager:8080`-ga).
