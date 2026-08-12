# Mluvené poznámky — Letní škola sítí: 5. Docker

Poznámky jsou záměrně krátké. U každého mikro-slajdu nejdřív vysvětlete jednu myšlenku, potom se zeptejte na jednoduchý příklad.

## Úvod

**Titulní slajd:** Docker přirovnejte ke krabičce, která přenáší aplikaci i její prostředí. Zeptejte se, kdo už slyšel větu „u mě to funguje“.

**Co si odneseme:** Řekněte, že cílem není memorovat všechny příkazy, ale pochopit čtyři pojmy: image, kontejner, volume a port.

**Proč Docker vznikl:** Ukažte, že problémem bývají rozdílné verze knihoven a nastavení. Docker prostředí sjednotí.

**Docker v jedné větě:** Zdůrazněte, že kontejner cestuje spolu s aplikací. Hostitelský počítač nemusí mít všechny závislosti nainstalované ručně.

## Základní představa

**Co to je Docker:** Vysvětlete izolaci bez tvrzení, že jde o celý nový operační systém. Kontejner sdílí jádro hostitele.

**Analogie krabičky:** Nechte účastníky pojmenovat, co by do krabičky zabalili u webové aplikace: kód, knihovny a konfiguraci.

**Co je kontejner:** Kontejner je běžící proces v odděleném prostředí. Po jeho ukončení proces přestane běžet.

**Co Docker není:** Porovnejte ho s virtuálním strojem. VM obsahuje celý guest OS, kontejner je lehčí obal kolem procesu.

**Architektura Dockeru:** CLI pošle požadavek Docker Engine. Engine image stáhne z registru a vytvoří kontejner.

**Výhody:** Uveďte izolaci, opakovatelnost a rychlý start. Vyhněte se slibu, že Docker vyřeší každý problém s kompatibilitou.

**VM vs. kontejner:** Projděte tabulku zleva doprava. Hlavní rozdíl je celý OS versus sdílené jádro hostitele.

## Image, data a síť

**Image vs. kontejner:** Image je neměnná šablona, kontejner její spuštěná instance. Jeden image může mít více kontejnerů.

**Image jako recept:** Přirovnejte `nginx` nebo `ubuntu` k hotovým receptům z registru.

**Kontejner jako výsledek:** Po `docker run` Docker image použije a spustí proces. Teprve pak máme běžící službu.

**Více kontejnerů:** Stejný image lze spustit vícekrát s různými jmény, porty nebo nastavením.

**Persistence dat:** Vysvětlete, že smazáním kontejneru můžeme přijít o data uložená jen uvnitř jeho vrstvy.

**Volume:** Volume použijeme pro databázi, nahrané soubory a další data, která mají přežít restart nebo výměnu kontejneru.

**Bind mount:** Levá cesta patří hostiteli, pravá cesta kontejneru. Ukažte, že změna v jedné složce je vidět i v druhé.

**Port:** Port popište jako dveře. Aplikace může uvnitř poslouchat na 80, ale z hostitele ji bez mapování neuvidíme.

**Mapování portu:** Čtěte `-p 8080:80` zleva doprava: hostitelský port 8080 vede na port 80 uvnitř kontejneru.

## Dockerfile a příkazy

**Dockerfile:** Je to recept zapsaný v textovém souboru. Každá instrukce přidává jeden krok do image.

**FROM:** Určuje základ. Začátečníkům stačí vysvětlit, že `nginx:alpine` je hotový malý základ pro webserver.

**WORKDIR a COPY:** První nastaví pracovní složku, druhý do ní vloží soubory z projektu.

**RUN vs. CMD:** `RUN` se provede při buildu, `CMD` až po spuštění kontejneru. Nezaměňujte jejich časování.

**Ukázka Dockerfile:** Projděte soubor po řádcích a ukažte, že výsledkem je image, ne ještě běžící kontejner.

## CLI praxe

**Instalace:** Příkazy spouštějte pomalu a vysvětlete, že členství ve skupině `docker` dává uživateli významná oprávnění.

**`docker --version`:** Ověřte, že CLI existuje. Pokud příkaz selže, nejdřív opravte instalaci.

**Image v CLI:** `pull` stáhne image, `images` ho zobrazí a `build` vytvoří vlastní image z Dockerfile.

**První kontejner:** `--rm` po skončení uklidí testovací kontejner. Je vhodný pro krátký pokus.

**Spouštění:** Vysvětlete rozdíl mezi interaktivním režimem `-it` a během na pozadí `-d`.

**Správa:** `docker ps` ukáže běžící kontejnery, `stop` je zastaví a `rm` odstraní.

**Logy:** Při problému vždy nejdřív ukažte `docker logs`. Je to bezpečnější než okamžitě kontejner mazat.

## Compose a cvičení

**Compose:** Jeden YAML soubor popíše více služeb. Tím nahradí dlouhé série ručně psaných `docker run` příkazů.

**Ukázka YAML:** Vysvětlete pouze `services`, `image` a `ports`; další klíče přidejte až později.

**Příkazy Compose:** `up -d` spustí projekt, `ps` ukáže stav, `logs` výpis a `down` projekt zastaví.

**Mini-cvičení:** Nechte účastníky spustit Nginx, otevřít `localhost:8080`, najít kontejner, zobrazit logy a uklidit ho.

**Závěr:** Nechte každého vlastními slovy vysvětlit rozdíl mezi image a kontejnerem. Potom zopakujte, že volume chrání data a port zpřístupňuje službu.
