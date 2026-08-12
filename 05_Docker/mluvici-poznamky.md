# Mluvené poznámky — Letní škola sítí: 5. Docker

Každá sekce níže odpovídá jednomu zobrazovanému slajdu v `reveal.js/index.html`. Text **Řekni** je návrh výkladu; **Ukaž / zeptej se** je krátká aktivita pro účastníky.

## 1. Titulní slajd — Docker

**Řekni:** „Dnes si vysvětlíme Docker úplně od začátku. Nejdřív si řekneme, proč kontejnery používáme, potom spustíme hotový kontejner a nakonec si postavíme vlastní image.“

**Ukaž / zeptej se:** „Kdo už slyšel větu *u mě to funguje* nebo už někdy Docker zkoušel?“

## 2. Co si dnes odneseme?

**Řekni:** „Na konci budeme rozumět čtyřem věcem: co je image, co je kontejner, jak se chrání data a jak se zpřístupní služba přes port. Také si ukážeme Dockerfile a Compose.“

**Přechod:** „Začneme problémem, který Docker řeší.“

## 3. Proč Docker vznikl?

**Řekni:** „Aplikace často funguje na počítači autora, ale na jiném počítači ne. Může chybět knihovna, může být jiná verze Pythonu nebo jiné nastavení systému.“

**Ukaž / zeptej se:** Nechte účastníky uvést příklad programu, který se jim někdy nepodařilo spustit kvůli chybějící závislosti.

## 4. Docker v jedné větě

**Řekni:** „Docker zabalí aplikaci a její potřebné prostředí do přenositelné krabičky. Té krabičce říkáme kontejner, takže ji můžeme spustit na jiném počítači stejným způsobem.“

**Přechod:** „Teď si tu krabičku rozebereme po částech.“

## 5. Oddělovací slajd — Co je Docker a proč ho používat

**Řekni:** „V této části si vytvoříme základní představu. Nejdřív vysvětlíme, co Docker dělá, potom jeho části a rozdíl oproti virtuálnímu stroji.“

## 6. Co to je Docker?

**Řekni:** „Docker vytváří izolovaná prostředí pro běh aplikací. Každé prostředí má vlastní soubory a nastavení, ale používá jádro hostitelského systému. Běžící instanci vytvořenou z image nazýváme kontejner.“

**Ukaž / zeptej se:** Zeptejte se: „Které věci by podle vás měly být uvnitř krabičky s aplikací?“

## 7. Analogie: krabička

**Řekni:** „Představte si stěhovací krabici. Do ní dáme aplikaci, knihovny a nastavení. Když krabici přeneseme jinam, nemusíme znovu ručně shánět každou součást.“

**Ukaž / zeptej se:** Postupně odhalte tři boxy a nechte účastníky říct, co by do nich patřilo u jednoduchého webu.

## 8. Co je kontejner?

**Řekni:** „Kontejner je izolované prostředí pro jeden proces nebo službu. Má vlastní soubory a síťové nastavení, ale není to celý nový počítač. Díky sdílenému jádru startuje rychle.“

## 9. Co Docker není

**Řekni:** „Kontejner není virtuální počítač s kompletním operačním systémem. Je to lehký obal kolem procesu. Když hlavní proces skončí, kontejner se také zastaví.“

**Přechod:** „Abychom věděli, co se při příkazu děje, podíváme se na části Dockeru.“

## 10. Architektura Dockeru — Client

**Řekni:** „Docker Client je program v terminálu. Když napíšeme například `docker run`, klient náš požadavek předá Docker Enginu.“

**Ukaž / zeptej se:** Ukažte, že příkaz zadáváme my v terminálu, ale samotné vytvoření kontejneru provede služba na pozadí.

## 11. Docker Engine

**Řekni:** „Docker Engine je služba běžící na pozadí. Stará se o stahování imagů, vytváření kontejnerů, jejich spouštění i zastavování. Bez běžícího Enginu příkazy nebudou fungovat.“

