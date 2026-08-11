# Mluvené poznámky ke každému slajdu — Letní škola sítí: 7. Docker a kontejnerizace

Scénář je psaný pro lektory i účastníky. Text po značce **Řekni** představuje hotovou formulaci výkladu, **Zapojení / ukázka** uvádí praktické akce v učebně a **Přechod** pomáhá plynule navázat na další téma.

---

## 1. Titulní slajd — Docker

**Řekni:** „Vítám vás u modulu 7. Docker a kontejnerizace. Dnes si vysvětlíme architekturu Dockeru, rozdíl oproti virtuálním strojům, práci s Dockerfile, sítěmi, volumes a Docker Compose.“

**Zapojení / ukázka:** Zeptejte se účastníků: „Kdo z vás už někdy používal kontejner nebo Docker?“

**Přechod:** „Začněme první kategorií: Co to je Docker a proč ho používáme.“

---

## 2. Co to je Docker?

**Řekni:** „Docker je nástroj pro virtualizaci na úrovni OS. Vytváří izolované souborové systémy a prostředí, ve kterých aplikace běží bez zásahu do okolního systému.“

**Zapojení / ukázka:** Odhalte nejprve pojem `Kontejner` a ptejte se publikum na jejich představu o izolaci aplikací.

**Přechod:** „Podívejme se na základní architekturu Dockeru.“

---

## 3. Architektura Dockeru

**Řekni:** „Architektura se skládá ze tří částí: Docker Client (CLI příkazy v terminálu), Docker Daemon (Engine běžící na pozadí, který staví a spouští kontejnery) a Docker Registry (Hub, kde se stahují hotové imagi).“

**Zapojení / ukázka:** Vysvětlete, že příkaz z klienta komunikuje přes socket přímo s démonem.

**Přechod:** „Jaké jsou klíčové výhody kontejnerizace?“

---

## 4. Jaká jsou využití a výhody?

**Řekni:** „Hlavními výhodami jsou izolace závislostí, 100% kompatibilita napříč vývojovým i produkčním prostředím a rychlá spustitelnost.“

**Zapojení / ukázka:** Ukažte scénář konfliktu knihoven v Pythonu nebo Node.js.

**Přechod:** „Srovnejme si Docker s běžným virtuálním strojem.“

---

## 5. VM vs. Kontejner

**Řekni:** „Zatímco VM virtualizuje hardware a potřebuje celý guest OS (desítky GB a stovky MB RAM), kontejner sdílí jádro hostitelského OS (MB paměti a start v milisekundách).“

**Zapojení / ukázka:** Projděte hodnoty v tabulce srovnání Debian VM vs. Debian Kontejner.

**Přechod:** „Přejděme do druhé kategorie: Koncepty, Sítě a Dockerfile.“

---

## 6. Docker Image vs. Kontejner

**Řekni:** „Docker Image je statický neměnný snapshot (šablona), vytvořená z Dockerfile. Kontejner je pak spuštěná běžící instance tohoto image.“

**Zapojení / ukázka:** Přirovnejte Image k receptu nebo třídě (Class) a Kontejner k upečenému dortu nebo objektu (Object).

**Přechod:** „Co se stane s daty po vypnutí kontejneru?“

---

## 7. Persistence dat (Volumes)

**Řekni:** „Kontejnery jsou ze své podstaty stateless — smazáním kontejneru se zruší i jeho změněný filesystem. Pokud chceme data zachovat (databáze, logy), používáme Docker Volumes nebo Bind Mounts přes parametr `-v`.“

**Zapojení / ukázka:** Vysvětlete syntaxi `-v /cesta/na/hostiteli:/cesta/v/kontejneru`.

**Přechod:** „Jak probíhá síťová komunikace kontejneru?“

---

## 8. Mapování síťových portů

**Řekni:** „Kontejner má izolovaný síťový stack. Abychom se dostali k webové aplikaci uvnitř, musíme namapovat porty pomocí `-p host_port:container_port`.“

**Zapojení / ukázka:** Ukažte příklad `-p 8080:80` — port 80 v kontejneru je přístupný na portu 8080 hostitelského počítače.

**Přechod:** „Nyní si rozebereme tvorbu vlastního obrazu pomocí Dockerfile.“

---

## 9. Dockerfile — Základní instrukce

**Řekni:** „V Dockerfile instrukce `FROM` definuje základní image, `WORKDIR` pracovní složku a `COPY` přenáší soubory z hostitelského PC.“

