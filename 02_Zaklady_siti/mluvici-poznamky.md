# Mluvené poznámky ke každému slajdu — Letní škola sítí: 2. Základy sítí

Scénář je psaný pro úplné začátečníky. Není potřeba učit se ho doslova. Text po značce **Řekni** můžeš použít skoro jako hotovou formulaci, **Zapojení / ukázka** říká, co máš udělat s publikem, a **Přechod** ti pomůže plynule navázat.

U schémat a vrstev vysvětli principy na přirozených příměrech (pošta, balíky, adresy domů).

## Doporučené tempo

- Slajdy 1–6: Co je internet, přenos dat a síťová zařízení, přibližně 30 minut.
- Slajdy 7–15: Adresace (IPv4/v6), síťové vrstvy, porty a protokoly (TCP vs UDP), přibližně 45 minut.
- Slajdy 16–26: Síťová bezpečnost, útoky (DoS/DDoS, MITM, SQLi, XSS, Spoofing) a nástroje, přibližně 45 minut.
- Slajd 27: Závěr a shrnutí, přibližně 5 minut.

---

## 1. Síťová bezpečnost

**Řekni:** „Vítám vás u bloku Základy sítí. Podíváme se na to, jak funguje internet, jak putují data mezi počítači a jaké hrozby v síti číhají.“

**Zapojení / ukázka:** Zeptej se: „Přemýšleli jste někdy, co všechno se musí stát během té milisekundy, než se vám načte Google?“

**Přechod:** „Začneme úplnými základy.“

## 2. Úvod a úplné základy

**Řekni:** Vysvětli téma "Úvod a úplné základy". Projdi jednotlivé body a koncepty. 

**Zapojení / ukázka:** Zeptej se publiku na příklad z praxe nebo předveď síťový nástroj v terminálu.

**Přechod:** Přejdeme k následujícímu slajdu.

## 3. Co je internet?

**Řekni:** „Internet je celosvětová síť propojených počítačů a serverů. Není to jedna věc na jednom místě, ale obrovská infrastruktura kabelů, optiky, směrovačů a bezdrátových spojů.“

**Zapojení / ukázka:** Ukaž mapu podmořských optických kabelů.

**Přechod:** „Jak se po této síti přenášejí data?“

## 4. Jak to funguje?

**Řekni:** Vysvětli téma "Jak to funguje?". Projdi jednotlivé body a koncepty. Přenos dat Připojení k serveru Adresace Porty a protokoly

**Zapojení / ukázka:** Zeptej se publiku na příklad z praxe nebo předveď síťový nástroj v terminálu.

**Přechod:** Přejdeme k následujícímu slajdu.

## 5. Přenos dat

**Řekni:** „Data necestují jako jeden velký soubor, ale rozsekají se na malé části zvané pakety. Každý paket má hlavičku s adresou odesílatele a příjemce.“

**Zapojení / ukázka:** Použij příměr s poštovními dopisy nebo balíčky.

**Přechod:** „Která fyzická zařízení tyto pakety směrují?“

## 6. Síťová zařízení

**Řekni:** „Mezi hlavní síťová zařízení patří Switche (přepínače na L2 vrstvě spojující zařízení v LAN) a Routery (směrovače na L3 vrstvě propojení různých sítí).“

**Zapojení / ukázka:** Ukaž fyzický router nebo switch v učebně.

**Přechod:** „Aby zařízení věděla, kam paket poslat, potřebují adresaci.“

## 7. Adresace, porty a protokoly

**Řekni:** Vysvětli téma "Adresace, porty a protokoly". Projdi jednotlivé body a koncepty. 

**Zapojení / ukázka:** Zeptej se publiku na příklad z praxe nebo předveď síťový nástroj v terminálu.

**Přechod:** Přejdeme k následujícímu slajdu.

## 8. Adresace a důležité pojmy

**Řekni:** Vysvětli téma "Adresace a důležité pojmy". Projdi jednotlivé body a koncepty. MAC adresa:48:2e:72:09:68:aa IP adresa a maska sítě; default gateway, síťová a broadcastová adresa. Statická vs. dynamická adresa; VPN.

**Zapojení / ukázka:** Zeptej se publiku na příklad z praxe nebo předveď síťový nástroj v terminálu.