## 12. Docker Registry

**Řekni:** „Registry je katalog Docker imagů. Nejznámější veřejný katalog je Docker Hub. Když použijeme image, který zatím nemáme lokálně, Docker ho odtud stáhne.“

## 13. Jaká jsou využití a výhody? — Izolace

**Řekni:** „První výhoda je izolace. Aplikace může mít vlastní verzi knihoven, aniž by rozbila programy nainstalované přímo na hostiteli.“

## 14. Výhoda: stejné prostředí

**Řekni:** „Image můžeme použít u vývojáře, při testování i v produkci. Každé prostředí tak dostane stejný základ a ubývá překvapení typu *u mě to funguje*.“

## 15. Výhoda: rychlý start

**Řekni:** „Připravený kontejner spustíme jedním příkazem. Nemusíme pokaždé instalovat celý operační systém ani ručně nastavovat všechny závislosti.“

## 16. VM vs. kontejner

**Řekni:** „Virtuální stroj obsahuje celý guest operační systém, proto je větší a startuje pomaleji. Kontejner sdílí jádro hostitele a obsahuje hlavně aplikaci s knihovnami, takže je lehčí.“

**Ukaž / zeptej se:** Projděte tabulku po řádcích. Zdůrazněte, že uvedené hodnoty jsou orientační, ne slib pro každý počítač.

## 17. Oddělovací slajd — Koncepty, sítě a Dockerfile

**Řekni:** „Teď přejdeme od obecné představy k věcem, se kterými budeme pracovat v příkazové řádce: image, kontejner, data, porty a Dockerfile.“

## 18. Docker Image vs. kontejner

**Řekni:** „Image je neměnná šablona. Kontejner je konkrétní spuštěná instance této šablony. Image si můžeme představit jako recept a kontejner jako jídlo podle receptu, které právě vaříme.“

## 19. Image = recept

**Řekni:** „Image obsahuje základní soubory a instrukce potřebné pro aplikaci. Hotové image můžeme stáhnout, například `nginx`, `ubuntu` nebo `python`.“

## 20. Kontejner = uvařený recept

**Řekni:** „Příkazem `docker run` vezmeme image a spustíme z něj kontejner. Image samo o sobě neběží; běžící služba je až kontejner.“

**Ukaž / zeptej se:** Nechte účastníky zopakovat větu: „Image je šablona, kontejner je běžící instance.“

## 21. Jeden image, více kontejnerů

**Řekni:** „Stejnou šablonu můžeme spustit vícekrát. Tady z jednoho image vzniknou `web-1` a `web-2`; každý kontejner může mít jiné jméno nebo port.“

## 22. Persistence dat — Volumes

**Řekni:** „Kontejner má vlastní zapisovatelnou vrstvu, ale ta je dočasná. Když kontejner smažeme, změny uvnitř mohou zmizet. Pro důležitá data používáme volume nebo bind mount.“

## 23. Proč data mizí?

**Řekni:** „Kontejner je dočasný pracovní prostor. Pokud do něj uložíme soubor a potom ho odstraníme, soubor s ním může zmizet. Proto databázi nenecháváme pouze uvnitř kontejneru.“

## 24. Volume = bezpečné místo pro data

**Řekni:** „Volume je úložiště spravované Dockerem, které žije odděleně od kontejneru. Použijeme ho například pro databáze, nahrané soubory nebo logy, které mají přežít výměnu kontejneru.“

## 25. Bind mount = sdílená složka

**Řekni:** „Bind mount propojí konkrétní složku hostitele se složkou v kontejneru. V příkazu je vlevo cesta na počítači a vpravo cesta uvnitř kontejneru.“

**Ukaž / zeptej se:** Vysvětlete `-v ./data:/app/data` slovně: „Tuto místní složku připoj do této složky v kontejneru.“

## 26. Mapování síťových portů

