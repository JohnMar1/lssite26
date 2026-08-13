# Mluvené poznámky ke každému slajdu — Letní škola sítí: 8. Programování sítí v Pythonu

Scénář je psaný pro lektory i účastníky. Text po značce **Řekni** představuje hotovou formulaci výkladu, **Zapojení / ukázka** uvádí praktické akce v učebně a **Přechod** pomáhá plynule navázat na další téma.

---

## 1. Titulní slajd — Programování sítí v Pythonu

**Řekni:** „Vítám vás u modulu 8: Programování sítí v Pythonu. Dnes se posuneme od pouhého používání hotových nástrojů jako ping nebo Nmap k tomu, že si vytvoříme své vlastní síťové skripty a utility. Naučíme se pracovat se síťovými sockety v Pythonu a vyzkoušíme si mocnou knihovnu Scapy pro nízkoúrovňovou tvorbu paketů.“

**Zapojení / ukázka:** Zeptejte se účastníků: „Kdo z vás už někdy psal v Pythonu nějaký skript? A zkoušeli jste někdy posílat data po síti?“

**Přechod:** „Pojďme si ukázat přehled hlavních témat, která dnes zvládne každý z vás naprogramovat.“

---

## 2. Co dnes probereme

**Řekni:** „Dnes projdeme 4 klíčové oblasti: Nejprve si vysvětlíme fungování socketů pro TCP a UDP komunikaci. Potom si napíšeme vlastní TCP Port Scanner a Banner Grabber. V třetí části objevíme knihovnu Scapy pro skládání vlastních paketů a nakonec si ukážeme, jak bezpečně tyto skripty spouštět a otestujeme je v praktickém cvičení.“

**Zapojení / ukázka:** Projděte jednotlivé body na slajdu a zdůrazněte, že ke všemu dostanou studenti funkční příklady.

**Přechod:** „Začneme první kategorií: Základy síťových socketů a knihovna `socket`.“

---

## 3. Kategorie 1: Základy síťových socketů a knihovna socket

**Řekni:** „V první části se podíváme na absolutní základ síťového programování – síťové sockety v operačním systému.“

**Zapojení / ukázka:** Zobrazte dělící slajd kategorie 1.

**Přechod:** „Co si pod pojmem socket vlastně představit?“

---

## 4. Co je to Socket?

**Řekni:** „Socket neboli zásuvka je softwarové rozhraní mezi vaší aplikací a síťovým zásobníkem operačního systému. Přes socket aplikace říká operačnímu systému: 'Vezmi tato data a pošli je na cíl'. Aby byl socket jednoznačný, skládá se z IP adresy, čísla portu a protokolu. V Pythonu máme štěstí, protože knihovna `socket` je přímo součástí standardní instalace.“

**Zapojení / ukázka:** Přirovnejte socket k telefonní zásuvce na zdi nebo ke kombinaci telefoniho čísla (IP) a linky/klapky (Port).

**Přechod:** „Jaké dva základní typy socketů budeme rozlišovat?“

---

## 5. Typy socketů (TCP vs UDP)

**Řekni:** „Při vytváření socketu volíme transportní protokol. TCP socket vytvoříme pomocí konstanty `SOCK_STREAM`. Ten zaručuje spojení, doručení dat ve správném pořadí a používá se pro web nebo SSH. Naopak UDP socket vytvoříme pomocí `SOCK_DGRAM`. Ten posílá pakety 'vystřel a zapomeň' bez garance doručení, což je extrémně rychlé a ideální pro DNS nebo streamování.“

**Zapojení / ukázka:** Ukažte na slajdu vizuální rozdělení mezi modrou (TCP) a oranžovou (UDP) kartou.

**Přechod:** „Pojďme napsat náš první kód: TCP klient v Pythonu.“

---

## 6. Vytvoření TCP Klienta

**Řekni:** „Na tomto slajdu vidíte kompletní kód pro TCP klienta. Vytvoříme socket s rodinou `AF_INET` a typem `SOCK_STREAM`. Připojíme se funkcí `connect()`, odešleme data v bajtech metodou `sendall()` a přečteme odpověď pomocí `recv()`. Na závěr socket nezapomeneme zavřít přes `close()`.“

**Zapojení / ukázka:** Nechte studenty otevřít terminál nebo VS Code / PyCharm a kód společně s vámi spustit proti např. `example.com` na portu 80.

