# Mluvené poznámky ke každému slajdu - Letní škola sítí: 2. Základy sítí

Scénář je psaný pro úplné začátečníky. Není potřeba učit se ho doslova. Text po značce **Řekni** můžeš použít skoro jako hotovou formulaci, **Zapojení / ukázka** říká, co máš udělat s publikem, a **Přechod** ti pomůže plynule navázat.

U schémat a vrstev vysvětli principy na přirozených příměrech (pošta, balíky, adresy domů).

## Doporučené tempo

- Slajdy 1-8: Úvod a úplné základy, co je internet, přenos dat, kabely a síťová zařízení, přibližně 30 minut.
- Slajdy 9-19: Adresace (IPv4/v6), síťové vrstvy, porty a protokoly (TCP vs UDP, Handshake, vrstvy), přibližně 45 minut.
- Slajdy 20-33: Síťová bezpečnost, příkazy, nástroje, útoky (DoS/DDoS, MITM, SQLi, XSS, Spoofing), přibližně 45 minut.
- Slajd 34: Závěr a shrnutí, přibližně 5 minut.

---

## 1. Základy sítí

**Řekni:** „Vítám vás u druhého bloku Letní školy sítí - Základy sítí. Dnes si vysvětlíme, jak funguje internet pod pokličkou, jak cestují bajty přes kabely a vzduch, co jsou IP adresy a porty, a na závěr si ukážeme základy síťové bezpečnosti a útoků.“

**Zapojení / ukázka:** Polož otázku: „Co všechno se podle vás musí stát během té jediné sekundy, než se vám po stisku Enteru načte webová stránka Google?“

**Přechod:** „Začneme úplnými základy a vysvětlením, co to vlastně je internet.“

---

## 2. Úvod a úplné základy

**Řekni:** „V této první sekci si ujasníme základní pojmy. Podíváme se na to, jak definujeme internet, jaké máme typy sítí podle geografického rozsahu a z jakých fyzických i logických prvků se síť skládá.“

**Zapojení / ukázka:** Zeptej se publiku: „Jaké sítě používáte každý den? Jaký je rozdíl mezi vaší domácí Wi-Fi a celým internetem?“

**Přechod:** „Pojďme se podívat na samotnou definici internetu.“

---

## 3. Co je internet?

**Řekni:** „Internet je celosvětová decentralizovaná síť navzájem propojených zařízení. Není to jedna budova ani jeden superpočítač. Sítě rozlišujeme podle rozsahu: LAN (Local Area Network) je lokální síť, například u vás doma nebo v naší učebně. WAN (Wide Area Network) je rozsáhlá síť propojující města a státy. Internet je vlastně celosvětovým propojením všech těchto sítí dohromady.“

**Zapojení / ukázka:** Ukaž na počítače v učebně: „Všechny počítače v této místnosti tvoří LAN. Jakmile posíláme data na server v USA, cestujeme přes WAN do internetu.“ Můžeš také zmínit mapu podmořských optických kabelů.

**Přechod:** „Jak přesně funguje přenos dat v takové síti?“

---

## 4. Jak to funguje?

**Řekni:** „Celá síťová komunikace stojí na 4 hlavních pilířích: 1. Fyzický přenos dat (jak se jedničky a nuly šíří po médiu), 2. Připojení k serveru (model klient-server), 3. Adresace (jak najít správný počítač pomocí adres) a 4. Porty a protokoly (jak doručit data správné aplikaci a dodržet pravidla rozhovoru).“

**Zapojení / ukázka:** Použij příměr s klasickou poštou: Přenos dat je silnice, připojení k serveru je adresát, adresace je ulice a číslo domu, port je číslo bytu a jméno konkrétního člověka.

**Přechod:** „Podívejme se podrobněji na první pilíř - přenos dat a síťová média.“

---

## 5. Přenos dat

