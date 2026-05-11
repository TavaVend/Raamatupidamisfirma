# Meeskond

## Liikmed

| Nimi | Roll | Ülesanded |
|---|---|---|
| Johannes | Otsustav isik / projektijuht | Lõi ja seadistas Ubuntu serveri, pani Manager.io teenuse püsti, projekti koordineerimine |
| Erik | Liige | Lõi GitHubi repo, üles laadis kõik konfiguratsioonifailid ja dokumentatsiooni |
| Kennerth | Liige | Süsteemi testimine, kontrollis et kõik teenused töötavad korrektselt |

---

## Stsenaarium

| Parameeter | Väärtus |
|---|---|
| Kasutajate arv | 17 |
| Ettevõtte tüüp | Raamatupidamisfirma |
| Eritingimus | Varukoopiad on kohustuslikud |

---

## Meeskonna otsused

**Miks Manager.io?**
Meeskond otsis Reddit r/selfhosted kogukonnast soovitusi. Manager.io valiti kuna see on tasuta, lihtne kasutada ja töötab Docker konteineris. See sobib täpselt raamatupidamisfirmale.

**Miks Ubuntu Server?**
Ubuntu on stabiilne ja tasuta serverite operatsioonisüsteem. Docker töötab sellel väga hästi ja SSH kaudu saab serverit hallata kõikjalt ilma füüsiliselt kohal olemata.

**Miks Docker?**
Docker lihtsustab teenuste käivitamist - ühe käsuga (`docker-compose up -d`) käivituvad kõik teenused korraga. Ei pea iga programmi eraldi installima.
