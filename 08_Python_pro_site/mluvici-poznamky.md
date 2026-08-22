# Mluvené poznámky ke každému slajdu - Letní škola sítí: 8. Python pro sítě (Základy pro začátečníky)

Scénář je psaný pro lektory vyučující úplné začátečníky v programování. Text po značce **Řekni** představuje výklad srozumitelným jazykem bez složité hantýrky, **Zapojení / ukázka** uvádí praktické akce v učebně a **Přechod** pomáhá navázat na další slajd.

---

## 1. Titulní slajd - Python pro sítě

**Řekni:** „Vítám vás u modulu 8. Dnes si ukážeme, jak nám Python pomůže při práci se sítěmi. Pokud jste v Pythonu nikdy neprogramovali, nemějte vůbec strach. Vše si vysvětlíme od úplného základu krok za krokem.“

**Zapojení / ukázka:** Ubezpečte účastníky v třídě: „Kdo z vás píše v Pythonu poprvé? Dnešek je koncipovaný přesně pro vás.“

**Přechod:** „Pojďme si říct, proč se vlastně Python učíme.“

---

## 2. Nebojte se Pythonu!

**Řekni:** „Cílem dneška není udělat z vás softwarové vývojáře. Chceme z Pythonu udělat náš síťový švýcarský nůž - jednoduchý nástroj, kterým si ověříme funkčnost portu nebo zkontrolujeme síť, když standardní příkazy nestačí.“

**Zapojení / ukázka:** Ukažte na projektoru otevřené okno terminálu s Pythonem.

**Přechod:** „Co konkrétně si dnes sami napíšete?“

---

## 3. Co si dnes vyzkoušíme?

**Řekni:** „Projdeme si pět malých kroků: Nejprve si ukážeme 4 základní příkazy v Pythonu. Pak si vysvětlíme síťové sockety, napíšeme si Port Scanner, Banner Grabber a nakonec si složíme vlastní paket v nástroji Scapy.“

**Zapojení / ukázka:** Projděte body agendy na slajdu.

**Přechod:** „Začneme první kategorií: Rychlé minimum z Pythonu pro síťaře.“

---

## 4. Kategorie 1: Rychlé minimum z Pythonu pro síťaře

**Řekni:** „Než začneme posílat data po síti, ukažme si čtyři úplné základy Pythonu: proměnné, texty, podmínky a cykly.“

**Zapojení / ukázka:** Zobrazte dělící slajd kategorie 1.

**Přechod:** „Prvním pojmem je proměnná.“

---

## 5. Proměnné: Uložení údajů

**Řekni:** „Proměnná je v podstatě pojmenovaná krabička v paměti počítače. Když napíšeme `ip_adresa = "192.168.1.1"`, uložíme si text do krabičky s názvem `ip_adresa`. Příkazem `print()` ji pak vytiskneme na obrazovku.“

**Zapojení / ukázka:** Nechte studenty otevřít Python v terminálu (příkaz `python3`) a zkusit si zadat tyto dva řádky.

**Přechod:** „Při práci se sítěmi je extrémně důležitý rozdíl mezi textem a bajty.“

---

## 6. Text vs. Bajty (Strings vs Bytes)

**Řekni:** „Síťové karty neumí posílat lidský text, rozumí pouze čistým bajtům. V Pythonu vytvoříme bajty tak, že před uvozovky přidáme písmeno `b`, například `b"Ahoj"`. Pokud máme obyčejný text, převedeme ho na bajty pomocí `.encode()`.“

**Zapojení / ukázka:** Zdůrazněte uvozovky s předponou `b"..."` na tabuli.

**Přechod:** „Jak přimějeme počítač, aby se rozhodoval?“

---

## 7. Podmínka: Rozhodování v kódu

**Řekni:** „Podmínka `if` říká počítači: 'Pokud platí toto, udělej akci A, jinak udělej akci B'. Všimněte si odsazení (mezer) na začátku řádku pod `if` - v Pythonu tím určujeme, co patří dovnitř podmínky.“

**Zapojení / ukázka:** Poukažte na tabulátor / 4 mezerové odsazení u příkazů `print`.

**Přechod:** „Co když chceme stejnou akci zopakovat pro více portů?“

---

## 8. Cyklus: Opakování činnosti

**Řekni:** „Cyklus `for` slouží k opakování. Místo abychom psali kód třikrát pro porty 22, 80 a 443, dáme čísla do hranatých závorek (seznamu) a cyklus `for p in porty:` projde všechna čísla jedno po druhém.“

**Zapojení / ukázka:** Ukažte v konzoli, jak cyklus vytiskne všechna tři čísla portů pod sebe.

**Přechod:** „Základy Pythonu máme za sebou! Pojďme na síťové sockety.“

