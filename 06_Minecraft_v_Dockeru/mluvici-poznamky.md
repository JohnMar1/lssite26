# Mluvené poznámky ke každému slajdu — Letní škola sítí: 6. Minecraft v Dockeru

Scénář je psaný pro lektory i účastníky. Text po značce **Řekni** představuje hotovou formulaci výkladu, **Zapojení / ukázka** uvádí praktické akce v učebně a **Přechod** pomáhá plynule navázat na další téma.

---

## 1. Titulní slajd — Minecraft v Dockeru

**Řekni:** „Vítám vás u modulu 6. Minecraft v Dockeru. Dnes si ukážeme, jak si vytvořit vlastní Docker image s Minecraft serverem a jak ho spouštět pomocí Docker Compose.“

**Zapojení / ukázka:** Zeptejte se účastníků: „Kdo z vás už někdy hrál Minecraft a chtěl mít vlastní server pro sebe a kamarády?“

**Přechod:** „Podívejme se na přehled témat, která si dnes postupně projdeme.“

---

## 2. Co dnes probereme

**Řekni:** „Projdeme si vše od úplných základů: stáhneme oficiální `server.jar`, napíšeme vlastní startovací skript `start.sh`, vytvoříme `Dockerfile`, zkombinujeme to v `docker-compose.yml`, vysvětlíme porty a data, spustíme server, připojíme se ze hry a ukážeme si správu admin práv přes konzoli.“

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

**Řekni:** „Tentokrát nepoužijeme hotový image z Docker Hubu. Napíšeme vlastní `Dockerfile`, použijeme čistý Java runtime (Temurin JRE 17) jako základ a do něj vložíme oficiální `server.jar` a náš startovací skript.“

**Zapojení / ukázka:** Ukažte rozdíl mezi hotovým image a naším buildem: hotový image stáhneme, náš image sestavíme příkazem `docker compose build`.

**Přechod:** „Přejděme do druhé kategorie: Příprava prostředí, `start.sh` a `Dockerfile`.“

---

## 7. Kategorie 2: Příprava skriptu start.sh a Dockerfile

**Řekni:** „Ve druhé části si vytvoříme pracovní složku, stáhněte server.jar, napíšeme startovací skript a předpis pro Docker.“

**Zapojení / ukázka:** Zobrazte dělící slajd kategorie 2.

**Přechod:** „Prvním krokem je vytvoření složky.“

---

## 8. Krok 1: Vytvoření složky

**Řekni:** „Otevřete terminál a vytvořte novou složku příkazem `mkdir mc-server`. Poté se do ní přepněte příkazem `cd mc-server`.“

**Zapojení / ukázka:** Názorně předveďte oba příkazy na projektoru.

**Přechod:** „Nejdřív připravíme oficiální serverový soubor.“

---

## 9. Krok 2: Připravíme `server.jar`

**Řekni:** „Z oficiální stránky Minecraftu stáhněte Java server pro požadovanou verzi. Soubor uložte jako `server.jar` do složky `mc-server`.“

**Zapojení / ukázka:** Nechte účastníky ověřit příkazem `ls -lh server.jar`, že soubor leží ve složce `mc-server`.

**Přechod:** „Nyní si vytvoříme startovací skript.“

---

## 10. Krok 3: Vytvoření `start.sh`

**Řekni:** „Otevřeme editor `nano start.sh`. V něm napíšeme skript, který zkontroluje EULA, automaticky ji potvrdí v adresáři `/data` a spustí Javu.“

**Zapojení / ukázka:** Zkontrolujte, že mají všichni v učebně otevřený editor nano pro `start.sh`.

**Přechod:** „Podívejme se na obsah souboru `start.sh`.“

---

## 11. Ukázka `start.sh`

**Řekni:** „Skript zkontroluje proměnnou EULA, zapiše `eula=true` do souboru `/data/eula.txt`, přepne se do složky `/data` (`cd /data`) a spustí `server.jar` s nastavenou pamětí RAM.“

**Zapojení / ukázka:** Vysvětlete důležitost `cd /data`, díky kterému se mapa a nastavení ukládají do namapované složky `/data`.

**Přechod:** „Po uložení musíme skriptu nastavit práva ke spuštění.“

---

## 12. Nastavení spustitelných práv pro `start.sh`

**Řekni:** „V Linuxu musí mít skript nastavený bit pro spuštění. Spusťte v terminálu příkaz `chmod +x start.sh`.“