**Přechod:** Přejdeme k následujícímu slajdu.

## 9. IPv4 a IPv6

**Řekni:** „IPv4 adresa má 32 bitů (např. 192.168.1.1). Protože IPv4 adresy došly, používáme IPv6 se 128 bity zapisovanou v hexadecimálním tvaru.“

**Zapojení / ukázka:** Nechte účastníky spustit `ip a` nebo `ifconfig` v terminálu.

**Přechod:** „Jak se organizují protokoly v síti?“

## 10. Síťové vrstvy

**Řekni:** „Protokoly dělíme do síťových vrstev (ISO/OSI model má 7 vrstev, TCP/IP model má 4 vrstvy). Každá vrstva řeší jinou část přenosu.“

**Zapojení / ukázka:** Vysvětli zapouzdření (encapsulation) od aplikační po fyzickou vrstvu.

**Přechod:** „Rozdíl mezi spolehlivým a rychlým přenosem je v TCP a UDP.“

## 11. Porty

**Řekni:** Vysvětli téma "Porty". Projdi jednotlivé body a koncepty. Logická adresa přidělená službě používající internet. Slouží ke směrování dat ke správné aplikaci. 20FTP ·22SSH ·23Telnet ·25SMTP ·53DNS ·80HTTP ·443HTTPS

**Zapojení / ukázka:** Zeptej se publiku na příklad z praxe nebo předveď síťový nástroj v terminálu.

**Přechod:** Přejdeme k následujícímu slajdu.

## 12. Protokoly

**Řekni:** Vysvětli téma "Protokoly". Projdi jednotlivé body a koncepty. Pravidla, podle kterých probíhá přenos dat. Určují formát a pořadí komunikace. Definují, jak zařízení reagují na chyby.

**Zapojení / ukázka:** Zeptej se publiku na příklad z praxe nebo předveď síťový nástroj v terminálu.

**Přechod:** Přejdeme k následujícímu slajdu.

## 13. TCP vs. UDP

**Řekni:** „TCP je spolehlivý protokol – zaručuje doručení a pořadí paketů (používá se pro web, e-mail, soubory). UDP je rychlý bez záruky doručení (používá se pro hry, videohovory, streamy).“

**Zapojení / ukázka:** Zeptej se: „Proč je pro online hry lepší UDP než TCP?“

**Přechod:** „Přejdeme k síťové bezpečnosti a útokům.“

## 14. Protokoly síťové vrstvy

**Řekni:** Vysvětli téma "Protokoly síťové vrstvy". Projdi jednotlivé body a koncepty. ARP— zjistí MAC adresu, když známe jen IP adresu. DHCP— automaticky nastavuje IP konfiguraci. DNS— převádí doménová jména a IP adresy.

**Zapojení / ukázka:** Zeptej se publiku na příklad z praxe nebo předveď síťový nástroj v terminálu.

**Přechod:** Přejdeme k následujícímu slajdu.

## 15. Protokoly aplikační vrstvy

**Řekni:** Vysvětli téma "Protokoly aplikační vrstvy". Projdi jednotlivé body a koncepty. Telnet a SSH FTP, SFTP a FTPS HTTP a HTTPS SMTP, POP3 a IMAP

**Zapojení / ukázka:** Zeptej se publiku na příklad z praxe nebo předveď síťový nástroj v terminálu.

**Přechod:** Přejdeme k následujícímu slajdu.

## 16. Síťová bezpečnost

**Řekni:** Vysvětli téma "Síťová bezpečnost". Projdi jednotlivé body a koncepty. 

**Zapojení / ukázka:** Zeptej se publiku na příklad z praxe nebo předveď síťový nástroj v terminálu.

**Přechod:** Přejdeme k následujícímu slajdu.

## 17. Základní síťové příkazy

**Řekni:** Vysvětli téma "Základní síťové příkazy". Projdi jednotlivé body a koncepty. 

**Zapojení / ukázka:** Zeptej se publiku na příklad z praxe nebo předveď síťový nástroj v terminálu.

**Přechod:** Přejdeme k následujícímu slajdu.

## 18. Nástroje síťové bezpečnosti

