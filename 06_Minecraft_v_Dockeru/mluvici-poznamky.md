# Mluvené poznámky ke každému slajdu — Letní škola sítí: 6. Minecraft v Dockeru

Scénář je psaný pro lektory i účastníky. Text po značce **Řekni** představuje hotovou formulaci výkladu, **Zapojení / ukázka** uvádí praktické akce v učebně a **Přechod** pomáhá plynule navázat na další téma.

---

## 1. Titulní slajd — Minecraft v Dockeru

**Řekni:** „Vítám vás u modulu 6. Minecraft v Dockeru. Dnes si ukážeme velmi jednoduchý a spolehlivý způsob, jak spustit herní Minecraft server v kontejneru.“

**Zapojení / ukázka:** Zeptejte se účastníků: „Kdo z vás už někdy hrál Minecraft a chtěl mít vlastní server pro sebe a kamarády?“

**Přechod:** „Podívejme se na přehled témat, která si dnes postupně projdeme.“

---

## 2. Co dnes probereme

**Řekni:** „Projdeme si vše od úplných základů: stáhneme oficiální `server.jar`, napíšeme vlastní Dockerfile a startovací skript, vytvoříme Compose soubor, vysvětlíme porty a data, spustíme server, připojíme se ze hry a ukážeme si admin práva.“

**Zapojení / ukázka:** Projděte seznam na slajdu.

**Přechod:** „Začněme první kategorií: Úvod a základní pojmy.“

---

## 3. Kategorie 1: Úvod a základní pojmy

**Řekni:** „V první části si ujasníme základní pojmy, abychom přesně věděli, co a proč děláme.“

**Zapojení / ukázka:** Zobrazte dělící slajd kategorie 1.

**Přechod:** „Nejprve si vysvětleme, co je to herní server.“

---

## 4. Co je to herní server?

**Řekni:** „Herní server je program, který běží neustále na počítači. Počítá svět, pozice hráčů, monstra a udržuje všechny ve stejné hře.“

**Zapojení / ukázka:** Přirovnejte herní server k hlavnímu mozku multiplayerové hry.

**Přechod:** „Proč k jeho spuštění použijeme právě Docker?“

---

## 5. Proč použít Docker?

**Řekni:** „Díky Dockeru nemusíme na náš počítač instalovat Javu ani složitě nastavovat systémové služby. Javu použijeme uvnitř našeho vlastního image; vše ostatní běží izolovaně.“

**Zapojení / ukázka:** Zdůrazněte, že tentokrát si image sestavíme sami pomocí Dockerfile.

**Přechod:** „Jaký balíček k tomu použijeme?“

---

## 6. Náš vlastní Minecraft image

**Řekni:** „Tentokrát nepoužijeme hotový image s Minecraftem. Napíšeme vlastní `Dockerfile`, použijeme čistý Java runtime jako základ a do něj vložíme oficiální `server.jar`.“

**Zapojení / ukázka:** Ukažte rozdíl mezi hotovým image a naším buildem: hotový image stáhneme, náš image sestavíme příkazem `docker compose build`.

**Přechod:** „Přejděme do druhé kategorie: Příprava konfigurace.“

---

## 7. Kategorie 2: Konfigurace docker-compose.yml

**Řekni:** „Ve druhé části si napíšeme jednoduchý konfigurační soubor.“

**Zapojení / ukázka:** Zobrazte dělící slajd kategorie 2.

**Přechod:** „Vysvětleme si, co je soubor `docker-compose.yml`.“

---

## 8. Co je `docker-compose.yml`?

**Řekni:** „Soubor `docker-compose.yml` je obyčejný textový dokument. Funguje jako recept, ve kterém napíšeme Dockeru, jaký server chceme vytvořit.“

**Zapojení / ukázka:** Ukažte, že soubor budeme upravovat v terminálovém editoru nano.

**Přechod:** „Prvním krokem je vytvoření složky.“

---

## 9. Krok 1: Vytvoření složky

**Řekni:** „Otevřete terminál a vytvořte novou složku příkazem `mkdir mc-server`. Poté se do ní přepněte příkazem `cd mc-server`.“