**Řekni:** „Data v síti necestují jako jeden obrovský soubor, ale rozsekají se na malé části zvané pakety. Každý paket má hlavičku s adresou odesílatele a příjemce. Fyzicky přenášíme bity (0 a 1) pomocí tří hlavních médií: měděnými kabely (elektrický signál), optickými kabely (světelný paprsek) nebo bezdrátově přes Wi-Fi (rádiové vlnění). U měděných kabelů rozlišujeme UTP (nestíněná kroucená dvoulinka) a STP (stíněná proti rušení).“

**Zapojení / ukázka:** Ukaž kousek rozstřiženého ethernetového UTP kabelu nebo vysvětli, proč jsou parní vodiče v kabelu zkroucené (potlačení elektromagnetického rušení).

**Přechod:** „Jak vypadají tyto kabely na fotkách?“

---

## 6. Přenos dat - kabely

**Řekni:** „Na slajdu vidíte srovnání dvou hlavních kabelových médií. Vlevo je klasický měděný kabel (kroucená dvoulinka s konektorem RJ-45), který zapojujete do počítače nebo routeru. Vpravo je optický kabel - uvnitř je tenké skleněné či plastové vlákno, kterým bliká laser nebo LED dioda. Optika přenáší obrovské množství dat rychlostí světla na desítky kilometrů bez ztráty kvality signálu.“

**Zapojení / ukázka:** Zeptej se: „Proč nepoužíváme optické kabely úplně všude, třeba až do mobilu nebo myši?“ (Vysvětli vyšší cenu, křehkost vláken a náročnost spojování).

**Přechod:** „Která síťová zařízení tyto kabely propojují a směrují v nich provoz?“

---

## 7. Síťová zařízení

**Řekni:** „Mezi hlavní síťové prvky patří: Router (směrovač), který propojuje různé sítě (např. vaši domácnost s internetem) a rozhoduje o cestě paketů. Switch (přepínač), který propojuje zařízení uvnitř jedné LAN sítě. Access Point (AP), který šíří bezdrátový Wi-Fi signál. Koncová zařízení jsou počítače, mobily, tiskárny nebo servery. Komunikace probíhá buď jako Server-Client (klient žádá, server odpovídá), nebo Peer-to-Peer (P2P - zařízení si mění data přímo mezi sebou, např. torrenty).“

**Zapojení / ukázka:** Zeptej se: „Když máte doma krabičku od poskytovatele internetu, co je to za zařízení?“ (Vysvětli, že domácí 'router' je v reálu kombinace routeru, switche, Wi-Fi AP a modemu v jednom těle).

**Přechod:** „Ukažme si, jak tato zařízení vypadají v reálném světě.“

---

## 8. Síťová zařízení - ukázky

**Řekni:** „Na obrázcích vidíte reálné ukázky: 1. Wi-Fi router / Access Point s anténami, 2. Rackový switch s mnoha porty pro zapojení kabelů RJ-45 v serverovně, a 3. Schéma síťové topologie, kde jsou počítače zapojené do switche a ten dále do routeru.“

**Zapojení / ukázka:** Ukaž účastníkům fyzický switch nebo router v učebně či v datovém rozvaděči (racku).

**Přechod:** „Máme za sebou fyzickou infrastrukturu. Nyní se posuneme k druhému bloku: Adresace, porty a protokoly.“

---

## 9. Adresace, porty a protokoly

**Řekni:** „V této sekci se podíváme na logickou stránku sítí. Vysvětlíme si, jak počítače získávají a používají IP a MAC adresy, jaký je rozdíl mezi IPv4 a IPv6, jak fungují síťové vrstvy a jak se od sebe liší protokoly TCP a UDP.“

**Zapojení / ukázka:** Zeptej se: „Víte, jakou IP adresu má právě teď váš počítač? A má ji takovou navždy?“

**Přechod:** „Začneme vysvětlením dvojičky adres: MAC adresa vs. IP adresa.“

---

## 10. Adresace a důležité pojmy

