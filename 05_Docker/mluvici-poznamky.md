# Mluvené poznámky - Letní škola sítí: 5. Docker

Každá sekce níže odpovídá jednomu zobrazovanému slajdu v `reveal.js/index.html`. Text **Řekni** je návrh výkladu; **Ukaž / zeptej se** je krátká aktivita pro účastníky.

## 1. Titulní slajd - Docker

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

## 5. Oddělovací slajd - Co je Docker a proč ho používat

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

## 10. Architektura Dockeru: Client

**Řekni:** „Docker Client je program v terminálu. Když napíšeme například `docker run`, klient náš požadavek předá Docker Enginu.“

**Ukaž / zeptej se:** Ukažte, že příkaz zadáváme my v terminálu, ale samotné vytvoření kontejneru provede služba na pozadí.

## 11. Architektura Dockeru: Host

**Řekni:** „Docker Host je počítač, na kterém běží Docker Engine. Tento engine vytváří kontejnery, spravuje sítě a stahuje obrazy.“

## 12. Architektura Dockeru: Registry

**Řekni:** „Docker Registry je úložiště hotových obrazů. Když spustíme příkaz a obraz nemáme na disku, Docker ho automaticky stáhne z Docker Hubu.“

**Přechod:** „Víme, jak Docker funguje. Teď si řekneme, proč se používá v praxi.“

## 13. Jaká jsou využití a výhody? Izolace

**Řekni:** „První velká výhoda je izolace. Dvě aplikace mohou mít různé verze stejné knihovny a nebudou si navzájem překážet.“

**Ukaž / zeptej se:** Uveďte příklad: jedna aplikace potřebuje Python 3.10, druhá Python 3.12. V Dockeru poběží obě vedle sebe.

## 14. Jaká jsou využití a výhody? Vývoj a testování

**Řekni:** „Druhá výhoda je přenositelnost. Vývojář připraví kontejner a stejný kontejner pak běží na serveru bez ručního doinstalovávání.“

## 15. Jaká jsou využití a výhody? Mikroslužby

**Řekni:** „Místo jedné velké aplikace můžeme systém rozdělit na menší části, například web, API a databázi. Každá část běží ve vlastním kontejneru a snadněji se spravuje.“

## 16. Virtuální stroj vs Kontejner

**Řekni:** „Virtuální stroj obsahuje vlastní plnohodnotný operační systém a startuje minuty. Kontejner sdílí jádro počítače a startuje během vteřin.“

**Ukaž / zeptej se:** Ukažte na schématu vrstvu Hypervisor vs Docker Engine.

**Přechod:** „V druhé části se podíváme na základní stavební kameny: image, volume, síť a Dockerfile.“

## 17. Oddělovací slajd - Koncepty, sítě a Dockerfile

**Řekni:** „Teď si vysvětlíme čtyři důležité věci: rozdíl mezi imagí a kontejnerem, jak ukládat data, jak propojit síť a jak napsat vlastní Dockerfile.“

## 18. Image vs Kontejner

**Řekni:** „Image je neměnná šablona nebo recept. Kontejner je běžící instance vytvořená podle této šablony. Z jedné image můžeme spustit libovolný počet kontejnerů.“

**Ukaž / zeptej se:** Použijte přirovnání: Image je stavební plán domu, kontejner je skutečně postavený dům.

## 19. Životní cyklus kontejneru

**Řekni:** „Kontejner můžeme vytvořit, spustit, pozastavit, zastavit a smazat. Smazáním kontejneru se nepoškodí původní image.“

**Přechod:** „Co se stane se soubory uvnitř, když kontejner smažeme?“

## 20. Persistence dat: Problém

**Řekni:** „Kontejnery jsou dočasné. Když do běžícího kontejneru zapíšeme soubor a kontejner smažeme, zapsaná data zmizí s ním.“

**Ukaž / zeptej se:** „Proč je to u databáze problém?“

## 21. Persistence dat: Řešení

**Řekni:** „Aby data přežila smazání kontejneru, připojíme k němu prostor z hostitelského počítače. Tomu říkáme Volume nebo Bind mount.“

## 22. Persistence dat: Volumes

**Řekni:** „Volume spravuje sám Docker. Hodí se pro databáze, protože data zůstávají uložena i po odstranění kontejneru.“

## 23. Persistence dat: Bind Mounts

