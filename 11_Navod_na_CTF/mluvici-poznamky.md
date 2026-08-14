# Mluvené poznámky ke každému slajdu — Letní škola sítí: 11. Návod na CTF a závěrečná soutěž (CTFd na https://dork.cz)

Scénář je psaný pro úplné začátečníky. Není potřeba učit se ho doslova. Text po značce **Řekni** můžeš použít skoro jako hotovou formulaci, **Zapojení / ukázka** říká, co máš udělat s publikem, a **Přechod** ti pomůže plynule navázat.

## Doporučené tempo

- Slajdy 1–3 (Úvod & Co je CTF): přibližně 10 minut.
- Slajdy 4–8 (Registrace, Týmy & Rozhraní CTFd na dork.cz): přibližně 15 minut.
- Slajdy 9–14 (Kategorie úloh a nástroje): přibližně 20 minut.
- Slajdy 15–17 (Pravidla & Start soutěže): přibližně 10 minut.
- Celkový čas teoretického úvodu: cca 45–60 minut, následovaný samotnou závěrečnou soutěží.

---

## 1. Titulní slajd — 11. Návod na CTF & Závěrečná soutěž

**Řekni:** „Vítám vás u vyvrcholení Letní školy sítí – modulu 11. Návod na CTF a závěrečná soutěž. Dnes si prakticky ověříte vše, co jste se v průběhu kurzu naučili – od Linuxu a sítí přes Docker až po Wireshark a hacking Wi-Fi. Veškeré soutěžní úlohy poběží na portálu CTFd na adrese https://dork.cz.“

**Zapojení / ukázka:** Promítněte titulní slajd a ukažte studentům adresu https://dork.cz.

**Přechod:** „Pojďme si projít, co všechno vás v tomto úvodním bloku čeká.“

---

## 2. Co nás dnes čeká?

**Řekni:** „Než odstartujeme samotnou soutěž, vysvětlíme si koncept CTF, ukážeme si registraci týmu na dork.cz, naučíme se pracovat v rozhraní CTFd a projdeme si přehled kategorií úloh, nástrojů i základní pravidla fair play.“

**Zapojení / ukázka:** Zeptejte se účastníků: „Zná z vás už někdo koncept Capture The Flag nebo zkoušel někdo řešit CTF úlohy?“

**Přechod:** „Pojďme se podívat na první kategorii – co je to vlastně CTF.“

---

## 3. Kategorie 1: Co je to CTF (Capture The Flag)?

**Řekni:** „CTF neboli Capture The Flag je kybernetická soutěž zaměřená na praktickou bezpečnost. Naše soutěž je typu Jeopardy – na portálu máte k dispozici sadu samostatných úloh rozdělených do kategorií. Za každou vyřešenou úlohu získáte vlajku, jejímž odevzdáním připíšete svému týmu body.“

**Zapojení / ukázka:** Zdůrazněte, že cílem není jen vyhrát, ale vyzkoušet si reálné techniky řešení problémů v týmu.

**Přechod:** „Jak ale taková vlajka vypadá a jak s ní zacházet?“

---

## 4. Jak vypadá vlajka (Flag)?

**Řekni:** „Vlajka je tajný textový řetězec v přesně daném formátu, například `FLAG{s1tovk4_2026_dork_ctf_master}`. Jakmile úlohu vyřešíte – například dešifrujete zprávu nebo najdete zranitelnost na webu – objeví se vám tento řetězec. Ten zkopírujete a vložíte do příslušného pole na dork.cz. Dejte si pozor na přesný tvar včetně velkých a malých písmen.“

**Zapojení / ukázka:** Ukažte na projektoru příklad formátu `FLAG{...}` a upozorněte na nepovolené mezery před nebo za řetězcem při kopírování.

**Přechod:** „Nyní se podíváme na registraci a práci s týmy na portálu dork.cz.“

---

## 5. Kategorie 2: Registrace a týmy na portálu dork.cz

