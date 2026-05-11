# IT infrastruktuur – Raamatupidamisfirma

## Mis on see projekt?

Meie meeskond seadistas väikese raamatupidamisfirma (17 kasutajat) IT infrastruktuuri.

Raamatupidamistarkvarana kasutame **[Manager.io](https://www.manager.io/)** – see on tasuta, avatud lähtekoodiga self-hosted raamatupidamistarkvara.

Me ei kirjutanud tarkvara ise. Me valisime olemasoleva lahenduse ja seadistasime selle oma firmale.

---

## Miks Ubuntu Server?

- Lihtsam Dockerit kasutada kui Windowsil
- SSH kaudu saab serverit hallata kõikjalt
- Stabiilne ja tasuta operatsioonisüsteem
- Sobib ideaalselt serveri keskkonnaks

---

## Ligipääs teenusele

Teenus töötab VPN võrgus. Ligipääsuks on vaja:

1. Ühenda **TPTLAB-STUDVPN**-iga
2. Ava brauser ja mine: `http://10.69.41.78`

---

## Kuidas süsteem töötab?

```
Kasutaja (brauser)
      ↓
   Nginx (port 80)
      ↓
 Manager.io (port 8080)
      ↓
  Andmed salvestatakse (Docker volume)
      ↓
  Backup teenus (iga päev automaatselt)
```

---

## Varukoopiate kontrollimine

Käivita varukoopia käsitsi:
```bash
sudo docker exec projekt_backup_1 sh /backup.sh
```

Vaata kas varukoopia tekkis:
```bash
sudo docker exec projekt_backup_1 ls /backup
```

Peaks näitama midagi sellist:
```
managerio-backup-2026-05-11.tar.gz
```

---

## Kiirkäivitus (järgmisel korral)

```bash
ssh rpfserver@10.69.41.78
cd Raamatupidamisfirma/Projekt
sudo docker-compose up -d
```

---

## Dokumentatsioon

| Dokument | Kirjeldus |
|---|---|
| [docs/team.md](docs/team.md) | Meeskond ja rollid |
| [docs/project.md](docs/project.md) | Projekti kirjeldus ja nõuded |
| [docs/architecture.md](docs/architecture.md) | Süsteemi arhitektuur |
| [docs/configs.md](docs/configs.md) | Konfiguratsioonifailide seletus |