**Řekni:** „Bind mount propojí konkrétní složku z vašeho počítače přímo do kontejneru. Když upravíte soubor na počítači, změna se hned projeví i uvnitř.“

**Ukaž / zeptej se:** Vysvětlete, že je to ideální při vývoji webu pro živou úpravu kódu.

## 24. Síťování v Dockeru

**Řekni:** „Kontejnery mají vlastní virtuální síť. Ve výchozím nastavení nejsou jejich porty zvenčí vidět, dokud je explicitně nezpřístupníme.“

## 25. Typy sítí: Bridge

**Řekni:** „Bridge je výchozí izolovaná síť pro kontejnery na jednom počítači. Kontejnery v téže bridge síti mohou komunikovat navzájem podle jména.“

## 26. Typy sítí: Host

**Řekni:** „Při nastavení sítě na Host kontejner nepoužívá virtuální síť, ale přímo síťová rozhraní počítače. Odpadá přesměrování portů, ale snižuje se izolace.“

## 27. Typy sítí: None

**Řekni:** „Typ None kontejneru úplně vypne síť. Používá se pro úlohy, které ze zásady nesmí komunikovat se sítí.“

## 28. Publikování portů: `-p 8080:80`

**Řekni:** „Když chceme službu z kontejneru otevřít pro prohlížeč, použijeme parametr `-p`. Číslo vlevo je port na našem počítači, číslo vpravo je port uvnitř kontejneru.“

**Ukaž / zeptej se:** Ukažte schéma: návštěvník jde na `http://localhost:8080` a Docker požadavek přepošle na port `80` uvnitř kontejneru.

## 29. Dockerfile - Základní instrukce

**Řekni:** „Dockerfile je textový návod na sestavení vlastní image. Instrukce `FROM` určuje základ, `WORKDIR` nastaví pracovní složku a `COPY` do ní nakopíruje naše soubory.“

## 30. Dockerfile - Běh a příkazy

**Řekni:** „Instrukce `RUN` provádí příkazy při sestavování image, například instalaci balíčků. `USER` nastavuje bezpečnějšího neprivilegovaného uživatele a `CMD` říká, jaký příkaz se má spustit při startu kontejneru.“

## 31. Ukázka Dockerfile

**Řekni:** „Tady vidíme kompletní příklad: vezmeme Debian, doinstalujeme Nginx, nakopírujeme webovou stránku, otevřeme port 80 a spustíme webový server.“

## 32. Best practices pro Dockerfile

**Řekni:** „Pro menší a bezpečnější obrazy spojujte související příkazy `apt update && apt install`, uklízejte dočasnou mezipaměť a používejte soubor `.dockerignore`, aby se do image nekopírovaly zbytečné soubory.“

## 33. Shrnutí pojmů: Kvíz

**Řekni:** „Pojďme si rychle ověřit základní pojmy: 1. Co je šablona a co běžící instance? 2. Kam ukládáme data, aby nepřežila smazání kontejneru? 3. Co znamená `-p 8080:80`?“

**Ukaž / zeptej se:** Nechte studenty krátce odpovědět.

## 34. Přestávka (10 min)

**Řekni:** „Dáme si 10 minut pauzu na vydechnutí a po přestávce se posuneme k praktické práci v terminálu a skládání více služeb v Docker Compose.“

## 35. Oddělovací slajd - Práce s CLI a Docker Compose

**Řekni:** „V této části se naučíme ovládat Docker z příkazového řádku a skládat více kontejnerů do jednoho celku pomocí souboru `compose.yaml`.“

## 36. Instalace na Kali Linux

**Řekni:** „Na Kali nainstalujeme Docker z repozitářů, zapneme službu a případně přidáme uživatele do skupiny `docker`. Po změně skupiny může být potřeba nové přihlášení nebo `newgrp docker`.“

**Ukaž / zeptej se:** Příkazy spouštějte po jednom. Upozorněte, že členství ve skupině `docker` dává uživateli rozsáhlá oprávnění.

## 37. Nejdřív ověříme instalaci

**Řekni:** „`docker --version` je rychlý test, zda máme Docker CLI dostupné. Pokud příkaz neexistuje nebo Engine nereaguje, nejdřív opravíme instalaci, než budeme pokračovat.“

## 38. Práce s imagi v CLI - stažení

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

## 48. Ukázka compose.yaml

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