**Zapojení / ukázka:** Názorně předveďte oba příkazy na projektoru.

**Přechod:** „Nejdřív připravíme oficiální serverový soubor, který vložíme do našeho image.“

---

## 10. Krok 2: Připravíme `server.jar`

**Řekni:** „Z oficiální stránky Minecraftu stáhněte Java server pro verzi, kterou chcete hrát. Soubor přejmenujte na `server.jar` a uložte ho do složky `mc-server`. Do repozitáře ho nedáváme.“

**Zapojení / ukázka:** Nechte účastníky ověřit příkazem `ls -lh server.jar`, že soubor leží vedle budoucího Dockerfile.

**Přechod:** „Teď vytvoříme Compose soubor, který náš image sestaví.“

---

## 11. Krok 3: Vytvoření souboru

**Řekni:** „V terminálu zadejte příkaz `nano docker-compose.yml`. Otevře se prázdný textový editor.“

**Zapojení / ukázka:** Zkontrolujte, že mají všichni v učebně otevřený editor nano.

**Přechod:** „Podívejme se na kompletní obsah souboru.“

---

## 12. Ukázka `docker-compose.yml`

**Řekni:** „Compose už nestahuje hotový Minecraft image. Klíč `build` říká, že se má použít náš `Dockerfile`. Vlastní image pojmenujeme `muj-minecraft:1.20.4`, otevřeme port 25565, potvrdíme EULA, nastavíme paměť a připojíme složku `data`.“

**Zapojení / ukázka:** Projděte jednotlivé řádky kódu na slajdu.

**Přechod:** „Vysvětleme si důležitost řádku s EULA.“

---

## 13. Vysvětlení: Souhlas s EULA

**Řekni:** „Řádek `EULA: "TRUE"` vyjadřuje souhlas s licenčními podmínkami hry Minecraft. Bez tohoto řádku by se server z bezpečnostních důvodů odmítl spustit.“

**Zapojení / ukázka:** Zdůrazněte uvozovky a velké písmena u hodnoty TRUE.

**Přechod:** „Co přesně obsahuje náš Dockerfile?“

---

## 14. Vysvětlení: Náš Dockerfile

**Řekni:** „`FROM` vezme pouze Java runtime, ne hotový Minecraft image. `COPY` vloží náš `server.jar` a náš startovací skript. `ENTRYPOINT` tento skript spustí při startu kontejneru.“

**Zapojení / ukázka:** Otevřete účastníkům soubor `Dockerfile` a nechte je najít všechny tři instrukce.

**Přechod:** „Jak náš startovací skript nastaví paměť?“

---

## 15. Vysvětlení: Paměť RAM

**Řekni:** „Řádek `MEMORY: "2G"` předá hodnotu našemu `start.sh`, který ji použije jako `-Xmx2G`. Tím nastavíme maximální paměť Java procesu. Pro učebnu je 2G rozumný začátek.“

**Zapojení / ukázka:** Ukažte uložení souboru v editoru nano přes zkratky Ctrl+O a Ctrl+X.

**Přechod:** „Přejděme do třetí kategorie: Síť a Úložiště.“

---

## 16. Kategorie 3: Síťové porty a Úložiště

**Řekni:** „Ve třetí části si vysvětlíme, jak se k serveru připojujeme a jak ukládáme postavený svět.“

**Zapojení / ukázka:** Zobrazte dělící slajd kategorie 3.

**Přechod:** „Vysvětleme si pojem síťový port.“

---

## 17. Co je to síťový port?

**Řekni:** „Síťový port si můžete představit jako číslo dveří v budově. Minecraft hry používají pro komunikaci po síti standardní port číslo 25565.“

**Zapojení / ukázka:** Přirovnejte IP adresu k ulici a port k číslu dveří.

**Přechod:** „Jak nastavíme port v souboru Compose?“

---

## 18. Mapování portu v Compose

**Řekni:** „Zápis `25565:25565` v sekci `ports` propojí port vášho počítače s portem uvnitř kontejneru. Díky tomu bude hra schopna server najít.“