---

## 9. Kategorie 2: Co je to Socket a jak funguje spojení

**Řekni:** „Ve druhé části se naučíme propojit dva počítače pomocí síťového socketu.“

**Zapojení / ukázka:** Zobrazte dělící slajd kategorie 2.

**Přechod:** „Představme si socket na reálném příkladu.“

---

## 10. Co je to Socket?

**Řekni:** „Socket si představte jako telefonní přístroj. Abychom se někomu dovolali, potřebujeme jeho telefonní číslo (v síti je to IP adresa) a klapku v budově (to je číslo portu). Když máme obojí, vytvoříme socket a zvedneme sluchátko.“

**Zapojení / ukázka:** Zeptejte se studentů: „Jaké porty už znáte z předchozích lekcí?“ (např. 80 pro HTTP, 22 pro SSH).

**Přechod:** „Jak načteme síťové funkce do Pythonu?“

---

## 11. Importujeme knihovnu socket

**Řekni:** „Python obsahuje obrovské množství užitečných modulů. Síťový modul se jmenuje `socket`. Na začátek skriptu stačí napsat `import socket` a tím zpřístupníme všechny síťové funkce.“

**Zapojení / ukázka:** Ukažte napsání `import socket` v editoru.

**Přechod:** „Nyní si v kódu vyrobíme náš první socket.“

---

## 12. Krok 1: Vytvoření socketu

**Řekni:** „Zavoláním `socket.socket(socket.AF_INET, socket.SOCK_STREAM)` vyrobíme nový socket. Konstanty `AF_INET` říkají, že chceme IPv4 adresy, a `SOCK_STREAM` znamená spojovaný protokol TCP.“

**Zapojení / ukázka:** Vysvětlete, že pro běžnou komunikaci budeme téměř vždy používat tyto dva parametry.

**Přechod:** „Socket máme vytvořený. Jak se připojíme k serveru?“

---

## 13. Krok 2: Připojení k cíli

**Řekni:** „K připojení slouží funkce `connect()`. Do závorek jí předáme dvojici v kulatých závorkách: doménové jméno nebo IP adresu a číslo portu. Například `("example.com", 80)`.“

**Zapojení / ukázka:** Ukažte správný zápis dvojitých závorek `(("example.com", 80))`.

**Přechod:** „Jsme připojeni! Jak odešleme zprávu?“

---

## 14. Krok 3: Odeslání zprávy

**Řekni:** „Zprávu odešleme metodou `sendall()`. Nezapomeňte, že text musíme poslat jako bajty, proto před uvozovky píšeme písmeno `b"..."`. Posíláme standardní požadavkový řádek HTTP protokolu.“

**Zapojení / ukázka:** Zdůrazněte znaky `\r\n` jako odřádkování v HTTP protokolu.

**Přechod:** „Po odeslání požadavku chceme přečíst odpověď serveru.“

---

## 15. Krok 4: Přijetí odpovědi a zavření

**Řekni:** „Metoda `recv(1024)` počká na odpověď od serveru a přečte maximálně 1024 bajtů. Odpověď převedeme zpět na text pomocí `.decode()` a vytiskneme. Na úplný závěr socket zavřeme metodou `close()`.“

**Zapojení / ukázka:** Přironejte `close()` k zavěšení telefonního sluchátka po dokončení hovoru.

**Přechod:** „Pojďme si spojit všechny 4 kroky do jednoho přehledného skriptu.“

---

## 16. Shrnutí TCP Klienta

**Řekni:** „Zde vidíte kompletní funkční kód v 6 krátkých řádcích. Vytvoříme socket, připojíme se, odešleme dotaz, přečteme odpověď a zavřeme spojení. To je celý základ síťového klienta!“

**Zapojení / ukázka:** Nechte studenty tento skript spustit a ověřit, že dostanou odpověď ze serveru `example.com`.

**Přechod:** „Víme, jak píše klient. Jak funguje server na druhé straně?“

---

## 17. A co TCP Server?

**Řekni:** „Zatímco klient volá ven, server sedí a naslouchá. Dělá tři věci: přes `bind()` obsadí port na našem počítači, přes `listen()` zapne přijímač a přes `accept()` počká, až se nějaký klient připojí.“

**Zapojení / ukázka:** Přirovnejte `accept()` k vrátnému, který čeká u dveří, až někdo zazvoní.

**Přechod:** „Ukažme si krátký kód serveru.“

---

## 18. Ukázka jednoduchého serveru

**Řekni:** „Tento server naslouchá na portu 9999. Když se k němu připojíme, vytiskne IP adresu klienta, pošle mu uvitací zprávu 'Vitej na mem serveru!' a spojení ukončí.“

