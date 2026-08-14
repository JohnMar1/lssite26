# Mluvené poznámky ke každému slajdu — Letní škola sítí: 11. Návod na CTF a závěrečná soutěž (CTFd na https://dork.cz)

Scénář je psaný pro úplné začátečníky. Není potřeba učit se ho doslova. Text po značce **Řekni** můžeš použít skoro jako hotovou formulaci, **Zapojení / ukázka** říká, co máš udělat s publikem, a **Přechod** ti pomůže plynule navázat.

## Doporučené tempo

- Slajd 1–3 (Úvod, Harmonogram & Vlajka `LS{...}`): přibližně 10 minut (09:00–09:10).
- Slajd 4–5 (Registrace a Týmy na dork.cz): přibližně 5 minut.
- Slajd 6–9 (Přehled úloh, Dočasné stroje & Minecraft): přibližně 15 minut.
- Slajd 10–12 (Pravidla bezpečnosti `/lab` & Jak postupovat): přibližně 10 minut.
- Samotný start soutěže (První část): 09:10–12:00.
- Druhá část po obědě: 13:00–14:45.
- Vyhodnocení a společný rozbor: 15:00–16:00.

---

## 1. Titulní slajd — 11. Návod na CTF & Závěrečná soutěž

**Řekni:** „Vítám vás u závěrečného modulu Letní školy sítí – 11. Návod na CTF a závěrečná soutěž! Dnes si vyzkoušíte vyřešit praktické bezpečnostní a síťové výzvy. Všechny úlohy a bodování probíhá přes portál na adrese https://dork.cz.“

**Zapojení / ukázka:** Promítněte titulní slajd na projektoru a nechte účastníky otevřít stránku https://dork.cz.

**Přechod:** „Pojďme si nejprve projít harmonogram dnešního soutěžního dne.“

---

## 2. Harmonogram dne 🕒

**Řekni:** „Dnešní den je rozdělený přehledně: Od 9:00 do 9:10 si projdeme pravidla a sestavíme týmy. Od 9:10 do 12:00 poběží první dopolední část CTF. Ve 12:00 máme pauzu na oběd a od 13:00 do 14:45 navážeme druhou částí. Ve 14:45 se odevzdávání uzavře a od 15:00 do 16:00 proběhne společné vyhodnocení a rozbor nejzajímavějších úloh.“

**Zapojení / ukázka:** Ukažte časové miľníky na slajdu a zdůrazněte čas uzavření odevzdávání (14:45).

**Přechod:** „Pojďme se podívat na první kategorii – jak CTF funguje a jak vypadá vlajka.“

---

## 3. Kategorie 1: Co je to CTF a formát vlajky LS{...}

**Řekni:** „Soutěžíme v formátu Jeopardy CTF. Úlohy jsou rozdělené do kategorií a odstupňované podle obtížnosti. Doporučuji začít úlohami za méně bodů. Cílem není vyřešit úplně všechno a kdykoli můžete přeskočit na jinou úlohu.“

**Zapojení / ukázka:** Připomeňte, že náročnější úlohy zaberou víc kroků, proto je výhodné nejprve nasbírat body na jednodušších věcech.

**Přechod:** „Jak přesně vypadá odpověď, kterou na dork.cz odevzdáváte?“

---

## 4. Formát vlajky: LS{...}

**Řekni:** „Všechny vlajky na našem CTF mají formát `LS{text_uvnitr}` – kde LS znamená Letní škola sítí. Jakmile v souboru, v logu nebo na serveru objevíte řetězec v tomto tvaru, zkopírujte ho celý včetně `LS{` a `}` a vložte do pole u dané úlohy na dork.cz. Pozor na malá a velká písmena!“

**Zapojení / ukázka:** Ukažte příklad `LS{neco_uvnitr_zde}` na slajdu a upozorněte, abyste nekopírovali nechtěné mezery okolo.

**Přechod:** „Nyní se zaregistrujeme a vytvoříme týmy.“

---

## 5. Kategorie 2: Registrace a týmy na dork.cz

**Řekni:** „Otevřete si https://dork.cz. Pokud ještě nemáte účet, klikněte na Registrovat se. Pokud byste si chtěli textové pokyny projít kdykoliv znovu, najdete je na dork.cz/pruvodce.“

**Zapojení / ukázka:** Ukažte registrační tlačítko na dork.cz a odkaz na průvodce.

**Přechod:** „Pojďme se spárovat do týmů.“

---

## 6. Týmová spolupráce

