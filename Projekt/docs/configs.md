# Konfiguratsioonifailid

Kõik konfiguratsioonifailid asuvad `config/` kaustas.

---

## docker-compose.yml

Peamine fail, mis käivitab kõik kolm teenust korraga.

Defineerib:
- `nginx` – reverse proxy teenus
- `manager` – Manager.io raamatupidamistarkvara
- `backup` – automaatne varundamisteenus
- `app_network` – sisemine Docker võrk
- `manager_data` – Manager.io andmete salvestus
- `backup_data` – varukoopiate salvestus

---

## config/nginx.conf

Nginx seadistus, mis suunab kõik päringud Manager.io-le.

Olulised read:
- `listen 80` – kuulab porti 80
- `proxy_pass http://manager:8080` – suunab Manager.io-le

---

## config/.env.example

Näidisfail keskkonnamuutujatega. Kopeeri `.env` nimega:

```bash
cp config/.env.example config/.env
```

Muutujad:
- `BACKUP_RETENTION_DAYS` – mitu päeva varukoopiaid hoitakse (vaikimisi 7)

---

## config/backup.sh

Bash skript Manager.io andmete varundamiseks.

Mida teeb:
1. Loob varukoopiafaili nimega `managerio-backup-KUUPÄEV.tar.gz`
2. Salvestab `/backup` kausta
3. Kustutab vanemad kui 7 päeva varukoopiad automaatselt
