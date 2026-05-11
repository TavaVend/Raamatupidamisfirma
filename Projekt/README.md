# IT infrastruktuur – Raamatupidamisfirma

## Mis on see projekt?

Meie meeskond seadistas väikese raamatupidamisfirma (17 kasutajat) IT infrastruktuuri.

Raamatupidamistarkvarana kasutame **[Manager.io](https://www.manager.io/)** – see on tasuta, avatud lähtekoodiga self-hosted raamatupidamistarkvara.

Me ei kirjutanud tarkvara ise. Me valisime olemasoleva lahenduse ja seadistasime selle oma firmale.

---

## Miks Manager.io?

- Täiesti tasuta ja self-hosted
- Lihtne kasutada – sobib raamatupidajatele
- Toetab mitut kasutajat (meie firmale 17)
- Sisseehitatud varukoopiate tegemine
- Töötab Docker konteineris

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

## Kiirkäivitus

```bash
cp config/.env.example config/.env
docker-compose up -d
```

Ava brauser: `http://localhost`

---

## Dokumentatsioon

| Dokument | Kirjeldus |
|---|---|
| [docs/team.md](docs/team.md) | Meeskond ja rollid |
| [docs/project.md](docs/project.md) | Projekti kirjeldus ja nõuded |
| [docs/architecture.md](docs/architecture.md) | Süsteemi arhitektuur |
| [docs/configs.md](docs/configs.md) | Konfiguratsioonifailide seletus |