**Přechod:** „Nyní když víme, jak psát klienta, pojďme si vytvořit vlastní TCP server.“

---

## 7. Vytvoření TCP Serveru

**Řekni:** „Server funguje trochu jinak: Používá `bind()` k navázání na IP adresu (např. `0.0.0.0` pro všechna rozhraní) a port. Funkce `listen()` zapne naslouchání a `accept()` čeká na příchozího klienta. Volání `accept()` vrátí nový socket pro komunikaci s klientem a jeho adresu. V nekonečné smyčce pak přijímáme zprávy a odpovídáme.“

**Zapojení / ukázka:** Spusťte tento server v jednom okně terminálu a ve druhém okně se k němu připojte pomocí `nc 127.0.0.1 9999` nebo dříve napsaného Python klienta.

**Přechod:** „Ukažme si rozdíl při práci s UDP sockety.“

---

## 8. Práce s UDP Sockets

**Řekni:** „U UDP socketů nenavazujeme trvalé spojení. Nepovolává se `connect()` ani `accept()`. Místo toho rovnou voláme `sendto()`, kde specifikujeme cíl při každém odeslání. Pro příjem používáme `recvfrom()`, což nám vrátí nejen přijatá data, ale i IP a port odesílatele.“

**Zapojení / ukázka:** Zvýrazněte v kódu odlišnost metod `sendto` a `recvfrom`.

**Přechod:** „Co když se vzdálený počítač neodpojí nebo neodpovídá?“

---

## 9. Ošetření chyb a timeouty

**Řekni:** „V reálné síti se stává, že server neodpovídá nebo je port filtrován firewallem. V takovém případě by kód bez timeoutu zamrznul na neomezenou dobu. Metoda `settimeout(2.0)` nastaví maximální dobu čekání. Pokud do dvou sekund nepřijde odpověď, Python vyhodí výjimku `socket.timeout`, kterou snadno zachytíme v bloku `try-except`.“

**Zapojení / ukázka:** Zkuste se v živé ukázce připojit s nastaveným timeoutem 1s na IP adresu v síti, která neexistuje (např. 10.255.255.1).

**Přechod:** „Máme pevné základy! Přejděme ke druhé kategorii: Tvorba vlastních síťových nástrojů.“

---

## 10. Kategorie 2: Tvorba vlastních síťových nástrojů

**Řekni:** „Ve druhé části využijeme nabyté znalosti socketů a vytvoříme si dva užitečné nástroje: Port Scanner a Banner Grabber.“

**Zapojení / ukázka:** Zobrazte dělící slajd kategorie 2.

**Přechod:** „Prvním nástrojem bude váš vlastní skener portů.“

---

## 11. Nástroj 1: Jednoduchý TCP Port Scanner

**Řekni:** „Místo standardního `connect()`, které vyvolává výjimku při neúspěchu, použijeme metodu `connect_ex()`. Tato metoda vrací číselný kód. Pokud vrátí `0`, spojení proběhlo úspěšně a port je otevřený. Jakékoliv jiné číslo znamená, že port je zavřený nebo filtrovaný.“

**Zapojení / ukázka:** Nechte studenty otestovat tento skript na jejich lokálním počítači (`127.0.0.1`).

**Přechod:** „Jednovláknový sken 1000 portů trvá dlouho. Jak ho výrazně zrychlit?“

---

## 12. Zrychlení scanneru: Vícevláknové skenování

**Řekni:** „Místo testování jednoho portu po druhém použijeme modul `concurrent.futures.ThreadPoolExecutor`. Vytvoříme bazén 50 vláken, která skenují porty paralelně. Díky tomu sken celého rozsahu 1–1024 zabere místo několika minut jen pár sekund!“

**Zapojení / ukázka:** Porovnejte rychlost jednoduchého smyčkového skeneru s vícevláknovým přímo na projektoru.

**Přechod:** „Více než jen vědět, že je port otevřený, nás často zajímá, co na něm běží. K tomu slouží Banner Grabber.“

---

## 13. Nástroj 2: Banner Grabber

**Řekni:** „Banner grabbing je technika, při které se připojíme k otevřenému portu a přečteme úvodní textovou zprávu (banner), kterou služba odesílá. Služby jako SSH nebo FTP po připojení samy odeslou svou verzi. Pro webové servery na portu 80 pošleme krátký požadavek `HEAD / HTTP/1.1` a přečteme hlavičku `Server:`.“