**Zapojení / ukázka:** Spusťte server a nechte studenty se k vám připojit pomocí příkazu `nc <vaše-IP> 9999`.

**Přechod:** „Přejděme ke třetí kategorii: Tvorba vlastního Port Scanneru.“

---

## 19. Kategorie 3: Stavíme vlastní Port Scanner a Banner Grabber

**Řekni:** „Ve třetí části si napíšeme skript, který zkontroluje, které porty na cílovém počítači jsou otevřené.“

**Zapojení / ukázka:** Zobrazte dělící slajd kategorie 3.

**Přechod:** „Jak vlastně port scanner funguje?“

---

## 20. Co dělá Port Scanner?

**Řekni:** „Port scanner nedělá nic složitého - jednoduše zkouší postupné připojení na různé porty. Pokud se spojení podaří, prohlásí port za otevřený.“

**Zapojení / ukázka:** Přirovnejte to k obcházení domu a zkoušení, které dveře a okna jsou odemknuté.

**Přechod:** „Běžné `connect()` by nám při zavřeném portu spadlo. Co s tím?“

---

## 21. Kouzelná funkce: connect_ex()

**Řekni:** „Místo běžného `connect()` použijeme funkci `connect_ex()`. Tato funkce při chybě nespadne, ale vrátí číslo. Pokud vrátí přesně číslo `0`, znamená to, že spojení bylo úspěšné a port je OTEVŘENÝ.“

**Zapojení / ukázka:** Napište číslo `0 = OTEVŘENO` výrazně na tabuli.

**Přechod:** „Otestujme si jeden konkrétní port.“

---

## 22. Test jednoho portu

**Řekni:** „Zde je kód pro test portu 80 na lokálním počítači `127.0.0.1`. Pokud `connect_ex()` vrátí `0`, vytiskneme, že port je otevřený. V opačném případě napíšeme, že je zavřený.“

**Zapojení / ukázka:** Spusťte kód na projektoru.

**Přechod:** „Co když testujeme IP adresu, která v síti vůbec neexistuje?“

---

## 23. Pozor na zamrznutí! (Timeout)

**Řekni:** „Pokud cíl neodpovídá, Python by mohl čekat desítky sekund. Proto přidáme řádek `s.settimeout(1.0)`. Tím skriptu přikážeme: 'Pokud do 1 sekundy neobdržíš odpoveď, vzdaj to a pokračuj dál'.“

**Zapojení / ukázka:** Ukažte umístění řádku `settimeout` hned pod vytvořením socketu.

**Přechod:** „Nyní spojíme testování s cyklem a zkontrolujeme více portů naráz.“

---

## 24. Port Scanner pro více portů

**Řekni:** „Nyní máme hotový náš vlastní Port Scanner! Procházíme seznam portů `[21, 22, 80, 443, 8080]` a pro každý port zkusíme připojení s limitujícím časem 0.5 sekundy. Otevřené porty přehledně vypíšeme.“

**Zapojení / ukázka:** Nechte studenty upravit seznam portů a otestovat skript proti jejich vlastním službám.

**Přechod:** „Když víme, že je port otevřený, jak zjistíme, co na něm běží?“

---

## 25. Nástroj 2: Banner Grabber

**Řekni:** „Banner grabber slouží k přečtení uvodního textu (banneru), který služba po připojení odesle. Například SSH server hned po připojení napíše svou přesnou verzi.“

**Zapojení / ukázka:** Vysvětlete užitečnost zjišťování verzí při auditu bezpečnosti.

**Přechod:** „Podívejme se na kód Banner Grabberu.“

---

## 26. Kód pro Banner Grabber

**Řekni:** „Připojíme se na port 22 a zavoláme `s.recv(100)`. Načtené bajty převedeme na text a vytiskneme. Ihned vidíme např. `SSH-2.0-OpenSSH_8.9`.“

**Zapojení / ukázka:** Vyzkoušejte v učebně připojení na port 22 vaší linuxové mašiny.

**Přechod:** „Opusťme sockety a podívejme se na stavebnici paketů Scapy v kategorii 4.“

---

## 27. Kategorie 4: Hrajeme si s pakety v knihovně Scapy

**Řekni:** „Ve čtvrté části se seznámíme s knihovnou Scapy, která nám umožní tvořit pakety jako stavebnici LEGO.“

**Zapojení / ukázka:** Zobrazte dělící slajd kategorie 4.

**Přechod:** „Proč je Scapy tak oblíbené?“

---

## 28. Co je to Scapy?

**Řekni:** „Běžné sockety za nás schovávají síťové hlavičky. Scapy nám naopak dává plnou kontrolu nad každou vrstvou paketu. Můžeme si sami nastavit IP adresy, typy paketů nebo vlajky.“