**Řekni:** „Kontejner má izolovanou síť. Parametr `-p` vytvoří průchod z portu hostitele na port uvnitř kontejneru. Bez něj se k webu z běžného prohlížeče nemusíme dostat.“

## 27. Port = dveře do služby

**Řekni:** „Port si představme jako dveře. Nginx uvnitř poslouchá na portu 80, ale dveře nejsou automaticky otevřené ven. Mapování portu řekne Dockeru, které dveře má zpřístupnit.“

## 28. Jak číst `-p 8080:80`?

**Řekni:** „Čteme zleva doprava: port 8080 na našem počítači pošli na port 80 uvnitř kontejneru. Proto pak otevřeme `localhost:8080`, i když Nginx uvnitř používá port 80.“

**Ukaž / zeptej se:** Zeptejte se: „Kde bychom otevřeli službu při mapování `9000:80`?“ Správně: na `localhost:9000`.

## 29. Dockerfile — základní instrukce

**Řekni:** „Dockerfile je textový recept pro sestavení image. `FROM` vybere základ, `WORKDIR` nastaví pracovní složku a `COPY` vloží soubory z projektu do image.“

## 30. Dockerfile — běh a příkazy

**Řekni:** „`RUN` provádí příkazy při sestavování image, například instalaci balíčku. `USER` může přepnout na méně privilegovaného uživatele a `CMD` určuje výchozí příkaz při startu kontejneru.“

## 31. Ukázka Dockerfile

**Řekni:** „Tento recept začne Debianem, nainstaluje curl, vytvoří složku, zkopíruje skript, nastaví uživatele a nakonec skript spustí. Důležité je rozlišit, co se děje při buildu a co až při startu.“

**Ukaž / zeptej se:** Čtěte řádky postupně. U `RUN` se zeptejte, zda se provede při buildu, nebo při každém startu. Správně: při buildu.

## 32. Dockerfile: jedna instrukce

**Řekni:** „Začínáme řádkem `FROM nginx:alpine`. Říkáme tím, že chceme vyjít z malého image s Nginxem.“

## 33. Dockerfile: soubory

**Řekni:** „`WORKDIR /app` nastaví pracovní složku uvnitř image. `COPY . .` do ní zkopíruje obsah aktuální složky projektu.“

## 34. RUN vs. CMD

**Řekni:** „`RUN` se provádí během buildu a výsledek se uloží do image. `CMD` se provede až po spuštění kontejneru a typicky nastartuje hlavní proces, třeba webserver.“

**Ukaž / zeptej se:** Nechte účastníky doplnit: „Instalace curlu patří do RUN, spuštění serveru patří do CMD.“

## 35. Oddělovací slajd — Práce s CLI a Docker Compose

**Řekni:** „Teorii máme za sebou. Teď projdeme terminálové příkazy a nakonec způsob, jak více kontejnerů popsat jedním souborem.“

## 36. Instalace na Kali Linux

**Řekni:** „Na Kali nainstalujeme Docker z repozitářů, zapneme službu a případně přidáme uživatele do skupiny `docker`. Po změně skupiny může být potřeba nové přihlášení nebo `newgrp docker`.“

**Ukaž / zeptej se:** Příkazy spouštějte po jednom. Upozorněte, že členství ve skupině `docker` dává uživateli rozsáhlá oprávnění.

## 37. Nejdřív ověříme instalaci

**Řekni:** „`docker --version` je rychlý test, zda máme Docker CLI dostupné. Pokud příkaz neexistuje nebo Engine nereaguje, nejdřív opravíme instalaci, než budeme pokračovat.“

## 38. Práce s imagi v CLI — stažení

**Řekni:** „`docker pull ubuntu` stáhne image Ubuntu z registru do našeho počítače. Stažení děláme typicky jednou; při dalším spuštění se použije místní kopie, pokud není potřeba novější verze.“

## 39. Kolik imagů máme?

**Řekni:** „`docker images` vypíše image uložené lokálně. Uvidíme jméno, tag, identifikátor a velikost.“