**Zapojení / ukázka:** Předveďte příkaz `chmod +x start.sh`.

**Přechod:** „Nyní vytvoříme samotný Dockerfile.“

---

## 13. Krok 4: Vytvoření `Dockerfile`

**Řekni:** „V terminálu zadejte příkaz `nano Dockerfile`. Vytvoříme předpis pro sestavení našeho Docker image.“

**Zapojení / ukázka:** Ukažte otevření souboru `Dockerfile` v nano.

**Přechod:** „Podívejme se na kompletní kód `Dockerfile`.“

---

## 14. Ukázka `Dockerfile`

**Řekni:** „Do souboru napíšeme instrukce: použijeme čistý Java 17 image, nakopírujeme `server.jar` a `start.sh`, vytvoříme uživatele `minecraft` a složku `/data`, vystavíme port 25565 a nastavíme spouštěcí bod.“

**Zapojení / ukázka:** Projděte řádky v Dockerfile od `FROM` až po `ENTRYPOINT`.

**Přechod:** „Vysvětleme si detailně jednotlivé instrukces.“

---

## 15. Vysvětlení instrukcí Dockerfile

**Řekni:** „`FROM` vezme Java runtime. `COPY` přenese naše soubory z počítače do image. `RUN` vytvoří neprivilegovaného uživatele `minecraft` kvůli bezpečnosti — server tak neběží jako root. `ENTRYPOINT` spustí náš `start.sh`.“

**Zapojení / ukázka:** Zdůrazněte bezpečnostní aspekt běhu pod uživatelem `minecraft`.

**Přechod:** „Přejděme do třetí kategorie: Konfigurace `docker-compose.yml`.“

---

## 16. Kategorie 3: Konfigurace docker-compose.yml

**Řekni:** „Ve třetí části napíšeme konfigurační soubor Compose, který propojí náš Dockerfile se sítí a diskovým úložištěm.“

**Zapojení / ukázka:** Zobrazte dělící slajd kategorie 3.

**Přechod:** „Vysvětleme si, co je soubor `docker-compose.yml`.“

---

## 17. Co je `docker-compose.yml`?

**Řekni:** „Soubor `docker-compose.yml` je recept pro Docker Compose. Říká Dockeru, jak z našeho Dockerfile sestavit image a s jakým nastavením ho spustit.“

**Zapojení / ukázka:** Ukažte, že soubor budeme upravovat v terminálovém editoru nano.

**Přechod:** „Vytvořme soubor `docker-compose.yml`.“

---

## 18. Krok 5: Vytvoření souboru Compose

**Řekni:** „V terminálu zadejte příkaz `nano docker-compose.yml`. Otevře se textový editor.“

**Zapojení / ukázka:** Ověřte, že všichni píší do složky `mc-server`.

**Přechod:** „Podívejme se na obsah souboru `docker-compose.yml`.“

---

## 19. Ukázka `docker-compose.yml`

**Řekni:** „Compose klíčem `build: context: .` říká, že má sestavit image z našeho Dockerfile v aktuální složce. Dále definujeme port 25565, souhlas EULA: TRUE, paměť 2G a volume `./data:/data`.“

**Zapojení / ukázka:** Projděte jednotlivé řádky v YAML souboru.

**Přechod:** „Vysvětleme si nastavení EULA a paměti RAM.“

---

## 20. Vysvětlení: Souhlas s EULA a paměť

**Řekni:** „Položka `EULA: "TRUE"` předá proměnnou prostředí do nášho skriptu `start.sh`, který ji zkontroluje a zapíše souhlas do souboru `eula.txt`. `MEMORY: "2G"` zase omezí paměť Javy.“

**Zapojení / ukázka:** Ukažte spojitost mezi `environment:` v compose a `EULA` proměnnou ve `start.sh`.

**Přechod:** „Přejděme do čtvrté kategorie: Síťové porty a Úložiště.“

---

## 21. Kategorie 4: Síťové porty a Úložiště (Volumes)

**Řekni:** „Ve čtvrté části si vysvětlíme, jak se k serveru připojujeme a jak ukládáme postavený svět na disk.“

**Zapojení / ukázka:** Zobrazte dělící slajd kategorie 4.

**Přechod:** „Vysvětleme si pojem síťový port.“

---

## 22. Co je to síťový port?

**Řekni:** „Síťový port si můžete představit jako číslo dveří v budově. Minecraft hry používají pro komunikaci po síti standardní port číslo 25565.“