**Řekni:** „Každé síťové rozhraní má dvě hlavní adresy. MAC adresa je fyzická 48bitová hexadecimální adresa vypálená do síťové karty výrobcem (např. 00:0a:95:9d:67:16). IP adresa je logická adresa pridělená v síti. K IP adrese patří maska sítě (určuje část sítě a část hostitele), výchozí brána (Default Gateway - router pro odchozí provoz) a broadcast adresa. Dále rozlišujeme statické adresy (nastavené ručně) a dynamické (získané automaticky z DHCP). Speciální je Loopback (127.0.0.1 / localhost - odkaz na sebe sama) a VPN (zabezpečený virtuální tunel).“

**Zapojení / ukázka:** Příměr: MAC adresa je jako vaše rodné číslo (neměnné, identifikuje hardware). IP adresa je jako vaše poštovní adresa (mění se podle toho, do jaké sítě / domu se připojíte).

**Přechod:** „Jaké dvě verze IP adres v dnešním internetu používáme?“

---

## 11. IPv4 a IPv6

**Řekni:** „IPv4 adresa má 32 bitů zapsaných jako 4 čísla 0-255 oddělená tečkami (např. 1.1.1.1). Protože nabízí jen cca 4,3 miliardy adres, adresy došly. Proto používáme privátní rozsahy (10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16) pro vnitřní sítě. Dlouhodobým řešením je IPv6 - 128bitová adresa zapsaná hexadecimálně (např. 2001:db8:1::ab9:C0A8:102), která poskytuje prakticky neomezené množství adres.“

**Zapojení / ukázka:** Nechte účastníky otevřít terminál a spustit příkaz `ip a` (Linux) nebo `ipconfig` (Windows) a najít jejich IPv4 a IPv6 adresu.

**Přechod:** „Jak se veškeré síťové protokoly uspořádávají do teoretických vrstev?“

---

## 12. Síťové vrstvy

**Řekni:** „Komunikaci rozděluje síťový model do vrstev. TCP/IP model má 4 hlavní vrstvy: 1. Linková/Fyzická vrstva (kabely, Wi-Fi, MAC adresy, bity), 2. Síťová vrstva (IP adresy, směrování - IP protokol), 3. Transportní vrstva (spojení a doručování aplikacím - TCP/UDP), 4. Aplikační vrstva (služby pro uživatele - HTTP, SSH, DNS). Při odesílání probíhá zapouzdření (encapsulation) - každá vrstva nabalí na data svou hlavičku.“

**Zapojení / ukázka:** Příměr s obálkami: Napíšete dopis (aplikační data), dáte ho do obálky se jménem (transportní), vložíte do poštovní tašky s adresou ulice a města (síťová) a naložíte do auta (fyzická).

**Přechod:** „Když paket dorazí na správnou IP adresu, jak pozná, pro kterou aplikaci v počítači je určen? Pomocí portů!“

---

## 13. Porty

**Řekni:** „Port je logické číslo od 0 do 65535 přidělené konkrétní službě. IP adresa určuje budovu/počítač, port určuje konkrétní dveře/aplikaci. Vybrané známé porty: 20/21 FTP (přenos souborů), 22 SSH (šifrovaná správa), 23 Telnet (nešifrovaný text), 25 SMTP (odesílání pošty), 53 DNS (překlad jmen), 80 HTTP (web), 443 HTTPS (šifrovaný web).“

**Zapojení / ukázka:** Zeptej se: „Když otevřete zabezpečenou stránku `https://ssps.cz`, na jaký port se prohlížeč v pozadí připojuje?“ (Port 443).

**Přechod:** „Co přesně je to síťový protokol a jak se zabezpečuje Wi-Fi?“

---

## 14. Protokoly & Wi-Fi

**Řekni:** „Protokol je soubor pravidel pro komunikaci - určuje formát zpráv, jejich pořadí i postup při chybě. U Wi-Fi sítí se setkáváme s různou úrovní zabezpečení: zastaralé a prolomené WEP, dnes nejběžnější WPA2 (Personal se sdíleným heslem nebo Enterprise s ověřovacím serverem) a nejnovější bezpečné WPA3.“

