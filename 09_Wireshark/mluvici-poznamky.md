# Mluvené poznámky ke každému slajdu — Letní škola sítí: 9. Síťová analýza a Wireshark

Scénář je psaný pro lektory i účastníky na základě prezentace *Síťová Analýza*. Text po značce **Řekni** představuje výklad srozumitelným jazykem, **Zapojení / ukázka** uvádí praktické akce v učebně a **Přechod** pomáhá navázat na další slajd.

---

## 1. Titulní slajd — Síťová analýza & Wireshark

**Řekni:** „Vítám vás u modulu 9: Síťová analýza a Wireshark. Dnes si ukážeme, jak 'vidět pod pokličku' síťového provozu. Naučíme se odchytávat letící pakety na síťové kartě a analyzovat je v grafickém nástroji Wireshark.“

**Zapojení / ukázka:** Zeptejte se v učebně: „Kdo z vás už někdy viděl Wireshark nebo zkoušel odchytávat pakety v síti?“

**Přechod:** „Pojďme si vysvětlit základní princip odchytávání provozu.“

---

## 2. Odchytávání provozu (Traffic Capture)

**Řekni:** „Chceme-li analyzovat provoz v síti, musíme ho nejprve odchytit přímo na síťovém rozhraní (interfacu). Provoz se zapisuje do souborů s příponami `.pcap`, `.pcapng` nebo `.cap`. Pro konzolový odchyt se často používá nástroj `tcpdump`, zatímco pro lidsky přehlednou analýzu v grafickém rozhraní používáme Wireshark.“

**Zapojení / ukázka:** Zdůrazněte, že `tcpdump` zvládne zachytávat TCP i UDP provoz bez grafického prostředí.

**Přechod:** „Porovnejme si Wireshark s terminálovým nástrojem Tshark.“

---

## 3. Wireshark vs. Tshark

**Řekni:** „Wireshark je grafická aplikace dostupná na Windows, Linux i macOS. Nabízí maximální přehlednost, grafy a bohaté možnosti filtrů. Tshark (případně Termshark) je jeho terminálový bratr – je extrémně rychlý, lehký a ideální tam, kde nemáme k dispozici grafické rozhraní.“

**Zapojení / ukázka:** Ukažte porovnání na slajdu a snímek obrazovky terminálu Tshark.

**Přechod:** „Jak v Wiresharku spustíme odchytávání?“

---

## 4. Jak začít odchytávat v Wiresharku

**Řekni:** „Při spuštění Wiresharku nejprve vybereme rozhraní (např. `eth0` nebo `en0`), u kterého vidíme vlnění provozu. Kliknutím na modrou žraločí ploutev vlevo nahoře spustíme zachytávání. Zastavíme ho červeným čtverečkem. Pokud už pcap soubor máme, otevřeme ho přes menu `File -> Open`.“

**Zapojení / ukázka:** Ukažte tlačítko s modrou ploutví přímo na projektoru v běžícím Wiresharku.

**Přechod:** „Podívejme se na hlavní okno aplikace.“

---

## 5. Přehled rozhraní Wiresharku

**Řekni:** „Rozhraní Wiresharku se dělí na tři hlavní části: nahoře vidíme seznam všech odchycených paketů, uprostřed je anatomický rozpad vybraného paketu podle vrstev OSI modelu a dole vidíme syrová hexa data s ASCII náhledem.“

**Zapojení / ukázka:** Klikněte na jeden paket a ukažte studentům změnu ve všech třech částech okna.

**Přechod:** „Jak přesně Wireshark paket rozebere?“

---

## 6. Anatomie zachyceného paketu

**Řekni:** „Wireshark automaticky roztřídí paket do jednotlivých vrstev. Můžeme si rozkliknout Ethernet II vrstvu pro MAC adresy, IPv4 pro IP adresy a TTL, TCP/UDP vrstvu pro porty a vlajky a nakonec aplikační vrstvu pro samotná data.“

**Zapojení / ukázka:** Rozbalte v prostředním okně záložku `Internet Protocol Version 4` a ukažte IP adresy.

**Přechod:** „V tisících paketů se musíme umět vyznat. K tomu slouží filtry.“

---

## 7. Filtrování provozu (Display Filters)

**Řekni:** „Filtry zadáváme do zelené lišty nad seznamem paketů. Pokud chceme vidět jen komunikaci konkrétní IP, napíšeme `ip.addr == 192.168.0.2`. Používáme operátory `==`, `!=`, negaci `!` a logické spojky `&&` (a zároveň) či `||` (nebo).“

**Zapojení / ukázka:** Napište do filtrační lišty `ip.addr == ...` a ukažte, jak lišta zzelená při správném zápisu nebo zčervená při překlepu.

