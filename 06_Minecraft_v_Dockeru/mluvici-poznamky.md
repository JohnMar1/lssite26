# Mluvené poznámky ke každému slajdu — Letní škola sítí: 6. Minecraft server v Dockeru (2-hodinový workshop)

Scénář je psaný pro lektory i účastníky. Text po značce **Řekni** představuje hotovou formulaci výkladu, **Zapojení / ukázka** uvádí praktické akce v učebně a **Přechod** pomáhá plynule navázat na další téma.

## Doporučené tempo (Celkem 120 minut)

- **Blok 1 (Slajdy 1–4):** Úvod, motivace, tradiční instalace vs. Docker, `itzg/minecraft-server` (~15 min)
- **Blok 2 (Slajdy 5–6):** Konfigurace `docker-compose.yml` a Environment proměnné (~20 min)
- **Blok 3 (Slajdy 7–9):** Síťové porty (25565), Volumes, datová persistence a struktura `./data` (~20 min)
- **Blok 4 (Slajdy 10–13):** Praktické vytvoření souboru, `docker-compose up -d`, sledování logů a připojení prvních hráčů (~20 min)
- **Blok 5 (Slajdy 14–16):** RCON konzole, příkazy `/op`, `/gamemode`, úprava `server.properties` (~25 min)
- **Blok 6 (Slajdy 17–21):** Instalace pluginů (Paper/Spigot), GeyserMC (Bedrock podpora), zálohování a samostatné cvičení (~20 min)

---

## 1. Titulní slajd — 6. Minecraft v Dockeru

**Řekni:** „Vítám vás u modulu 6. Minecraft v Dockeru. Dnes si prakticky vyzkoušíme, jak pomocí Docker Compose postavit, spustit a spravovat herní Minecraft server během několika minut. Tento workshop je naplánovaný na 2 hodiny plné praxe a zkoušení.“

**Zapojení / ukázka:** Zeptejte se účastníků zvednutím ruky: „Kdo z vás někdy zkoušel založit vlastní Minecraft server pro kamarády?“

**Přechod:** „Pojďme si ukázat podrobný program dnešního dvoutaktového bloku.“

---

## 2. Harmonogram workshopu (~120 min)

**Řekni:** „Náš dvouhodinový blok jsme rozděleni do 6 částí. Nejdříve si ujasníme teorie a výhody kontejnerizace herních serverů, pak společně napíšeme `docker-compose.yml`, vysvětlíme si porty a volumes, spustíme první server, dáme si admin práva přes RCON konzoli a v závěru si nahrajeme pluginy a vyzkoušíme zálohování.“

**Zapojení / ukázka:** Ukažte časový plán a zdůrazněte, že na konci si všichni vyzkouší spojit se na servery svých sousedů v učebně.

**Přechod:** „Začneme s Blokem 1: Proč vůbec stavět servery v Dockeru?“

---

## 3. Blok 1: Tradiční server vs. Docker

**Řekni:** „Každý, kdo někdy spravoval Minecraft server ručně na Linuxu, ví, jaká je to frustrace. Musíte řešit správnou verzi Javy — starším verzím stačila Java 8, novější vyžadují Java 17 nebo 21. Musíte řešit běh na pozadí přes `screen` nebo `tmux`. V Dockeru je všechno zabalené v jediném kontejneru. Chcete změnit verzi? Změníte jedno číslo v konfiguraci a Docker se postará o zbytek.“

**Zapojení / ukázka:** Projděte porovnání v tabulce ❌ Tradiční instalace vs 🚀 Docker řešení.

**Přechod:** „Který Docker Image k tomu použijeme?“

---

## 4. Náš hlavní nástroj: `itzg/minecraft-server`

**Řekni:** „Nepíšeme vlastní Dockerfile od nuly. Použijeme komunitní standard `itzg/minecraft-server`. Tento image má přes 100 milionů stažení na Docker Hubu. Jeho obrovskou výhodou je, že podporuje všechny dostupné herní servery — od oficiálního Vanilla přes výkonný Paper a Spigot až po modované servery Forge a Fabric.“

**Zapojení / ukázka:** Vysvětlete, že veškerá konfigurace probíhá přes proměnné prostředí (Environment Variables), bez nutnosti ručního editování dlouhých textových souborů před startem.

**Přechod:** „Přejděme k Bloku 2: Jak vypadá konfigurační soubor `docker-compose.yml`.“

---

## 5. Blok 2: Konfigurace docker-compose.yml

**Řekni:** „Zde vidíte kompletní předlohu souboru `docker-compose.yml`. Definujeme službu `mc-server`, nastavujeme publikovaný port `25565:25565`, vyžadovaný souhlas s EULA licenci `EULA=TRUE`, vybereme typ serveru `PAPER`, paměťový limit `2G` a namapujeme složku `./data:/data`.“

