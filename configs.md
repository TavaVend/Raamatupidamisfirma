# Arhitektuur

## Ülevaade

Süsteem töötab **Ubuntu Serveril** kolme Docker konteinerina.

Ubuntu valiti kuna:
- Docker töötab stabiilselt Linuxil
- SSH kaudu saab serverit hallata kõikjalt
- Tasuta ja usaldusväärne serverite operatsioonisüsteem

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

### Ubuntu Server
- Operatsioonisüsteem millel kõik töötab
- Ligipääs SSH kaudu: `ssh rpfserver@10.69.41.78`
- Asub VPN võrgus (TPTLAB-STUDVPN)

### Nginx
- Reverse proxy
- Ainuke avalikult ligipääsetav teenus (port 80)
- Suunab liikluse Manager.io-le

### Manager.io
- Raamatupidamistarkvara
- Töötab sisevõrgus (port 8080)
- Andmed salvestatakse `manager_data` volume'isse

### Backup teenus
- Käivitab `backup.sh` skripti iga päev automaatselt
- Salvestab varukoopiad `backup_data` volume'isse
- Hoiab varukoopiad 7 päeva

---

## Varukoopiate kontrollimine

```bash
# Käivita varukoopia käsitsi
sudo docker exec projekt_backup_1 sh /backup.sh

# Vaata varukoopiate nimekirja
sudo docker exec projekt_backup_1 ls /backup
```

---

## Turvalisus

- Manager.io ei ole otse internetist ligipääsetav
- Teenus on kättesaadav ainult VPN kaudu (TPTLAB-STUDVPN)
- Kõik teenused suhtlevad suletud Docker võrgus (`app_network`)

---

## Võrk

Teenus asub VPN võrgus. URL: `http://10.69.41.78`