**Zapojení / ukázka:** Zdůrazni: „Na veřejných Wi-Fi bez hesla nikdy nezadávejte citlivé údaje bez HTTPS nebo zapnuté VPN, protože provoz může kdokoli v okolí odposlouchávat.“

**Přechod:** „Na transportní vrstvě máme dva zásadní protokoly: TCP a UDP. Jak se liší?“

---

## 15. TCP vs. UDP

**Řekni:** „TCP (Transmission Control Protocol) je spojovaný a spolehlivý protokol - garantuje doručení všech paketů ve správném pořadí a ztracené pakety pošle znovu. UDP (User Datagram Protocol) je nespojovaný a rychlý - pošle data bez kontroly doručení. TCP se používá tam, kde nesmí chybět ani bajt (web, e-mail, soubory). UDP se používá tam, kde je přednější rychlost a nízké zpoždění (online hry, videohovory, živý stream).“

**Zapojení / ukázka:** Příklad z praxe: „Při streamování videa nevadí, když vypadne 1 snímek obrazu (UDP). Ale kdyby vypadl 1 bajt v ZIP archivu nebo programu, soubor nepůjde otevřít (TCP).“

**Přechod:** „Jak TCP navazuje spolehlivé spojení? Pomocí Three-Way Handshaku.“

---

## 16. TCP Three-Way Handshake

**Řekni:** „Než si dvě zařízení po TCP pošlou první bajt dat, proběhne trojité podání ruky (Three-Way Handshake): 1. SYN (Klient posílá žádost o navázání spojení), 2. SYN-ACK (Server žádost přijímá a posílá vlastní SYN), 3. ACK (Klient potvrzuje přijetí). Teprve po tomto 3krokovém navázání začnou téct aplikační data.“

**Zapojení / ukázka:** Předveď se studentem dialog: Zamávej mu a řekni 'SYN' -> on zamává a přikývne 'SYN-ACK' -> ty přikývneš 'ACK'. Nyní jsme propojeni!

**Přechod:** „Jaké pomocné protokoly pracují na síťové vrstvě?“

---

## 17. Protokoly síťové vrstvy

**Řekni:** „Mezi nejdůležitější pomocné protokoly patří: ARP (Address Resolution Protocol), který zjišťuje MAC adresu zařízením v LAN, pokud známe jen jejich IP. DHCP (Dynamic Host Configuration Protocol), který automaticky přiděluje IP konfiguraci nově připojeným strojům. DNS (Domain Name System), který překládá doménová jména na IP adresy.“

**Zapojení / ukázka:** Nechte účastníky v terminálu vyzkoušet příkaz `arp -a` pro zobrazení tabulky dříve zjištěných MAC adres v lokální síti.

**Přechod:** „Podívejme se na odlehčený vtip o protokolech.“

---

## 18. Protokoly síťové vrstvy (Ukázka / Vtip)

**Řekni:** „Na slajdu je klasický síťový vtip ilustrující rozdíl mezi TCP a UDP: 'Chceš slyšet vtip o TCP? - Ano, chci slyšet vtip o TCP. - Dobře, pošlu ti vtip o TCP...' (stálé potvazování a příprava) vs. UDP: 'Řeknu ti vtip o UDP a je mi úplně jedno, jestli jsi ho slyšel nebo zachytil.'“

**Zapojení / ukázka:** Krátké odlehčení pro udržení pozornosti publika před přechodem k aplikační vrstvě.

**Přechod:** „Pojďme si projít protokoly aplikační vrstvy.“

---

## 19. Protokoly aplikační vrstvy

**Řekni:** „Aplikační protokoly slouží přímo uživatelským aplikacím: Telnet (nešifrovaná vzdálená správa, p:23) vs. SSH (šifrovaný bezpečný terminál, p:22). FTP, SFTP a FTPS (protokoly pro přenos souborů). HTTP (nešifrovaný web, p:80) vs. HTTPS (šifrovaný web přes TLS, p:443). SMTP, POP3 a IMAP (poštovní protokoly pro odesílání a stahování e-mailů).“