**Zapojení / ukázka:** Podrobně projděte jednotlivé řádky YAML souboru a zdůrazněte správné odsazení mezerníky (YAML nepodporuje tabulátory!).

**Přechod:** „Podívejme se na přehled všech proměnných, které můžeme nastavit.“

---

## 6. Přehled klíčových Environment proměnných

**Řekni:** „Klíčové proměnné jsou `EULA=TRUE` (bez toho server nenastartuje), `TYPE=PAPER` (Paper je zoptimalizovaný fork Spigotu s nejlepším výkonem), `MEMORY=2G` (alokovaná RAM) a `OPS` (seznam Nicků, kteří dostanou příkazem automaticky admin práva).“

**Zapojení / ukázka:** Ukažte rozdíl mezi alokací 1G (pro malé testování) a 2G/4G (pro plynulé hraní více lidí).

**Přechod:** „V Bloku 3 si rozebereme síťové porty a uložení dat na disk.“

---

## 7. Blok 3: Úložiště (Volumes) & Síťové Porty

**Řekni:** „Minecraft Java Edition komunikuje na standardním síťovém portu TCP 25565. Zápis `- "25565:25565"` znamená: Port 25565 na vašem fyzickém počítači se přesměruje na port 25565 uvnitř kontejneru. Pokud byste chtěli na jednom PC provozovat druhý server, změníte vnější port např. na `25566:25565`.“

**Zapojení / ukázka:** Ukažte na tabuli princip port forwarding z hostitele do kontejneru.

**Přechod:** „Proč je klíčové nastavit Volumes?“

---

## 8. Persistence dat — Proč potřebujeme Volume?

**Řekni:** „Připomeňme si ze včerejší lekce Dockeru: Kontejnery jsou stateless. Pokud bychom nenamapovali složku `./data:/data`, tak v momentu, kdy kontejner zastavíme nebo smažeme (`docker-compose down`), přijdeme o veškeré stavby a vygenerovaný svět! Zápis `./data:/data` uloží všechny soubory přímo na váš fyzický disk do podadresáře `./data`.“

**Zapojení / ukázka:** Zvýrazněte řádek `volumes:` v Docker Compose.

**Přechod:** „Co všechno se ve složce `./data` vytvoří?“

---

## 9. Co všechno najdeme ve složce `./data`?

**Řekni:** „Po prvním spuštění Docker automaticky vytvoří ve složce `./data` kompletní strukturu serveru: Složky `world`, `world_nether` a `world_the_end` obsahují bloky a terén, `server.properties` obsahuje nastavení hry a ve složce `plugins` najdeme rozšiřující balíčky.“

**Zapojení / ukázka:** Ukažte účastníkům, že struktura složky je 100% identická s klasickým Minecraft serverem.

**Přechod:** „Pojďme do Bloku 4: Všechno si živě vyzkoušíme v terminálu!“

---

## 10. Blok 4: Spuštění, Logy & Připojení hráčů — Krok 1

**Řekni:** „Nyní všichni otevřete terminál na svých počítačích. Vytvoříme novou složku `mkdir -p ~/mc-server`, přejdeme do ní `cd ~/mc-server` a otevřeme textový editor `nano docker-compose.yml`.“

**Zapojení / ukázka:** Zkontrolujte v učebně, že všichni účastníci mají otevřený editor nano a připravené okno pro vložení YAML konfigurace.

**Přechod:** „Uložíme soubor a spustíme kontejner.“

---

## 11. Krok 2: Spuštění serveru v kontejneru

**Řekni:** „Zadejte příkaz `docker-compose up -d`. Parametr `-d` znamená detached mode — server poběží tiše na pozadí a uvolní nám příkazovou řádku.“

**Zapojení / ukázka:** Předveďte spuštění na projektoru a ukažte hlášku `Creating mc-server ... done`.

**Přechod:** „Jak zkontrolujeme, zda se server správně načítá?“

---

## 12. Krok 3: Sledování logů a stavu startu

**Řekni:** „Pro živé sledování logů zadejte `docker-compose logs -f`. Zde uvidíte, jak Docker stahuje Paper.jar, spouští Java JVM a generuje terén. Jakmile uvidíte řádek `[Server thread/INFO]: Done (...)!`, server běží!“

**Zapojení / ukázka:** Zdůrazněte zkratku <kbd>Ctrl+C</kbd> pro vyskočení ze sledování logů bez zastavení samotného serveru.

**Přechod:** „Nyní nastává ta nejlepší část: Zapneme hru a připojíme se!“

---

## 13. Krok 4: Připojení prvních hráčů

**Řekni:** „Spusťte na svém PC Minecraft klient ve verzi 1.20.4, zvolte Multiplayer -> Direct Connection a zadejte IP adresu `localhost`. Klikněte na Join Server.“

**Zapojení / ukázka:** Připojte se na projektoru a ukažte v druhém okně terminálu log připojení `student joined the game`.

**Přechod:** „Přejděme k Bloku 5: Správa konzole a udílení práv.“