**Řekni:** Vysvětli téma "Nástroje síťové bezpečnosti". Projdi jednotlivé body a koncepty. nmap— skenování sítě Wireshark— analýza síťového provozu whois— OSINT a informace o doméně Packet Tracer— simulace síťového provozu

**Zapojení / ukázka:** Zeptej se publiku na příklad z praxe nebo předveď síťový nástroj v terminálu.

**Přechod:** Přejdeme k následujícímu slajdu.

## 19. Síťové útoky

**Řekni:** Vysvětli téma "Síťové útoky". Projdi jednotlivé body a koncepty. DoS a DDoS Man in the Middle SQL injection a XSS DNS spoofing a URL spoofing

**Zapojení / ukázka:** Zeptej se publiku na příklad z praxe nebo předveď síťový nástroj v terminálu.

**Přechod:** Přejdeme k následujícímu slajdu.

## 20. DoS vs. DDoS

**Řekni:** „DoS (Denial of Service) zahltí cíl z jednoho zdroje. DDoS (Distributed DoS) využívá botnet – tisíce ovládaných zařízení najednou zahltí server.“

**Zapojení / ukázka:** Ukaž graf datového toku při DDoS útoku.

**Přechod:** „Další nebezpečný útok je Man in the Middle.“

## 21. Man in the Middle

**Řekni:** Vysvětli téma "Man in the Middle". Projdi jednotlivé body a koncepty. Útočník se vloží mezi dvě komunikující strany a může provoz odposlouchávat nebo upravovat.

**Zapojení / ukázka:** Zeptej se publiku na příklad z praxe nebo předveď síťový nástroj v terminálu.

**Přechod:** Přejdeme k následujícímu slajdu.

## 22. SQL injection

**Řekni:** Vysvětli téma "SQL injection". Projdi jednotlivé body a koncepty. Vložení škodlivého kódu do databázového vstupu. Například:heslo' OR '1'='1 Při špatném ošetření vstupu může databáze vrátit citlivé informace.

**Zapojení / ukázka:** Zeptej se publiku na příklad z praxe nebo předveď síťový nástroj v terminálu.

**Přechod:** Přejdeme k následujícímu slajdu.

## 23. XSS

**Řekni:** Vysvětli téma "XSS". Projdi jednotlivé body a koncepty. Cross-site scripting: spuštění škodlivého skriptu na webu. Příklad:<script>alert('Toto je úspěšný XSS útok.');</script>

**Zapojení / ukázka:** Zeptej se publiku na příklad z praxe nebo předveď síťový nástroj v terminálu.

**Přechod:** Přejdeme k následujícímu slajdu.

## 24. XSS — praktická část

**Řekni:** Vysvětli téma "XSS — praktická část". Projdi jednotlivé body a koncepty. https://xss-game.appspot.com/

**Zapojení / ukázka:** Zeptej se publiku na příklad z praxe nebo předveď síťový nástroj v terminálu.

**Přechod:** Přejdeme k následujícímu slajdu.

## 25. DNS spoofing

**Řekni:** Vysvětli téma "DNS spoofing". Projdi jednotlivé body a koncepty. Úprava nebo podvržení DNS odpovědi, která uživatele přesměruje na falešnou stránku.

**Zapojení / ukázka:** Zeptej se publiku na příklad z praxe nebo předveď síťový nástroj v terminálu.

**Přechod:** Přejdeme k následujícímu slajdu.

## 26. URL spoofing

**Řekni:** Vysvětli téma "URL spoofing". Projdi jednotlivé body a koncepty. Útočník vlastní stránku s podobným názvem, která je škodlivá. google.com → goggle.com discord.com → dlscord.com ib.airbank.cz → ib.airbaпk.cz

**Zapojení / ukázka:** Zeptej se publiku na příklad z praxe nebo předveď síťový nástroj v terminálu.

**Přechod:** Přejdeme k následujícímu slajdu.

## 27. Děkuji

**Řekni:** „Děkuji za pozornost! Nyní znáte základy síťové adresace, modelů i bezpečnosti. Odpoledne navážeme službami DHCP a DNS.“

**Zapojení / ukázka:** Ptej se na závěrečné dotazy.

**Přechod:** „Přejdeme ke službám DHCP a DNS.“