**Zapojení / ukázka:** Zdůrazněte důležitost volby lehkého základního obrazu (např. `debian:slim` nebo `alpine`).

**Přechod:** „Jak v Dockerfile spouštíme příkazy?“

---

## 10. Dockerfile — Běh a příkazy

**Řekni:** „Instrukce `RUN` spouští příkazy během buildu (instalace balíčků), `USER` nastaví neprivilegovaného uživatele a `CMD` určí příkaz při startu kontejneru.“

**Zapojení / ukázka:** Vysvětlete rozdíl mezi `RUN` (builduje image) a `CMD` (běží až v kontejneru).

**Přechod:** „Podívejme se na kompletní ukázku Dockerfile.“

---

## 11. Ukázka Dockerfile

**Řekni:** „Zde vidíme kompletní recept: stažení Debianu, instalace curlu, vytvoření složky, zkopírování skriptu, přepnutí na bezpečný účet `appuser` a spuštění skriptu.“

**Zapojení / ukázka:** Projděte ukázku kódu na slajdu.

**Přechod:** „Pojďme do třetí kategorie: Práce s CLI a Docker Compose.“

---

## 12. Instalace na Kali Linux

**Řekni:** „Instalace v Kali zabere pár příkazů z oficiálních repozitářů. Nezapomeňte přidat uživatele do skupiny `docker`, abyste nemuseli psát `sudo`.“

**Zapojení / ukázka:** Nechte účastníky v terminálu zadat příkazy pro instalaci.

**Přechod:** „Jak pracujeme s imagi v příkazové řádce?“

---

## 13. Práce s imagi v CLI

**Řekni:** „Obraz stáhneme pomocí `docker pull`, stažené imagi zobrazíme přes `docker images` a vlastní Dockerfile sestavíme příkazem `docker build -t moje-aplikace .`.“

**Zapojení / ukázka:** Předveďte v terminálu sestavení image z aktuálního adresáře (`.`).

**Přechod:** „Jak spouštíme kontejnery z CLI?“

---

## 14. Spouštění kontejnerů

**Řekni:** „Pro interaktivní práci v terminálu použijeme `docker run -it --rm ubuntu bash`. Pro běh webserveru na pozadí použijeme parametr `-d` spolu s mapováním portů `-p 8080:80`.“

**Zapojení / ukázka:** Spusťte Nginx na pozadí a otevřete `localhost:8080` v prohlížeči.

**Přechod:** „Jak spravujeme běžící a zastavené kontejnery?“

---

## 15. Správa a kontrola kontejnerů

**Řekni:** „Seznam běžících kontejnerů získáme přes `docker ps`. Pro prohlížení logů slouží `docker logs <id>` a pro vstup do běžícího kontejneru `docker exec -it <id> bash`.“

**Zapojení / ukázka:** Předveďte příkaz `docker exec`, kterým se připojíte do spuštěného Nginx kontejneru.

**Přechod:** „Co dělat, když potřebujeme propojit více kontejnerů najednou?“

---

## 16. Docker Compose

**Řekni:** „Docker Compose umožňuje definovat celou vícekontejnerovou aplikaci (např. web + databázi) v jediném deklarativním souboru `docker-compose.yml`.“

**Zapojení / ukázka:** Vysvětlete výhodu oproti psaní dlouhých jednoplánových `docker run` příkazů.

**Přechod:** „Podívejme se na příklad konfigurace `docker-compose.yml`.“

---

## 17. Ukázka docker-compose.yml

**Řekni:** „V této ukázce definujeme dvě služby: `web` s obrazem Nginx na portu 8080 a `db` s databází MySQL a nastaveným heslem v proměnných prostředí.“

**Zapojení / ukázka:** Projděte sekci `services`, `ports` a `environment`.

**Přechod:** „Jaké příkazy se používají k ovládání Docker Compose?“

---

## 18. Příkazy Docker Compose

**Řekni:** „Všechny služby spustíme jedním příkazem `docker-compose up -d`. Stav a logy zkontrolujeme přes `docker-compose ps` a `logs`, a vše bezpečně zastavíme a uklidíme přes `docker-compose down`.“

**Zapojení / ukázka:** Nechte nejdřív zviditelnit samotné příkazy a vyzkoušejte je s účastníky.

**Přechod:** „Skvělá práce, tímto jsme si prošli kompletní teorii i praxi Dockeru a Docker Compose!“