**Zapojení / ukázka:** Zeptej se: „Proč dnes na internetu prakticky vymizely služby jako Telnet a nešifrované HTTP?“ (Protože kdokoli po cestě mohl číst hesla a obsah v čistém textu).

**Přechod:** „Tím jsme dokončili teoretickou část o adresaci a protokolech. Posuneme se ke 3. bloku: Síťová bezpečnost.“

---

## 20. Síťová bezpečnost

**Řekni:** „Vítám vás u třetího bloku. Nyní si ukážeme základní síťové příkazy pro diagnostiku v terminálu, představíme si bezpečnostní a analytické nástroje a probereme nejčastější síťové útoky a možnosti obrany.“

**Zapojení / ukázka:** Zeptej se: „Setkal se už někdo z vás s nefunkčním internetem nebo DDoS útokem na vaši oblíbenou hru či web?“

**Přechod:** „Začneme praktickými diagnostickými příkazy v příkazové řádce.“

---

## 21. Základní síťové příkazy

**Řekni:** „V terminálu máme k dispozici sadu klíčových příkazů: `ip a` (nebo `ifconfig`) zobrazí síťové karty a jejich IP adresy. `ping` testuje dostupnost cíle pomocí ICMP zpráv. `traceroute` (na Windows `tracert`) odhalí celou cestu paketů přes jednotlivé směrovače (hopy). `ip r` zobrazí směrovací tabulku. `arp` ukáže ARP cache. `nslookup` / `dig` dotazuje DNS servery. `netstat` / `ss` zobrazí otevřené porty a spojení.“

**Zapojení / ukázka:** Předveď v terminálu spuštění příkazu `ping 1.1.1.1` a následně `traceroute 8.8.8.8` (ukáže průchod uzly v síti).

**Přechod:** „Jaké pokročilé nástroje používají síťoví administrátoři a bezpečnostní experti?“

---

## 22. Nástroje síťové bezpečnosti

**Řekni:** „Mezi hlavní síťové nástroje patří: `nmap` - síťový skener pro zjišťování aktivních hostitelů, otevřených portů a běžících služeb. `Wireshark` / `tcpdump` - analytické nástroje pro zachytávání a zkoumání síťového provozu paket po paketu. `whois` - vyhledač veřejných informací o vlastnících domén a IP rozsahů (OSINT). `Packet Tracer` - simulátor pro návrh a testování síťových topologií.“

**Zapojení / ukázka:** Příměr: Nmap je jako člověk, který obchází budovu a zkouší, které dveře a okna jsou odklenuté.

**Přechod:** „Podívejme se na ukázku rozhraní nástroje Wireshark.“

---

## 23. Wireshark - ukázka

**Řekni:** „Na snímku vidíte rozhraní Wiresharku. V horní části je seznam zachycených paketů v reálném čase. Uprostřed vidíte rozpad jednotlivých vrstev vybraného paketu (Fyzická -> Ethernet -> IP -> TCP -> HTTP). Dole je surový výpis v hexadecimálním tvaru a ASCII textu.“

**Zapojení / ukázka:** Upozorni: „Pokud zachytíte HTTP paket, v ASCII části přímo vidíte odeslané přihlašovací jméno a heslo. U HTTPS vidíte jen nečitelnou šifrovanou změť.“

**Přechod:** „Nyní si ukážeme grafické rozhraní skeneru Nmap - Zenmap.“

---

## 24. Zenmap (Nmap GUI) - ukázka

**Řekni:** „Zenmap je grafické uživatelské rozhraní pro skener Nmap. Zadáte cílovou IP adresu nebo rozsah (Target) a zvolíte profil skenování. Výstup přehledně ukáže otevřené porty (např. 22 SSH, 80 HTTP, 443 HTTPS), detekovaný operační systém a verze služeb.“