**Přechod:** „Podívejme se na jednotlivé protokoly, začneme s TCP.“

---

## 8. TCP komunikace & 3-Way Handshake

**Řekni:** „Většina důležité komunikace (HTTP, SSH, FTP) běží na spolehlivém protokolu TCP. Než se přenesou první data, musí proběhnout Three-Way Handshake: 1. `SYN` od klienta, 2. `SYN-ACK` od serveru a 3. `ACK` od klienta. Teprve pak spojení navázáno.“

**Zapojení / ukázka:** Ukažte v seznamu paketů tyto tři posloupné pakety se zobrazenými vlajkami `[SYN]`, `[SYN, ACK]`, `[ACK]`.

**Přechod:** „Jak se liší UDP provoz?“

---

## 9. UDP komunikace

**Řekni:** „UDP se používá tam, kde je přednější rychlost než garance doručení – například u streaming videa, hlasových hovorů (VoIP) nebo DNS. UDP nevytváří žádné podání ruky, prostě posílá pakety. Proto často v pcapu vidíme masivní proud UDP paketů.“

**Zapojení / ukázka:** Porovnejte hlavičku TCP paketu s mnohem jednodušší hlavičkou UDP paketu.

**Přechod:** „Podívejme se na webový protokol HTTP.“

---

## 10. HTTP & HTTPS komunikace

**Řekni:** „Dnes už většina webu běží na HTTPS, ale v pcapu nešifrovaného HTTP vidíme vše v čistém textu – příkazy `GET`, `POST`, cesty i odeslané formuláře. U HTTPS je veškerý provoz šifrovaný přes TLS a v pcapu vidíme jen nečitelné shluky dat.“

**Zapojení / ukázka:** Ukažte pravé tlačítko na HTTP paket -> `Follow -> TCP Stream` a ukažte kompletní přenesený text webové stránky.

**Přechod:** „Jak funguje přenos souborů přes FTP?“

---

## 11. Přenos souborů: FTP, TFTP, SFTP

**Řekni:** „FTP přenáší soubory i přihlašovací údaje zcela nešifrovaně. Wireshark dokonce umí přenášené soubory z nešifrovaného provozu (jako TFTP nebo HTTP) automaticky extrahovat přes menu `File -> Export Objects`. Naopak SFTP běží šifrovaně přes SSH a z pcapu soubor nezískat.“

**Zapojení / ukázka:** Předveďte funkci `File -> Export Objects -> HTTP / TFTP`.

**Přechod:** „Jak v síti vypadá přidělování IP adres přes DHCP?“

---

## 12. DHCP komunikace

**Řekni:** „DHCP slouží k automatickému nastavení IP adresy, masky a brány. V pcapu hledáme proces DORA: Discover (počítač se ptá), Offer (server nabízí), Request (počítač žádá) a Acknowledge (server potvrzuje). Rozlišujeme DHCPv4 pro IPv4 a DHCPv6 pro IPv6.“

**Zapojení / ukázka:** Vyfiltrujte v pcapu slovo `dhcp` nebo `bootp`.

**Přechod:** „Jak počítač zjišťuje fyzickou MAC adresu souseda?“

---

## 13. ARP komunikace (Address Resolution)

**Řekni:** „ARP protokol slouží k přeložení IP adresy na MAC adresu v lokální síti. Počítač pošle broadcast `ff:ff:ff:ff:ff:ff` s dotazem 'Kdo má tuto IP?'. Na switchích ARP provoz tvoří velkou část pozadí.“

**Zapojení / ukázka:** Vyfiltrujte v liště `arp` a ukažte dotazy typu *Who has 192.168.1.1? Tell 192.168.1.50*.

**Přechod:** „Porovnejme si vzdálený přístup: SSH vs Telnet.“

---

## 14. Vzdálená správa: SSH vs. Telnet

**Řekni:** „Telnet je historický protokol bez šifrování. Pokud se někdo připojuje přes Telnet, uvidíte v pcapu každou stisknutou klávesu i heslo v plain-textu! Proto vždy používáme SSH (SSHv2), které veškerý provoz bezpečně šifruje.“

**Zapojení / ukázka:** Ukažte v pcapu zachycené Telnet heslo přes `Follow TCP Stream`.

**Přechod:** „Nyní si to všichni vyzkoušíme v praktickém cvičení!“

---

## 15. Praktické cvičení

**Řekni:** „Stáhněte si ze stránek `file.marv.al/ws.zip` balíček vzorových pcapů. Otevřete je v Wiresharku, vyzkoušejte si filtry pro Telnet a HTTP, najděte zadané přihlašovací údaje a vyzkoušejte si vyexportovat přenesený soubor.“

**Zapojení / ukázka:** Obcházejte učebnu a pomáhejte studentům s otevíráním pcapů a psaním filtrů.