**Zapojení / ukázka:** Přirovnejte IP adresu k ulici a port k číslu dveří.

**Přechod:** „Jak nastavíme port v souboru Compose?“

---

## 23. Mapování portu v Compose

**Řekni:** „Zápis `25565:25565` v sekci `ports` propojí port vášho počítače s portem uvnitř kontejneru. Díky tomu bude hra schopna server najít na `localhost:25565`.“

**Zapojení / ukázka:** Vysvětlete rozdíl mezi vnějším a vnitřním portem.

**Přechod:** „Proč potřebujeme úložiště dat?“

---

## 24. Proč potřebujeme Úložiště (Volume)?

**Řekni:** „Docker kontejnery jsou dočasné. Po zastavení nebo smazání kontejneru se veškeré neuložené změny ztratí. Bez trvalého úložiště byste přišli o postavený svět.“

**Zapojení / ukázka:** Zdůrazněte důležitost zachování dat na disku.

**Přechod:** „Jak úložiště nastavíme v souboru?“

---

## 25. Nastavení Volume v Compose

**Řekni:** „Řádek `- ./data:/data` v sekci `volumes` vytvoří na vašem počítači složku `data` a propojí ji se složkou `/data` v kontejneru. Díky `cd /data` ve `start.sh` se veškerý stav ukládá sem.“

**Zapojení / ukázka:** Ukažte tečku a lomítko v zápisu `./data`.

**Přechod:** „Co přesně složka `./data` obsahuje?“

---

## 26. Co se uloží do složky `./data`?

**Řekni:** „Ve složce `./data` najdete podadresář `world` s mapou světa, konfigurační soubor `server.properties` a seznam administrátorů `ops.json`.“

**Zapojení / ukázka:** Vysvětlete, že díky této složce je zálohování a úprava nastavení velmi snadná.

**Přechod:** „Přejděme do páté kategorie: Spuštění serveru a připojení.“

---

## 27. Kategorie 5: Spuštění serveru a připojení

**Řekni:** „V páté části server sestavíme, poprvé spustíme a připojíme se do hry.“

**Zapojení / ukázka:** Zobrazte dělící slajd kategorie 5.

**Přechod:** „Jaké příkazy použijeme ke spuštění?“

---

## 28. Sestavení image a spuštění příkazem `up`

**Řekni:** „Nejdřív zadejte `docker compose build`, čímž Docker podle `Dockerfile` sestaví náš nový image `muj-minecraft:1.20.4`. Potom spusťte `docker compose up -d`, který vytvoří a nastartuje kontejner.“

**Zapojení / ukázka:** Předveďte zadání obou příkazů na projektoru.

**Přechod:** „Vysvětleme si význam parametru `-d`.“

---

## 29. Co znamená parametr `-d`?

**Řekni:** „Parametr `-d` znamená 'detached'. Spustí server na pozadí, takže vám terminál zůstane volný pro zadávání dalších příkazů.“

**Zapojení / ukázka:** Ukažte, že se po spuštění vrátila příkazová řádka.

**Přechod:** „Jak sledujeme průběh startu?“

---

## 30. Sledování startu v logu

**Řekni:** „První start zabere asi půl minuty, protože se generuje mapa a startuje Java. Průběh sledujeme příkazem `docker compose logs -f`. Sledování ukončíme zkratkou Ctrl+C.“

**Zapojení / ukázka:** Ukažte výpis logů a ukončení sledování pomocí Ctrl+C.

**Přechod:** „Jak poznáme, že je server připraven?“

---

## 31. Jak poznám, že server běží?

**Řekni:** „Jakmile se v logu objeví hláška `Done (...)! For help, type "help"`, znamená to, že je server plně načten a připraven pro hráče.“

**Zapojení / ukázka:** Ukažte tento řádek na projektoru.

**Přechod:** „Pojďme se připojit z hry Minecraft.“

---

## 32. Připojení ze hry Minecraft

**Řekni:** „Spusťte Minecraft klient verze 1.20.4, zvolte Hra pro více hráčů, klikněte na Přímé připojení a do adresy napište `localhost`. Klikněte na Připojit se ke serveru.“

**Zapojení / ukázka:** Předveďte přihlášení postavy do hry na projektoru.

**Přechod:** „Přejděme do šesté kategorie: Admin práva a správa konzole.“

---

## 33. Kategorie 6: Admin práva a správa konzole

**Řekni:** „V šesté části si ukážeme, jak se připojit ke konzoli kontejneru a jak spravovat admin práva.“