**Zapojení / ukázka:** Vysvětlete rozdíl mezi vnějším a vnitřním portem.

**Přechod:** „Proč potřebujeme úložiště dat?“

---

## 19. Proč potřebujeme Úložiště (Volume)?

**Řekni:** „Docker kontejnery standardně po zastavení neukládají své změny. Bez trvalého úložiště by se po každém vypnutí smazal celý váš postavený svět.“

**Zapojení / ukázka:** Zdůrazněte důležitost zachování dat na disku.

**Přechod:** „Jak úložiště nastavíme v souboru?“

---

## 20. Nastavení Volume v Compose

**Řekni:** „Řádek `- ./data:/data` v sekci `volumes` vytvoří na vašem počítači složku `data` a propojí ji s kontejnerem. Veškeré změny a mapa se budou ukládat na váš disk.“

**Zapojení / ukázka:** Ukažte tečku a lomítko v zápisu `./data`.

**Přechod:** „Co přesně složka `data` obsahuje?“

---

## 21. Co se uloží do složky `./data`?

**Řekni:** „Ve složce `data` najdete podadresář `world` s mapou světa, konfigurační soubor `server.properties` a seznam administrátorů `ops.json`.“

**Zapojení / ukázka:** Vysvětlete, že díky této složce je zálohování velmi snadné.

**Přechod:** „Přejděme do čtvrté kategorie: Spuštění a připojení.“

---

## 22. Kategorie 4: Spuštění serveru a připojení

**Řekni:** „Ve čtvrté části server poprvé spustíme a připojíme se do hry.“

**Zapojení / ukázka:** Zobrazte dělící slajd kategorie 4.

**Přechod:** „Jaký příkaz použijeme ke spuštění?“

---

## 23. Spuštění příkazem `up`

**Řekni:** „Nejdřív zadejte `docker compose build`, aby Docker z našeho Dockerfile sestavil image. Potom spusťte `docker compose up -d`; Docker vytvoří kontejner z image a nastartuje server.“

**Zapojení / ukázka:** Předveďte zadání příkazu na projektoru.

**Přechod:** „Vysvětleme si význam parametru `-d`.“

---

## 24. Co znamená parametr `-d`?

**Řekni:** „Parametr `-d` znamená 'detached'. Spustí server na pozadí, takže vám terminál zůstane volný pro zadávání dalších příkazů.“

**Zapojení / ukázka:** Ukažte, že se po spuštění vrátila příkazová řádka.

**Přechod:** „Jak sledujeme průběh startu?“

---

## 25. Sledování startu v logu

**Řekni:** „První start zabere asi půl minuty, protože se stahuje server a generuje mapa. Průběh sledujeme příkazem `docker-compose logs -f`.“

**Zapojení / ukázka:** Ukažte ukončení sledování logů pomocí zkratky Ctrl+C.

**Přechod:** „Jak poznáme, že je server připraven?“

---

## 26. Jak poznám, že server běží?

**Řekni:** „Jakmile se v logu objeví hláška `Done (...)! For help, type "help"`, znamená to, že je server plně načten a připraven pro hráče.“

**Zapojení / ukázka:** Ukažte tento řádek na projektoru.

**Přechod:** „Pojďme se připojit z hry Minecraft.“

---

## 27. Připojení ze hry Minecraft

**Řekni:** „Spusťte Minecraft klient verze 1.20.4, zvolte Hra pro více hráčů, klikněte na Přímé připojení a do adresy napište `localhost`. Klikněte na Připojit se ke serveru.“

**Zapojení / ukázka:** Předveďte přihlášení postavy do hry na projektoru.

**Přechod:** „Přejděme do páté kategorie: Admin práva a správa příkazů.“

---

## 28. Kategorie 5: Admin práva a správa

**Řekni:** „V páté části si ukážeme, jak dávat příkazy v konzoli a spravovat admin práva.“

**Zapojení / ukázka:** Zobrazte dělící slajd kategorie 5.

**Přechod:** „Co je to RCON konzole?“

---