**Zapojení / ukázka:** Spusťte funkci `grab_banner` na portu 22 lokalního systému a ukažte získaný řetězec jako `SSH-2.0-OpenSSH...`.

**Přechod:** „Ukážeme si ještě obousměrný Echo Server.“

---

## 14. Nástroj 3: Echo Server s obsluhou klientů

**Řekni:** „Echo server je klasický koncept: cokoliv klient pošle, server přijme a pošle zpět s předponou `ECHO:`. Kód na slajdu ukazuje použití jednoduché smyčky s podmínkou pro ukončení příkazem `exit`.“

**Zapojení / ukázka:** Ukažte testování echo serveru v terminálu.

**Přechod:** „Nyní opustíme standardní sockety a ponoříme se do nízkoúrovňového světa paketů s knihovnou Scapy.“

---

## 15. Kategorie 3: Nízkoúrovňový přístup a tvorba paketů v knihovně Scapy

**Řekni:** „V třetí části objevíte jeden z nejmocnějších nástrojů pro síťové inženýry a bezpečnostní experty v Pythonu – knihovnu Scapy.“

**Zapojení / ukázka:** Zobrazte dělící slajd kategorie 3.

**Přechod:** „Co to vlastně Scapy je a v čem se liší od běžných socketů?“

---

## 16. Co je to Scapy?

**Řekni:** „Běžné sockety vám neumožní měnit IP hlavičku ani Ethernetový rámec – operační systém to dělá za vás. Scapy naproti tomu umožňuje nízkoúrovňově zkonstruovat jakýkoliv paket na libovolné vrstvě OSI modelu. Můžete libovolně nastavovat IP adresy, TCP vlajky (SYN, ACK, FIN), nebo generovat neplatné pakety pro testování odolnosti systémů.“

**Zapojení / ukázka:** Vysvětlete, že Scapy umí nahradit nástroje jako ping, hping3, tcpdump i arping.

**Přechod:** „Podívejme se na geniální syntaxi skládání paketů v Scapy.“

---

## 17. Skládání paketů v Scapy

**Řekni:** „Scapy používá operátor lomenítka `/` pro vrstvení protokolů nad sebe. Můžete napsat `Ether() / IP(dst="1.1.1.1") / TCP(dport=80, flags="S")`. Tím vytvoříte kompletní TCP SYN paket zabalený v IP a Ethernet vrstvě. Metoda `.show()` vám vytiskne nádherný rozpad všech polí hlaviček.“

**Zapojení / ukázka:** Předveďte interaktivní konzoli Scapy (`sudo scapy`) a vytvořte živě jeden paket s příkazem `pkt.show()`.

**Přechod:** „Jak takové vytvořené pakety odesíláme do sítě?“

---

## 18. Odesílání a příjem paketů v Scapy

**Řekni:** „V Scapy máme dvě rodiny funkcí: funkce bez přijmu (např. `send` pro L3 a `sendp` pro L2) a funkce s čekáním na odpověď. Klíčová je funkce `sr1()`, která odesle paket a vrátí první přijatou odpověď. Pro Ethernetové rámce (L2) používáme analogicky `srp()`.“

**Zapojení / ukázka:** Zdůrazněte rozdíl mezi L2 (Ethernet, `sendp`/`srp`) a L3 (IP, `send`/`sr`/`sr1`).

**Přechod:** „Napišme si v Scapy náš vlastní ICMP Ping.“

---

## 19. Nástroj 4: Vlastní ICMP Ping v Scapy

**Řekni:** „Kód pro ICMP Ping zabere v Scapy pouhých 5 řádků. Vytvoříme paket `IP(dst=target) / ICMP()` a zavoláme `sr1(pkt, timeout=2)`. Pokud odpověď přišla, vytiskneme hodinu TTL odpovědi, jinak ohlásíme timeout.“

**Zapojení / ukázka:** Spusťte skript v terminálu pod `sudo` a ukažte odpověď z IP `8.8.8.8`.

**Přechod:** „Pojďme si vytvořit ještě pokročilejší nástroj: ARP Scanner lokální sítě.“

---

## 20. Nástroj 5: ARP Scanner (Objevení zařízení v LAN)