**Zapojení / ukázka:** Zobrazte dělící slajd kategorie 6.

**Přechod:** „Co je to serverová konzole?“

---

## 34. Co je serverová konzole?

**Řekni:** „Serverová konzole je přímo běžící proces Minecraftu. Pomocí příkazu `docker attach mc-server` se připojíme k jeho standardnímu vstupu a výstupu.“

**Zapojení / ukázka:** Vysvětlete, že nemusíte být přihlášeni ve hře, abyste mohli dělat správu.

**Přechod:** „Jak si dáme admin práva (OP)?“

---

## 35. Udělení admin práv (OP)

**Řekni:** „V terminálu zadejte `docker attach mc-server` a po připojení zadejte příkaz `op student`. Slovo `student` nahraďte vaším herním jménem. Pro odpojení stiskněte sekvenci `Ctrl+P` a potom `Ctrl+Q`.“

**Zapojení / ukázka:** Předveďte přikoupení konzole, příkaz `op` a bezpečné odpojení přes Ctrl+P, Ctrl+Q.

**Přechod:** „Jaké další příkazy můžeme v konzoli použít?“

---

## 36. Základní příkazy v konzoli

**Řekni:** „V konzoli můžeme měnit čas příkazem `time set day` nebo přepínat herní módy příkazem `gamemode creative student`. V konzoli nepíšeme úvodní lomítko `/`.“

**Zapojení / ukázka:** Předveďte změnu času na den přímo před studenty.

**Přechod:** „Jak upravíme hlavní konfigurační soubor hry?“

---

## 37. Úprava nastavení serveru

**Řekni:** „Pokud chcete změnit pravidla (např. vypnout PVP nebo změnit uvitací zprávu), otevřete soubor `./data/server.properties` v editoru nano a změňte požadovaný řádek.“

**Zapojení / ukázka:** Ukažte soubor `server.properties` na projektoru.

**Přechod:** „Jak aplikujeme změny v nastavení?“

---

## 38. Restartování kontejneru

**Řekni:** „Po úpravě nastavení stačí v terminálu zadat `docker compose restart`. Server se během několika sekund restartuje s novým nastavením.“

**Zapojení / ukázka:** Předveďte rychlost restartu kontejneru.

**Přechod:** „Přejděme do sedmé kategorie: Zálohování a samostatné cvičení.“

---

## 39. Kategorie 7: Zálohování a cvičení

**Řekni:** „V závěrečné části si ukážeme zálohování dat a dáme si samostatný úkol.“

**Zapojení / ukázka:** Zobrazte dělící slajd kategorie 7.

**Přechod:** „Jak vytvoříme zálohu světa?“

---

## 40. Jak vytvořit zálohu světa?

**Řekni:** „Protože jsou všechna data ve složce `./data`, vytvoříme zálohu zabalením této složky do archivu příkazem `tar -czvf zaloha-mc.tar.gz ./data`.“

**Zapojení / ukázka:** Předveďte vytvoření souboru `zaloha-mc.tar.gz`.

**Přechod:** „Jak zálohu v případě potřeby obnovíme?“

---

## 41. Jak obnovit svět ze zálohy?

**Řekni:** „Pokud chceme svět obnovit, nejprve zastavíme server příkazem `docker compose down`, rozbalíme zálohu `tar -xzvf zaloha-mc.tar.gz` a opět server spustíme `docker compose up -d`.“

**Zapojení / ukázka:** Vysvětlete jednoduchost obnovy.

**Přechod:** „Nyní si vše vyzkoušíte samostatně.“

---

## 42. Samostatné cvičení

**Řekni:** „Nyní máte čas na samostatný úkol: Vytvořte složku `~/muj-mc-server`, stáhněte `server.jar`, vytvořte `start.sh` (s `chmod +x`), napište `Dockerfile` a `docker-compose.yml`, sestavte image přes `docker compose build` a spusťte server.“

**Zapojení / ukázka:** Obcházejte učebnu a pomáhejte účastníkům s plněním úkolu.

**Přechod:** „Pojďme si dnešní lekci zrekapitulovat.“

---

## 43. Shrnutí modulu

**Řekni:** „Dnes jsme si sami sestavili Minecraft image z Java základu, vlastního Dockerfile a oficiálního `server.jar`. K tomu jsme napsali Compose, namapovali port, uložili svět na disk a spravovali server přes konzoli. Skvělá práce!“

**Zapojení / ukázka:** Otevřete prostor pro případné dotazy účastníků.