## 29. Co je RCON konzole?

**Řekni:** „RCON konzole je rozhraní, které nám umožňuje posílat příkazy přímo do spuštěného Minecraft serveru z terminálu Linuxu.“

**Zapojení / ukázka:** Vysvětlete, že nemusíte být přihlášeni ve hře, abyste mohli dělat správu.

**Přechod:** „Jak si dáme admin práva (OP)?“

---

## 30. Udělení admin práv (OP)

**Řekni:** „Pro udělení admin práv zadejte v terminálu: `docker exec -i mc-server rcon-cli op student`. Slovo `student` nahraďte vaším herním jménem.“

**Zapojení / ukázka:** Ukažte v logu hry zprávu „Made student a server operator“.

**Přechod:** „Jaké další příkazy můžeme v konzoli použít?“

---

## 31. Základní příkazy v konzoli

**Řekni:** „V konzoli můžeme měnit čas příkazem `time set day` nebo přepínat herní módy příkazem `gamemode creative student`.“

**Zapojení / ukázka:** Předveďte změnu času na den přímo před studenty.

**Přechod:** „Jak upravíme hlavní konfigurační soubor hry?“

---

## 32. Úprava nastavení serveru

**Řekni:** „Pokud chcete změnit pravidla (např. vypnout PVP), otevřete soubor `./data/server.properties` v editoru nano a změňte požadovaný řádek.“

**Zapojení / ukázka:** Ukažte soubor `server.properties` na projektoru.

**Přechod:** „Jak aplikujeme změny v nastavení?“

---

## 33. Restartování kontejneru

**Řekni:** „Po úpravě nastavení stačí v terminálu zadat `docker-compose restart`. Server se během několika sekund restartuje s novým nastavením.“

**Zapojení / ukázka:** Předveďte rychlost restartu kontejneru.

**Přechod:** „Přejděme do šesté kategorie: Zálohování a samostatné cvičení.“

---

## 34. Kategorie 6: Zálohování a cvičení

**Řekni:** „V závěrečné části si ukážeme zálohování dat a dáme si samostatný úkol.“

**Zapojení / ukázka:** Zobrazte dělící slajd kategorie 6.

**Přechod:** „Jak vytvoříme zálohu světa?“

---

## 35. Jak vytvořit zálohu světa?

**Řekni:** „Protože jsou všechna data ve složce `./data`, vytvoříme zálohu zabalením této složky do archivu příkazem `tar -czvf zaloha-mc.tar.gz ./data`.“

**Zapojení / ukázka:** Předveďte vytvoření souboru `zaloha-mc.tar.gz`.

**Přechod:** „Jak zálohu v případě potřeby obnovíme?“

---

## 36. Jak obnovit svět ze zálohy?

**Řekni:** „Pokud chceme svět obnovit, nejprve zastavíme server příkazem `docker-compose down`, rozbalíme zálohu `tar -xzvf zaloha-mc.tar.gz` a opět server spustíme `docker-compose up -d`.“

**Zapojení / ukázka:** Vysvětlete jednoduchost obnovy.

**Přechod:** „Nyní si vše vyzkoušíte samostatně.“

---

## 37. Samostatné cvičení

**Řekni:** „Nyní máte čas na samostatný úkol: Vytvořte novou složku `~/muj-mc-server`, stáhněte do ní `server.jar`, vytvořte `Dockerfile`, `start.sh` a `docker-compose.yml`, sestavte vlastní image přes `docker compose build` a spusťte server.“

**Zapojení / ukázka:** Obcházejte učebnu a pomáhejte účastníkům s plněním úkolu.

**Přechod:** „Pojďme si dnešní lekci zrekapitulovat.“

---

## 38. Shrnutí modulu

**Řekni:** „Dnes jsme si sami sestavili Minecraft image z Java základu, vlastního Dockerfile a oficiálního `server.jar`. K tomu jsme napsali Compose, namapovali port, uložili svět na disk a spravovali server přes RCON. Skvělá práce!“

**Zapojení / ukázka:** Otevřete prostor pro případné dotazy účastníků.