**Řekni:** „Vše se odehrává na adrese https://dork.cz. Otevřete si tento odkaz ve svém prohlížeči. Pokud ještě nemáte účet, klikněte vpravo nahoře na tlačítko Register a vytvořte si svůj profil.“

**Zapojení / ukázka:** Otevřete https://dork.cz na projektoru a ukažte registrační formulář.

**Přechod:** „Jelikož soutěžíme v týmech, ukážeme si, jak tým založit nebo se k němu připojit.“

---

## 6. Práce v týmech (Team Mode)

**Řekni:** „Jeden člen z vaší dvojice či trojice zvolí možnost Create Team, vymyslí název týmu a případně nastaví heslo. Druhý člen týmu následně zvolí Join Team, vyhledá název týmu a zadá přístupové heslo. Jakmile vyřeší úlohu kterýkoliv člen týmu, body se okamžitě započítají celému týmu.“

**Zapojení / ukázka:** Projděte učebnu a ověřte, že se všichni úspěšně zaregistrovali a spárovali do týmů.

**Přechod:** „Máme týmy hotové, pojďme si ukázat rozhraní CTFd.“

---

## 7. Kategorie 3: Práce s úlohami v rozhraní CTFd

**Řekni:** „Po přihlášení přejděte do záložky Challenges. Zde uvidíte dlaždice jednotlivých úloh roztříděné podle kategorií. U každé úlohy vidíte její název a bodovou hodnotu. Vyřešené úlohy se automaticky podbarví zeleně.“

**Zapojení / ukázka:** Ukažte na projektoru záložku Challenges na dork.cz.

**Přechod:** „Pojďme si rozkliknout detail jedné z úloh.“

---

## 8. Detail úlohy a odevzdání vlajky

**Řekni:** „Po kliknutí na úlohu se vám zobrazí okno se zadáním. Obsahuje popis problému, případně odkaz na webovou stránku, příkaz k připojení přes netcat (`nc dork.cz 1337`) nebo soubory ke stažení. Dole je pole pro vložení vlajky. Jakmile ji tam vložíte a kliknete na Submit, systém vám ihned řekne, zda je vlajka správná.“

**Zapojení / ukázka:** Předveďte odevzdání vzorové vlajky a ukažte, co se stane při správném i špatném zadání. Upozorněte na nápovědy (Hints), které mohou stát body.

**Přechod:** „Kde můžete sledovat, jak si stojíte proti ostatním?“

---

## 9. Scoreboard a průběh soutěže

**Řekni:** „V záložce Scoreboard vidíte živý žebříček všech týmů a graf vývoje bodů. Sledujte také záložku Notifications v horní liště – pokud by pořadatelé vydali důležitou nápovědu nebo opravu zadání, objeví se právě tam.“

**Zapojení / ukázka:** Ukažte záložku Scoreboard na dork.cz.

**Přechod:** „Nyní si projdeme přehled hlavních kategorií úloh, se kterými se v soutěži setkáte.“

---

## 10. Kategorie 4: Soutěžní kategorie a doporučené nástroje

**Řekni:** „Úlohy jsou rozděleny do několika oblastí. V následujících slajdech si ukážeme, jaké nástroje z Letní školy sítí využijete pro řešení jednotlivých kategorií.“

**Zapojení / ukázka:** Připomeňte účastníkům, že mají k dispozici Kali Linux i terminál na svých stanicích.

**Přechod:** „Začneme kategorií Web Hacking.“

---

## 11. 1. Web Hacking

**Řekni:** „Webové úlohy prověří vaše znalosti HTML, JavaScriptu, HTTP hlaviček a webových zranitelností. Vždy začněte otevřením vývojářských nástrojů v prohlížeči pomocí klávesy F12. Prozkoumejte zdrojový kód stránky, HTML komentáře, soubory `robots.txt` nebo vyzkoušejte nástroje jako `curl` a Burp Suite.“