---

## 14. Blok 5: Správa serveru přes konzoli & RCON

**Řekni:** „Jak posílat Minecraft příkazy ze systému bez nutnosti se přihlašovat přímo do hry? Image `itzg/minecraft-server` obsahuje nástroj `rcon-cli`. Zadáním `docker exec -i mc-server rcon-cli op student` dáte hráči student plná admin práva.“

**Zapojení / ukázka:** Předveďte v terminálu příkazy `rcon-cli op <nick>` a `rcon-cli time set day`.

**Přechod:** „Jaké další příkazy se vám jako správcům hodí?“

---

## 15. Užitečné Minecraft příkazy pro lektory / správa

**Řekni:** „Zde máte přehled nejdůležitějších příkazů: `op` a `deop` pro práva, `gamemode creative` pro létání a nekonečné bloky, `whitelist on` pro uzavření serveru a `tp` pro teleportaci hráčů k sobě.“

**Zapojení / ukázka:** Vyzkoušejte se studenty přepnutí do Creative módu přímo ve hře.

**Přechod:** „Jak upravíme konfiguraci v `server.properties`?“

---

## 16. Úprava nastavení v `server.properties`

**Řekni:** „Pokud chcete změnit např. obtížnost na `hard`, vypnout PVP nebo zapnout létání, otevřete v textovém editoru soubor `./data/server.properties`. Po uložení změn stačí v terminálu zadat `docker-compose restart`.“

**Zapojení / ukázka:** Ukažte příkaz `docker-compose restart` a rychlost opětovného naběhnutí serveru (cca 5 sekund díky kešování!).

**Přechod:** „V posledním Bloku 6 si ukažme pluginy, Bedrock a zálohování.“

---

## 17. Blok 6: Instalace Pluginů (Paper / Spigot)

**Řekni:** „Chcete mít na serveru ekonomiku, práva nebo mini-hry? Stačí stáhnout požadovaný `.jar` plugin a nahrát ho do složky `./data/plugins/`. Po restartu kontejneru Paper plugin automaticky načte.“

**Zapojení / ukázka:** Ukažte stažení ukázkového pluginu nebo použití proměnné `MODRINTH_PROJECTS` v Docker Compose.

**Přechod:** „Co když se chce někdo připojit z mobilního telefonu nebo Xboxu?“

---

## 18. Podpora hráčů z mobilů & konzolí (GeyserMC)

**Řekni:** „Minecraft Java a Bedrock (mobily, konzole, Windows Store) normálně spolu hrát nemohou. Vývojáři ale vytvořili projekt GeyserMC. Pokud namapujete UDP port `19132:19132/udp` a nahrajete plugin Geyser do složky `./data/plugins/`, mohou se hráči z mobilu připojit na váš Java server!“

**Zapojení / ukázka:** Vysvětlete rozdíl mezi TCP (Java) a UDP (Bedrock) porty v Docker Compose.

**Přechod:** „Jak server zálohujeme před prováděním velkých změn?“

---

## 19. Rychlé Zálohování a Obnova světa

**Řekni:** „Všechna data máte v jediné složce `./data`. Záloha celého serveru je otázkou jednoho příkazu `tar -czvf zaloha.tar.gz ./data`. Pokud se cokoliv ve hře rozbije nebo vám vyhoří mapa, jednoduše rozbalíte archiv zpět.“

**Zapojení / ukázka:** Předveďte příkaz `tar -czvf` a ukažte vzniklý komprimovaný soubor zálohy.

**Přechod:** „Nyní je čas na samostatnou práci v učebně!“

---

## 20. Samostatné Cvičení pro Účastníky (~30 min)

**Řekni:** „Nyní máte 30 minut na samostatný úkol. Postavte si vlastní Minecraft server v nové složce `~/muj-mc-server`. Nastavte vlastní název MOTD, přidejte se do OP, spravujte konzoli a pozvěte souseda ze židle vedle, aby se připojil na vaši IP adresu!“

**Zapojení / ukázka:** Obcházejte učebnu, pomáhejte s konfigurací Docker Compose, řešte případné překlepy v YAML syntaxi a pomáhejte s propojením hráčů v LAN síti.

**Přechod:** „Pojďme si dnešní workshop zrekapitulovat.“

---

## 21. Skvělá práce! 🎮

**Řekni:** „Gratuluji všem! Během dnešních 2 hodin jste se naučili kompletní správu Minecraft serverů v Dockeru. Umíte psát `docker-compose.yml`, spravovat paměť a porty, používat RCON konzoli, instalovat pluginy a zálohovat svět.“

**Zapojení / ukázka:** Otevřete prostor pro závěrečné dotazy a diskuzi.

**Přechod:** „V následujícím modulu 07. Cloudflare věci si ukážeme, jak tento váš nový server publikovat do celého internetu, aby se k vám mohl připojit kdokoliv z domova bez veřejné IP adresy!“
