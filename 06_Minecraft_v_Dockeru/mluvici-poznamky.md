# Mluvené poznámky ke každému slajdu — Letní škola sítí: 6. Minecraft v Dockeru

Scénář je psaný pro lektory i účastníky. Text po značce **Řekni** představuje hotovou formulaci výkladu, **Zapojení / ukázka** uvádí praktické akce v učebně a **Přechod** pomáhá plynule navázat na další téma.

---

## 1. Titulní slajd — Minecraft v Dockeru

**Řekni:** „Vítám vás u modulu 6. Minecraft v Dockeru. Dnes si ukážeme, jak pomocí Docker Compose postavit, spustit a spravovat herní Minecraft server v izolovaném kontejneru.“

**Zapojení / ukázka:** Zeptejte se účastníků: „Kdo z vás už někdy spravoval herní server nebo se pokoušel rozjet Minecraft server na vlastním počítači?“

**Přechod:** „Podívejme se na přehled témat, která dnes probereme.“

---

## 2. Co dnes probereme

**Řekni:** „Dnes si postupně rozebereme výhody kontejnerizace oproti tradiční instalaci, napíšeme konfigurační soubor `docker-compose.yml`, nastavíme síťové porty a persistence světa, spustíme server, vyzkoušíme RCON konzoli a ukážeme si práci s pluginy a zálohováním.“

**Zapojení / ukázka:** Projděte odrážky na slajdu.

**Přechod:** „Přejděme k první kategorii: Teorie a výhody kontejnerizace.“

---

## 3. Teorie a výhody kontejnerizace

**Řekni:** „Začneme srovnáním tradiční instalace a běhu v Dockeru.“

**Zapojení / ukázka:** Odhalte postupně odrážky tradiční instalace a Docker řešení.

**Přechod:** „Srovnejme si obě metody podrobněji.“

---

## 4. Tradiční instalace vs. Docker

**Řekni:** „U tradiční instalace musíte řešit konkrétní verzi Javy, spouštění přes screen nebo systemd a riziko konfliktů v hostitelském OS. V Dockeru je Java i server zabalen v jediném obrazu a spouštění probíhá jednoduše přes Docker Compose.“

**Zapojení / ukázka:** Vysvětlete výhodu izolace v prostředí učebny.

**Přechod:** „Jaký obraz pro Minecraft server použijeme?“

---

## 5. Obraz `itzg/minecraft-server`

**Řekni:** „Použijeme ověřený komunitní obraz `itzg/minecraft-server`. Podporuje servery Vanilla, Paper, Spigot i modované servery Forge nebo Fabric. Veškeré nastavení probíhá přes proměnné prostředí.“

**Zapojení / ukázka:** Zdůrazněte, že si obraz sám automaticky stáhne potřebnou verzi Minecraftu i Javy.

**Přechod:** „Přejděme do druhé kategorie: Konfigurace `docker-compose.yml`.“

---

## 6. Konfigurace docker-compose.yml

**Řekni:** „Ukážeme si strukturu konfiguračního souboru `docker-compose.yml`.“

**Zapojení / ukázka:** Ukažte v editoru správné odsazení YAML syntaxe.

**Přechod:** „Projděme si samotný kód konfigurace.“

---

## 7. Struktura souboru `docker-compose.yml`

**Řekni:** „V souboru definujeme službu `mc-server`, nastavíme obraz `itzg/minecraft-server:latest`, mapování portů `25565:25565`, vyžadovaný souhlas s licencí `EULA=TRUE`, typ `PAPER`, verzi `1.20.4`, paměť `2G` a namapujeme složku `./data:/data`.“

**Zapojení / ukázka:** Vysvětlete význam jednotlivých sekcí `ports`, `environment` a `volumes`.

**Přechod:** „Jaké proměnné prostředí můžeme dále nastavit?“

---

## 8. Klíčové Environment proměnné

**Řekni:** „Klíčové proměnné jsou `EULA=TRUE` pro souhlas s licencí, `TYPE=PAPER` pro volbu typu serveru, `MEMORY=2G` pro nastavení paměti RAM a `OPS` pro automatické přidělení operátorských práv.“

**Zapojení / ukázka:** Projděte tabulku proměnných.

**Přechod:** „Přejděme do třetí kategorie: Síťové porty a persistence dat.“

---

## 9. Síťové porty a Persistence dat

**Řekni:** „Podíváme se na princip síťování a ukládání dat.“

**Zapojení / ukázka:** Ukažte na tabuli princip propojení disku a síťového rozhraní.

**Přechod:** „Jak funguje mapování portů pro Minecraft?“