**Řekni:** „ARP scanner slouží k odhalení všech aktivních IP a MAC adres v lokální síti. Vytvoříme ARP dotaz `ARP(pdst=ip_range)` a obalíme ho do Ethernetového broadcastu s cílovou MAC `ff:ff:ff:ff:ff:ff`. Pomocí `srp()` odesleme rámec a projdeme všechny přijaté odpovědi.“

**Zapojení / ukázka:** Spusťte ARP skener pro vaši školní síť (např. `192.168.1.0/24`) a ukažte tabulku nalezených zažízení.

**Přechod:** „Posledním nástrojem z rodiny Scapy bude vlastní Paketový Sniffer.“

---

## 21. Nástroj 6: Paketový Sniffer

**Řekni:** „Funkce `sniff()` v Scapy umožňuje odchytávat živý síťový provoz na síťové kartě. Jako parametr `prn` předáváme náš callback, který se zavolá pro každý odchycený paket. Můžeme v něm přistupovat k jednotlivým vrstvám jako `packet[IP].src` nebo `packet[TCP].dport` a filtrovat provoz pomocí BPF syntaxe jako v tcpdumpu.“

**Zapojení / ukázka:** Spusťte sniffer na 10 paketů a vygenerujte v druhém okně provoz (např. vyhledáním v prohlížeči).

**Přechod:** „Přejděme k závěrečné kategorii: Doporučené postupy, bezpečnost a samostatné cvičení.“

---

## 22. Kategorie 4: Doporučené postupy, bezpečnost a cvičení

**Řekni:** „V poslední části si probereme správu oprávnění v Linuxu, etická pravidla síťového vývoje a zadáme si samostatný úkol.“

**Zapojení / ukázka:** Zobrazte dělící slajd kategorie 4.

**Přechod:** „Proč jsme dnes museli používat příkaz `sudo`?“

---

## 23. Práva v Linuxu: Sudo / Root

**Řekni:** „Vytváření raw socketů a přímý přístup k síťovému rozhraní v knihovně Scapy vyžaduje v Linuxu rootovská práva (kapabilitu `CAP_NET_RAW`). Proto všechny skripty využívající Scapy nebo raw sockety spouštíme s příkazem `sudo python3 skript.py`. Pokud používáte virtuální prostředí, nezapomeňte předat cestu k cíl Python interpretu ve venvu.“

**Zapojení / ukázka:** Ukažte chybovou hlášku Permission Denied, pokud spustíte Scapy skript bez `sudo`.

**Přechod:** „Pojďme si zdůraznit etické hranice.“

---

## 24. Etické zásady a bezpečnost

**Řekni:** „Mějte na paměti, že skenování portů, injektování paketů nebo sniffing na cizích sítích bez výslovného souhlasu vlastníka je protiprávní. Nástroje, které jsme si dnes ukázali, zkoušejte výhradně na `localhost`, na svých vlastních zařízeních nebo v izolované Docker síti.“

**Zapojení / ukázka:** Projděte zelenou (doporučení) a oranžovou (varování) kartu na slajdu.

**Přechod:** „Nyní je čas si vše vyzkoušet na vlastní kůži v samostatném cvičení!“

---

## 25. Samostatné mini-cvičení

**Řekni:** „Vaším úkolem je vytvořit skript `my_scanner.py`, který přijme IP adresu, otestuje porty 22, 80 a 443 a u otevřených portů se pokusí stáhnout banner. Kdo bude mít hotovo, může vyzkoušet bonusovou výzvu se Scapy a poslat SYN paket na port 80.“

**Zapojení / ukázka:** Obcházejte učebnu, pomáhejte studentům s kódováním a řešte případné syntaxe či výjimky.

**Přechod:** „Pojďme si na závěr shrnout nejdůležitější body dnešní lekce.“

---

## 26. Co si zapamatovat

**Řekni:** „Dnes jsme se naučili: `socket` je standardní modul pro TCP a UDP spojení, `connect_ex()` elegantně vrací stav portu bez chybových výjimek, `Scapy` nám dává absolutní svobodu při skládání paketů pomocí operátoru `/` a funkce `sniff()` a `srp()` umožňují odchytávání a ARP skenování.“

**Zapojení / ukázka:** Poděkujte všem za pozornost a zodpovězte případné dotazy.