**Ukaž / zeptej se:** Nechte účastníky najít v seznamu image, které právě stáhli.

## 40. Vlastní image

**Řekni:** „`docker build -t moje-aplikace .` sestaví image podle Dockerfile. Parametr `-t` mu dá jméno a tečka znamená, že build context je aktuální složka.“

## 41. První kontejner

**Řekni:** „`docker run --rm hello-world` vytvoří a spustí krátký testovací kontejner. `--rm` zajistí, že se po skončení automaticky odstraní.“

**Ukaž / zeptej se:** Nechte účastníky najít v textu, která část spouští image a která část uklízí kontejner.

## 42. Spouštění kontejnerů

**Řekni:** „První příkaz spustí Ubuntu interaktivně s terminálem. Druhý spustí Nginx na pozadí, pojmenuje ho `muj-web` a zpřístupní ho na portu 8080.“

**Ukaž / zeptej se:** Spusťte Nginx a otevřete `http://localhost:8080`. Potom vysvětlete, že `-d` uvolní terminál.

## 43. Správa a kontrola kontejnerů

**Řekni:** „`docker ps` ukáže právě běžící kontejnery. Pro zastavené kontejnery přidáme `-a`, tedy `docker ps -a`.“

## 44. Zastavení a smazání

**Řekni:** „`docker stop` slušně požádá kontejner, aby skončil. `docker rm` potom odstraní jeho objekt. Image tím nemažeme, takže ho můžeme použít znovu.“

## 45. Co se pokazilo?

**Řekni:** „Při chybě se nejdřív podíváme na `docker logs`. Logy nám často řeknou, proč se služba nespustila nebo proč spadla.“

**Ukaž / zeptej se:** Zastavte nebo spusťte jednoduchý kontejner a ukažte, jak se jeho jméno použije místo `<id>`.

## 46. Docker Compose

**Řekni:** „Compose je nástroj pro více služeb. Místo několika dlouhých `docker run` příkazů zapíšeme web, databázi, porty a nastavení do jednoho YAML souboru.“

## 47. Compose = seznam služeb

**Řekni:** „Compose soubor je seznam požadovaného stavu. Řekneme, že chceme službu `web`, z jakého image má být a na jakém portu ji zpřístupnit.“

## 48. Ukázka `docker-compose.yml`

**Řekni:** „V ukázce jsou dvě služby: `web` s Nginxem a `db` s MySQL. `ports` zpřístupňuje web a `environment` předává databázi nastavení.“

**Bezpečnost:** Upozorněte, že heslo v ukázce je pouze demonstrační a skutečné tajné údaje nepatří do verzovaného souboru.

## 49. Příkazy Docker Compose

**Řekni:** „`up -d` spustí všechny služby na pozadí. `ps` ukáže jejich stav, `logs` jejich výpis a `down` celý Compose projekt zastaví a uklidí.“

## 50. Nejdůležitější trojice

**Řekni:** „Tři příkazy si můžeme zapamatovat jako jednoduchý cyklus: `up` spustit, `ps` zkontrolovat a `down` zastavit. To je základní každodenní práce s Compose.“

## 51. Mini-cvičení

**Řekni:** „Teď si to vyzkoušíme bez další teorie. Spusťte Nginx na portu 8080, otevřete stránku, najděte kontejner přes `docker ps`, zobrazte logy a nakonec ho zastavte.“

**Ukaž / zeptej se:** Procházejte kroky společně. Kdo skončí dřív, může vyzkoušet `docker ps -a` a vysvětlit rozdíl oproti `docker ps`.

## 52. Co si zapamatovat

**Řekni:** „Image je šablona, kontejner její běžící instance, volume chrání data, port zpřístupňuje službu ven a Compose řídí více služeb. Pokud těmto pěti větám rozumíte, máte dobrý základ pro další Docker.“

**Závěrečná otázka:** „Jaký je rozdíl mezi image a kontejnerem?“ Nechte odpovědět účastníka vlastními slovy.