---

## 10. Mapování síťových portů

**Řekni:** „Minecraft Java Edition používá výchozí port TCP 25565. Zápis `- "25565:25565"` přesměruje port z hostitele do kontejneru. Pokud spouštíme více serverů na jednom stroji, měníme pouze vnější port hostitele.“

**Zapojení / ukázka:** Ukažte příklad pro druhý server na portu 25566.

**Přechod:** „Proč je nutné používat Volumes?“

---

## 11. Persistence dat (Volumes)

**Řekni:** „Kontejnery jsou bezstavové. Bez namapované složky bychom po zastavení kontejneru přišli o všechny změny i vygenerovaný svět. Zápis `- ./data:/data` propojí lokální složku na disku se složkou uvnitř kontejneru.“

**Zapojení / ukázka:** Ukažte strukturu složky `./data` (`world/`, `server.properties`, `plugins/`, `ops.json`).

**Přechod:** „Přejděme do čtvrté kategorie: Spuštění, logy a RCON správa.“

---

## 12. Spuštění, Logy a RCON Správa

**Řekni:** „Nyní si ukážeme praktický postup spuštění a správy serveru.“

**Zapojení / ukázka:** Otevřete terminál a předveďte postup na projektoru.

**Přechod:** „Jaké příkazy pro spuštění použijeme?“

---

## 13. Spuštění serveru a sledování logů

**Řekni:** „Nejprve vytvoříme adresář `mkdir mc-server && cd mc-server`, vytvoříme `docker-compose.yml`, spustíme kontejner na pozadí přes `docker-compose up -d` a sledujeme start v logu přes `docker-compose logs -f`.“

**Zapojení / ukázka:** Ukončete sledování logu stiskem `Ctrl+C` a předveďte připojení z Minecraft klienta na adresu `localhost`.

**Přechod:** „Jak spravujeme konzoli z terminálu?“

---

## 14. Správa konzole přes RCON

**Řekni:** „Pomocí příkazu `docker exec -i mc-server rcon-cli <příkaz>` můžeme posílat příkazy přímo do běžícího serveru, například udělat hráče operátorem přes `rcon-cli op student` nebo změnit čas a počasí.“

**Zapojení / ukázka:** Předveďte udělení admin práv v terminálu.

**Přechod:** „Jak upravujeme soubor `server.properties`?“

---

## 15. Úprava `server.properties`

**Řekni:** „Konfigurační soubor `server.properties` najdeme přímo v lokální složce `./data/server.properties`. Po změně parametrů aplikujeme nastavení restartem kontejneru příkazem `docker-compose restart`.“

**Zapojení / ukázka:** Předveďte rychlý restart kontejneru.

**Přechod:** „Přejděme do páté kategorie: Pluginy, Bedrock a zálohování.“

---

## 16. Pluginy, Bedrock a Zálohování

**Řekni:** „Podíváme se na rozšíření funkčnosti serveru a zálohování dat.“

**Zapojení / ukázka:** Projděte témata závěrečného bloku.

**Přechod:** „Jak instalujeme pluginy a jak připojíme mobilní hráče?“

---

## 17. Rozšíření serveru (Pluginy & Bedrock)

**Řekni:** „Pluginy nahráváme jednoduše jako `.jar` soubory do složky `./data/plugins/`. Pro připojení hráčů z mobilů nebo konzolí využijeme plugin GeyserMC a publikujeme UDP port `19132:19132/udp` v Docker Compose.“

**Zapojení / ukázka:** Vysvětlete rozdíl mezi TCP a UDP porty.

**Přechod:** „Jak provádíme zálohu celého serveru?“

---

## 18. Zálohování a obnova světa

**Řekni:** „Protože jsou všechna data v jediné složce `./data`, stačí k zálohování vytvořit archiv příkazem `tar -czvf zaloha-mc.tar.gz ./data`. Obnova se provede rozbalením archivu a spuštěním `docker-compose up -d`.“

**Zapojení / ukázka:** Ukažte příkaz pro zabalení do tarbalu.

**Přechod:** „Přejděme k samostatnému cvičení pro účastníky.“

---

## 19. Samostatné cvičení

**Řekni:** „Nyní si vyzkoušejte samostatné cvičení: vytvořte složku `~/muj-mc-server`, napište `docker-compose.yml`, spusťte Paper server verze 1.20.4, připojte se z hry a udělejte se adminem.“

**Zapojení / ukázka:** Obcházejte učebnu a pomáhejte účastníkům s cvičením.

**Přechod:** „Skvělá práce, tímto jsme zvládli modul Minecraft v Dockeru!“