**Zapojení / ukázka:** DŮLEŽITÉ UPOZORNĚNÍ: „Skenovat cizí sítě a servery bez výslovného souhlasu majitele je neetické a nelegální. Nástroje používejte výhradně ve vlastních nebo cvičných sítích!“

**Přechod:** „Přejděme k přehledu nejčastějších síťových útoků.“

---

## 25. Síťové útoky

**Řekni:** „V síťovém prostředí se setkáváme s různými typy hrozeb. Mezi nejznámější patří: DoS a DDoS (zahlcení a shazování služeb), Man in the Middle (odposlech a podvržení komunikace), SQL injection a XSS (útoky na webové aplikace a databáze), DNS a URL spoofing (klamaní uživatelů falešnými adresami).“

**Zapojení / ukázka:** Polož otázku: „Který z těchto útoků míří na dostupnost služby a který na ukradení vašich hesel či dat?“

**Přechod:** „Podívejme se podrobněji na DoS a DDoS útoky.“

---

## 26. DoS vs. DDoS

**Řekni:** „DoS (Denial of Service) je útok odepření služby z jednoho zdroje - útočník zahltí cíl takovým množstvím požadavků, že server přestane odpovídat. DDoS (Distributed Denial of Service) je distribuovaná varianta - útočník ovládne síť tisíců nakažených zařízení (botnet) a zaútočí na cíl ze všech těchto strojů naráz. Výsledkem je nedostupnost služby pro legitimní uživatele.“

**Zapojení / ukázka:** Příměr: DoS je jeden člověk blokující přepážku na poště. DDoS je skupina 500 lidí, která zaplní celou halu pošty, takže se běžný zákazník nedostane ani ke dveřím.

**Přechod:** „Podívejme se na grafické schéma fungování DDoS útoku.“

---

## 27. DDoS útok - schéma

**Řekni:** „Na schématu vidíte strukturu DDoS útoku. Útočník (Attacker) neútočí přímo ze svého počítače, ale dává instrukce z řídicího serveru (Command & Control). Tyto příkazy obdrží tisíce zotročovaných zařízení (Botnet / Zombie PC - často špatně zabezpečené chytré kamery, routery nebo počítače). Všichni boti pak současně zahltí obětní webový server.“

**Zapojení / ukázka:** Zmíni známý botnet Mirai z roku 2016, který sestával z napadených IoT kamer s výchozími hesly a shodil velké americké služby.

**Přechod:** „Dalším nebezpečným útokem je Man in the Middle.“

---

## 28. Man in the Middle

**Řekni:** „Při útoku Man in the Middle (Člověk uprostřed / MITM) se útočník tajně vloží do komunikace mezi dvěma stranami (např. mezi váš notebook a Wi-Fi router). Obě strany věří, že mluví přímo spolu, ale útočník veškerá data odposlouchává nebo upravuje. K tomu využívá např. ARP spoofing na lokální síti nebo nešifrované Wi-Fi. Hlavní obranou je šifrování HTTPS, SSH a používání VPN.“

**Zapojení / ukázka:** Názorná ukázka: Dva letoři si posílají papírek s tajnou zprávou, třetí lektor papírek uprostřed zachytí, přečte, změní text a pošle dál.

**Přechod:** „Nyní se podíváme na aplikační útoky na webové stránky - prvním je SQL injection.“

---

## 29. SQL injection

**Řekni:** „SQL injection (SQLi) vzniká, když webová aplikace špatně ošetří vstup od uživatele a vbodne ho přímo do databázového SQL dotazu. Útočník může do přihlašovacího pole zadat např. `admin' OR '1'='1`, čímž obiše ověření hesla, nebo přes SQL příkazy stahovat a mazat celou databázi. Obranou jsou parametrizované dotazy (Prepared Statements) a sanitizace vstupů.“