**Zapojení / ukázka:** Přirovnejte Scapy k rozložení paketu na jednotlivé LEGO kostky.

**Přechod:** „Jak se pakety v Scapy skládají?“

---

## 29. Skládání paketů v Scapy

**Řekni:** „V Scapy používáme pro spojování vrstev znak lomítka `/`. Když napíšeme `IP(dst="8.8.8.8") / ICMP()`, vezmeme IP vrstvu mířící na Google DNS a dáme do ní ICMP dotaz na Ping.“

**Zapojení / ukázka:** Zdůrazněte intuitivní zápis pomocí lomítka `/`.

**Přechod:** „Jak tento složený paket pošleme do sítě?“

---

## 30. Jak paket odeslat a počkat na odpověď?

**Řekni:** „Funkce `sr1()` odešle paket a počká na první odpověď. V proměnné `odpoved` pak máme kompletní přijatý paket a můžeme si přečíst např. jeho hodnotu TTL.“

**Zapojení / ukázka:** Spusťte tento příkaz v terminálu pod `sudo`.

**Přechod:** „Jak zjistíme, jaké IP a MAC adresy jsou kolem nás v lokální síti?“

---

## 31. Jak najít sousedy v síti? (ARP Scanner)

**Řekni:** „Pomocí ARP dotazu pošleme do celé sítě dotaz: 'Kdo tu je?'. Vytvoříme Ethernetový paket s všesměrovou MAC adresou `ff:ff:ff:ff:ff:ff` a v cyklu vypíšeme odpovídající IP a MAC adresy všech sousedů.“

**Zapojení / ukázka:** Ukažte seznam nalezených IP adres v učebně.

**Přechod:** „Ukažme si ještě, jak pakety odchytávat.“

---

## 32. Odchytávání paketů (Sniffer)

**Řekni:** „Funkce `sniff()` funguje jako malý Wireshark v Pythonu. Parametr `count=5` říká, že chceme odchytit 5 paketů, a pro každý paket se zavolá naše funkce `ukaz_paket()`, která vytiskne jeho stručné shrnutí.“

**Zapojení / ukázka:** Spusťte sniffer na projektoru a v druhém okně načtěte libovolný web.

**Přechod:** „Přejděme k závěrečné kategorii: Práva, bezpečnost a cvičení.“

---

## 33. Kategorie 5: Práva v Linuxu, bezpečnost a cvičení

**Řekni:** „V poslední části si vysvětlíme, proč potřebujeme správcovská práva, a vyzkoušíte si samostatný úkol.“

**Zapojení / ukázka:** Zobrazte dělící slajd kategorie 5.

**Přechod:** „Proč nám Scapy bez `sudo` napíše chybu?“

---

## 34. Důležité: Práva root (Sudo)

**Řekni:** „Operační systém chrání síťovou kartu před zneužitím. Vytvářet vlastní pakety v Scapy smí pouze správce (root). Proto skripty s knihovnou Scapy spouštíme v Linuxu s příkazem `sudo python3 skript.py`.“

**Zapojení / ukázka:** Předveďte chybové hlášení při spuštění bez `sudo` a následně úspěšný běh se `sudo`.

**Přechod:** „Připomeňme si pravidla etického chování.“

---

## 35. Zlatá pravidla síťového vývoje

**Řekni:** „Vždy paměťte na to, že skenovat a testovat smíme pouze své vlastní počítače (`127.0.0.1`) nebo sítě, kde máme výslovné svolení. Skenování cizích serverů v internetu je nelegální.“

**Zapojení / ukázka:** Zopakujte důležitost etického přístupu v kybernetické bezpečnosti.

**Přechod:** „Nyní je řada na vás v samostatném cvičení!“

---

## 36. Dnešní praktický úkol

**Řekni:** „Otevřete si textový editor a vytvořte soubor `scanner.py`. Napište jednoduchý skript, který zkontroluje porty 22 a 80 na adrese `127.0.0.1` a vytiskne výsledek. Pokud budete mít hotovo, zkuste stáhnout Banner portu 22!“

**Zapojení / ukázka:** Obcházejte učebnu a pomáhejte účastníkům s prvním psaním kódu a opravou případných překlepů.

**Přechod:** „Pojďme si na závěr shrnout to nejdůležitější.“

---

## 37. Co si z dneška odnést

**Řekni:** „Dnes jste zvládli obrovský krok: `socket` vám umožnil spojit dva počítače, `connect_ex() == 0` ověřil otevřený port a v `Scapy` jste si složili vlastní pakety. Python je váš nový nejlepší pomocník pro správu sítí!“

**Zapojení / ukázka:** Poděkujte všem za pozornost a zodpovězte dotazy studentů.