**Řekni:** „Jeden člen týmu vytvoří nový tým a zvolí jeho název. Ostatní členové kliknou na Join Team a připojí se k němu. Důležité je, že když jakýkoliv člen týmu odevzdá správnou vlajku, body se připlnou okamžitě celému týmu společně!“

**Zapojení / ukázka:** Projděte učebnu a zkontrolujte, že jsou všichni spárovaní v týmech.

**Přechod:** „Pojďme si projít, jaké typy úloh na vás čekají.“

---

## 7. Kategorie 3: Přehled úloh, Dočasné stroje & Minecraft

**Řekni:** „Na dork.cz najdete 7 oblastí: Linux (soubory, logy, procesy), Síť (DNS, IP, Wireshark), Minecraft (3 místnosti na serveru), Docker (logy, Compose), Python (sockety, port scanner), Web (robots.txt, SQLi, XSS) a Bonus pro pokročilé.“

**Zapojení / ukázka:** Vyjmenujte oblasti a ukažte, že pokrývají přesně témata jednotlivých dní Letní školy sítí.

**Přechod:** „Některé úlohy vyžadují spuštění vlastní instance – pojďme si ukázat dočasné stroje.“

---

## 8. Dočasné stroje (Spustit stroj) 🚀

**Řekni:** „U některých úloh uvidíte tlačítko 'Spustit stroj'. Po kliknutí se pro vás vytvoří izolovaný kontejner na 15 minut a dostanete příkaz typu `nc 192.168.1.182 PORT`. Na Linuxu či macOS se připojíte jednoduše v terminálu příkazem `nc`, na Windows použijete `ncat.exe` nebo WSL. Připojení je bez hesla. Pokud potřebujete více času, tlačítkem na webu přidáte dalších 10 minut. Po skončení práce relaci ukončíte příkazem `exit`.“

**Zapojení / ukázka:** Předveďte spustění příkazu `nc` v terminálu.

**Přechod:** „A jak funguje speciální Minecraft úloha?“

---

## 9. Minecraft úloha 🧊🎮

**Řekni:** „V kategorii Minecraft vás čekají 3 navazující místnosti na reálném Minecraft serveru! K připojení potřebujete clienta Minecraft Java Edition verze 1.20.4. Adresu serveru uvidíte u zadání úlohy. Každý si prochází mapu sám, ale nalezené vlajky `LS{...}` si v týmu můžete normálně předávat. Server běží pouze v naší učební síti během soutěže.“

**Zapojení / ukázka:** Upozorněte na verzi Minecraftu 1.20.4 a ujistěte se, že studenti vědí, kde najdou adresu serveru.

**Přechod:** „Nyní to nejdůležitější – bezpečnostní pravidla soutěže.“

---

## 10. Kategorie 4: Bezpečnostní pravidla – Kde se smí hrát 🛑

**Řekni:** „Pozor na pravidla rozsahu: Aktivní bezpečnostní testování je povolené POUZE v cestě /lab (tedy https://dork.cz/lab), v dočasných strojích a nad přiloženými soubory! Samotné rozhraní CTFd mimo /lab NENÍ cíl útoku – nezkoušejte zranitelnosti na přihlašování, API ani administraci dork.cz. Wi-Fi soubory PCAP jsou syntetické offline nahrávky – nezkoušejte nic na reálné školní Wi-Fi. Zákaz phishingu, DoS a mazání data!“

**Zapojení / ukázka:** Zdůrazněte červeně podbarvenou cestu `/lab` a ukažte, že zkoušení útoku mimo `/lab` znamená diskvalifikaci.

**Přechod:** „Co dělat, pokud se zaseknete?“

---

## 11. Když nevíš jak dál... 🤔💡

**Řekni:** „Pokud se na úloze zaseknete: 1. Přeskočte na jinou úlohu. 2. Poraďte se v týmu. 3. Pokud jste 10 minut bez posunu, zavolejte lektora! Ukažte mu, co jste vyzkoušeli a lektor vás zdarma nasměruje. Ušetříte si tak zbytečné utrácení bodů za nápovědy v CTFd.“

**Zapojení / ukázka:** Povzbuďte studenty, aby se nebojeli zvednout ruku a zavolat lektora.

**Přechod:** „Jsme u konce úvodu, pojďme odstartovat!“

---

## 12. Kategorie 5: Start soutěže! 🏆

**Řekni:** „Všechny podstatné informace máme za sebou. Otevřete https://dork.cz, zkontrolujte týmy a můžeme odstartovat dopolední blok CTF do 12:00. Přejeme hodně štěstí a ulovte co nejvíce vlajek LS{...}! Pustíme se do toho!“

**Zapojení / ukázka:** Odstartujte časomíru (09:10) a obcházejte učebnu.