**Zapojení / ukázka:** Vysvětli logiku: Kód databáze se změní na `WHERE user='admin' AND pass='' OR '1'='1'`. Jelikož výraz `'1'='1'` je vždy pravdivý, databáze útočníka okamžitě přihlásí!

**Přechod:** „Dalším velmi rozšířeným webovým útokem je XSS.“

---

## 30. XSS

**Řekni:** „XSS (Cross-Site Scripting) spočívá v tom, že útočník vloží škodlivý JavaScriptový kód do zranitelného webu (např. do komentáře nebo vyhledávání). Tento skript se následně spustí v prohlížeči ostatních návštěvníků stránky. Útočník tak může ukrást přihlašovací session cookies nebo přesměrovat uživatele na podvodný web. Příklad jednoduchého testovacího skriptu: `<script>alert('Toto je úspěšný XSS útok.');</script>`.“

**Zapojení / ukázka:** Zdůrazni rozdíl: SQLi útočí na databázi na serveru, kdežto XSS útočí na prohlížeče ostatních uživatelů!

**Přechod:** „Pojďme si XSS vyzkoušet v praktickém trenažéru od společnosti Google.“

---

## 31. XSS - praktická část

**Řekni:** „Vyzkoušejte si XSS útoky v bezpečném a legálním prostředí. Využijeme oficiální trenažér Google XSS Game na adrese `https://xss-game.appspot.com/`. V této hře si postupně vyzkoušíte obcházení zranitelných vstupních polí.“

**Zapojení / ukázka:** Nechte studenty otevřít odkaz v prohlížeči a zkusit splnit 1. úroveň vložením kódového řetězce `<script>alert(1)</script>` do vyhledávacího okna aplikace.

**Přechod:** „Přejdeme k útokům využívaným při phishingu - DNS spoofing.“

---

## 32. DNS spoofing

**Řekni:** „DNS spoofing (otrávení DNS cache) je podvržení DNS odpovědi. Útočník podvrhne falešný DNS záznam routeru nebo resolveru tak, že při zadání adresy `mojebanka.cz` vrátí IP adresu podvodného serveru útočníka. Uživatel zadá do prohlížeče správné jméno domény, ale ocitne se na falešném webu. Obranou je protokol DNSSEC a kontrola platnosti SSL/TLS certifikátu v prohlížeči.“

**Zapojení / ukázka:** Ukaž diagram na slajdu: Počítač posílá dotaz na IP banky, útočník podvrhne odpověď se svou vlastností IP adresou ještě dříve než pravý DNS server.

**Přechod:** „Posledním útokem z našeho přehledu je URL spoofing.“

---

## 33. URL spoofing

**Řekni:** „URL spoofing (Typosquatting) spoléhá na nepozornost a překlepy uživatelů. Útočník zaregistruje doménu, která vypadá téměř stejně jako originál - například zamění písmena (`goggle.com` místo `google.com`), zamění malé L za velké i (`dlscord.com` místo `discord.com`), nebo použije znaky z azbuky (`ib.airbaпk.cz`). Návštěvník si drobné změny nevšimne a zadá své údaje útočníkovi.“

**Zapojení / ukázka:** Ukaž příklady na slajdu a nechte studenty vyhledat rozdíly v uvedených názvech domén.

**Přechod:** „Tím jsme probrali celou prezentaci a dostáváme se k závěrečnému shrnutí.“

---

## 34. Závěr a shrnutí

**Řekni:** „Děkuji za pozornost! Dnes jsme zvládli velký přehled - od fyzických kabelů a síťových prvků přes IP adresaci, síťové vrstvy, porty a TCP/UDP protokoly až po základy síťové bezpečnosti a útoků. Tyto znalosti využijete odpoledne u služeb DHCP a DNS a v dalších dnech při praktické konfiguraci sítí.“

**Zapojení / ukázka:** Otevři prostor pro dotazy publiku: „Máte k dnešním tématům jakékoliv otázky nebo nejasnosti?“

**Přechod:** „Odpoledne navážeme 3. modulem: Základní služby DHCP a DNS.“