**Zapojení / ukázka:** Ukažte zkratku F12 v prohlížeči a záložky Inspector, Network a Storage (Cookies).

**Přechod:** „Další klíčovou kategorií jsou sítě a forenzní analýza.“

---

## 12. 2. Sítě & Forenzní analýza (Forensics)

**Řekni:** „V síťových a forenzních úlohách budete analyzovat odchycený provoz v souborech PCAP nebo hledat skrytá data v obrázcích. Využijete Wireshark pro filtrování paketů, příkaz `strings` pro vytažení textů ze souborů nebo `exiftool` a `binwalk` pro analýzu metadat a skrytých příloh.“

**Zapojení / ukázka:** Připomeňte příkaz `strings tajemny_soubor.bin | grep -i "FLAG"`.

**Přechod:** „Pojďme na Linux a prácí v příkazové řádce.“

---

## 13. 3. Linux & Příkazová řádka (Misc / System)

**Řekni:** „Zde uplatníte práci v terminálu. Můžete se připojovat ke vzdáleným službám pomocí Netcatu (`nc dork.cz 9999`) nebo prohledávat systémové soubory příkazy `find` a `grep`. Nezapomeňte na základy z 1. dne – práva k souborům, skryté soubory a přesměrování chybového výstupu.“

**Zapojení / ukázka:** Ukažte použití `grep -rnw '/path/' -e 'FLAG{'`.

**Přechod:** „Čtvrtou velkou oblastí je kryptografie.“

---

## 14. 4. Kryptografie & Kódování (Crypto)

**Řekni:** „V crypto úlohách budete narážet na zakódované nebo zašifrované řetězce. Velmi časté je kódování Base64, které snadno dekódujete příkazem `echo "..." | base64 -d`. Pro jakékoliv složitější šifry, Caesarovu šifru nebo převody soustav doporučuji nástroj CyberChef na webu.“

**Zapojení / ukázka:** Otevřete v prohlížeči CyberChef (https://gchq.github.io/CyberChef/) a ukažte dekódování Base64 zprávy.

**Přechod:** „Než odstartujeme, musíme si zdůraznit pravidla soutěže.“

---

## 15. Kategorie 5: Pravidla soutěže a týmová strategie

**Řekni:** „Pravidla jsou jednoduchá, ale zásadní. CTF je hra o férovosti. Je přísně zakázáno útočit na samotný server dork.cz a infrastrukturu CTFd – testujete pouze konkrétní zadané úlohy. Je zakázáno sdílet vlajky mezi týmy a je zakázáno používat automatické DoS skripty.“

**Zapojení / ukázka:** Zdůrazněte pravidla fair play a upozorněte, že porušení pravidel znamená diskvalifikaci.

**Přechod:** „Jak v soutěži dosáhnout co nejlepšího výsledku?“

---

## 16. Doporučená týmová strategie 🚀

**Řekni:** „Pracujte jako tým! Rozdělte si role podle toho, co koho baví a v čem si věří. Začněte jednoduššími úlohami s nižším počtem bodů pro rozjezd. Pokud se na některé úloze zaseknete na déle než 15–20 minut, střídejte se nebo přešlapujte na jinou úlohu. Vzájemně si radostně oznamujte nálezy v týmu!“

**Zapojení / ukázka:** Povzbuďte studenty ke komunikaci v týmu.

**Přechod:** „Vše je připraveno, můžeme začít!“

---

## 17. Připraveni? Jdeme na to! 🏆

**Řekni:** „Všechny instrukce máte za sebou. Nyní otevřete https://dork.cz, zkontrolujte přihlášení svých týmů a můžeme odstartovat závěrečnou soutěž Letní školy sítí. Hodně štěstí všem a ať vyhraje ten nejlepší tým!“

**Zapojení / ukázka:** Spusťte časomíru soutěže, obcházejte učebnu a pomáhejte týmům s případnými technickými dotazy k rozhraní.
