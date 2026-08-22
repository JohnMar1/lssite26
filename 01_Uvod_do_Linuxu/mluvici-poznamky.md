# Mluvené poznámky ke každému slajdu - Letní škola sítí: 1. Úvod do Linuxu

Scénář je psaný pro úplné začátečníky. Není potřeba učit se ho doslova. Text po značce **Řekni** můžeš použít skoro jako hotovou formulaci, **Zapojení / ukázka** říká, co máš udělat s publikem, a **Přechod** ti pomůže plynule navázat.

U příkazů nečti kód z obrazovky jako holý text - vysvětli nejprve účel příkazu, pak vylož jeho příznaky (flags) a argumenty.

## Doporučené tempo

- Slajdy 1-9: Úvod, kernel vs GNU, distribuce a Unixová filozofie, přibližně 25 minut.
- Slajdy 10-20: Terminál, shell, nápověda, bezpečné návyky a info o systému, přibližně 35 minut.
- Slajdy 21-43: Souborový systém, navigace, vytváření, čtení, mazání a globy, přibližně 60 minut.
- Slajd 44: Přestávka (10 min).
- Slajdy 45-51: Vyhledávání, grep, roury a přesměrování výstupu, přibližně 45 minut.
- Slajdy 52-62: Uživatelé, skupiny, oprávnění (chmod, chown, sudo, umask), přibližně 45 minut.
- Slajd 63: Přestávka (10 min).
- Slajdy 64-71: Shell ve větší hloubce, uvozovky, návratové kódy a procesy, přibližně 30 minut.
- Slajdy 72-79: Filesystem do hloubky, symlinky, /proc, /sys a tar, přibližně 30 minut.
- Slajdy 80-85: Textové nástroje (sort, uniq, cut, tr, sed, xargs), přibližně 30 minut.
- Slajdy 86-91: Oprávnění do hloubky (sticky bit, setuid, ACL, stat), přibližně 25 minut.
- Slajdy 92-98: Praktická cvičení, kontrolní otázky a závěr, přibližně 30-45 minut.

---

## 1. Úvod do Linuxu

**Řekni:** „Vítám vás u prvního bloku výuky. Dnes se naučíme ovládat operační systém Linux z rozhraní příkazového řádku - terminálu. Probereme souborový systém, správu práv a základní nástroje pro každodenní práci na serveru.“

**Zapojení / ukázka:** Zeptej se: „Kdo z vás už někdy viděl černé okno terminálu a bál se do něj cokoliv napsat?“

**Přechod:** „Pojďme si ukázat přehled toho, co dnes společně zvládneme.“

## 2. Co dnes zvládneme

**Řekni:** „Dnes projdeme 5 hlavních kapitol: orientaci v terminálu, základní příkazy a navigaci, práci se soubory, vyhledávání s rourami a přesměrováním a na závěr uživatele a systémová práva.“

**Zapojení / ukázka:** Ujisti všechny: „Začínáme od nuly, tempo přizpůsobíme tak, aby nikdo nezůstal pozadu.“

**Přechod:** „Nejdříve si musíme ujasnit, co vlastně slovo Linux znamená.“

## 3. Co je Linux?

**Řekni:** „Linux je v přesném slova smyslu jádro operačního systému - kernel. Vytvořil ho v roce 1991 Linus Torvalds. Jádro je mostem mezi hardwarem počítače a běžícími programy; stará se o přidělování paměti, procesorového času a obsluhu disků.“

**Zapojení / ukázka:** Zeptej se: „Víte, jaký je rozdíl mezi samotným jádrem a kompletním operačním systémem?“

**Přechod:** „Samotné jádro totiž uživateli k práci nestačí.“

## 4. Kernel není celý systém

**Řekni:** „Když mluvíme o operačním systému Linux, skládá se z několika vrstev: Linux kernel na spodu, nad ním GNU systémové nástroje a knihovny, inicializační systém (systemd), shell a volitelně grafické rozhraní.“

**Zapojení / ukázka:** Použij příměr s autem: Kernel je motor pod kapotou, ale abyste mohli řídit, potřebujete volant, pedály a palubní desku (GNU nástroje a shell).

**Přechod:** „A právě většina základních nástrojů pochází z projektu GNU.“

## 5. GNU

**Řekni:** „Projekt GNU založil Richard Stallman s cílem vytvořit kompletně svobodný unixový systém. GNU poskytlo základní utility jako ls, cp, grep i samotný překladač GCC. Proto se v odborných kruzích správně říká GNU/Linux.“

**Zapojení / ukázka:** Pro odlehčení vysvětli rekurzivní zkratku: „GNU znamená GNU's Not Unix.“

**Přechod:** „Kde všude se s Linuxem dnes setkáváme?“

## 6. Kde Linux potkáš?

**Řekni:** „Linux běží na drtivé většině webových serverů a cloudů (AWS, Google Cloud, Azure). Pohání chytré telefony s Androidem, domácí routery, televizory, vesmírné sondy, superpočítače a je skvělý i pro vývojáře na desktopech jako Ubuntu nebo Fedora.“

**Zapojení / ukázka:** Vyzvi účastníky: „Pokud máte v kapse telefon s Androidem, nosíte v něm skutečné linuxové jádro.“

**Přechod:** „Proč vlastně linuxový svět tak dominuje serverům?“

## 7. Proč Linux?

**Řekni:** „Linux je open source - jeho zdrojový kód může kdokoliv číst, zkoumat a vylepšovat. Je stabilní, bezpečný, vysoce přizpůsobitelný a běží spolehlivě i na slabším hardware bez zbytečné režie grafiky.“

**Zapojení / ukázka:** Zdůrazni: „V Linuxu máte nad systémem absolutní kontrolu - ale s ní přichází i plná zodpovědnost.“

**Přechod:** „Jak si může běžný uživatel Linux vyzkoušet a nainstalovat?“

## 8. Distribuce

**Řekni:** „Distribuce je hotový zabalený operační systém postavený na Linux jádře. Nejznámější je rodina Debian (kam patří Debian, Ubuntu a Linux Mint se správcem balíčků apt), dále rodina Red Hat / Fedora (se správcem dnf), Arch Linux (pacman) nebo openSUSE (zypper).“

**Zapojení / ukázka:** Zeptej se zvednutím ruky: „Zkoušel už někdo z vás doma nainstalovat Ubuntu nebo jinou distribuci?“

**Přechod:** „Důležitým základem celého unixového myšlení je filozofie malých nástrojů.“

## 9. Filozofie Unixu

**Řekni:** „Unixová filozofie stojí na jednoduchém pravidle: Dělej jednu věc a dělej ji pořádně. Místo jednoho obřího programu máme desítky malých specializovaných utilit, které posíláme textový výstup dál přes roury. A platí pravidlo: Všechno je soubor.“

**Zapojení / ukázka:** Připomeň: „Tuto stavebnicovou logiku si brzy vyzkoušíme v praxi při spojování příkazů.“

**Přechod:** „Pojďme si otevřít terminál a vysvětlit si základní pojmy.“

## 10. Terminál, shell a příkaz

**Řekni:** „Rozlišujeme tři pojmy: Terminál je grafické okno na obrazovce. Shell je interpret na pozadí (nejčastěji bash, případně zsh), který čte textové příkazy a spouští programy. Příkaz je samotný program nebo vestavěný pokyn, který zadáváme.“

**Zapojení / ukázka:** Nechte všechny účastníky otevřít terminál na svých počítačích.

**Přechod:** „Co znamenají texty a symboly na začátku řádku terminálu?“

## 11. Prompt

**Řekni:** „Příkazová výzva neboli prompt nám říká, kdo a kde jsme. V zápisu student@pc:~/projekty$ je student uživatel, pc název stroje, ~/projekty aktuální složka a symbol $ značí běžného uživatele. U administrátora root bývá znak #.“

**Zapojení / ukázka:** Zkontrolujte, že všichni účastníci vidí na obrazovce znak dolaru $.

**Přechod:** „Z jakých částí se skládá zadávaný příkaz?“

## 12. Anatomie příkazu

**Řekni:** „Příkaz se obvykle skládá ze tří částí: jméno příkazu (ls), volby neboli přepínače (-la), které mění chování příkazu, a argumenty (/var/log), což bývají cílové cesty nebo názvy souborů.“

**Zapojení / ukázka:** Ukažte v terminálu rozdíl mezi spuštěním holého ls a ls -la.

**Přechod:** „Když nevíte, jaké volby příkaz nabízí, jak získat pomoc?“

## 13. Nápověda

**Řekni:** „Máme tři hlavní cesty: man <příkaz> otevře podrobný manuál (ukončíte stiskem klávesy q), <příkaz> --help vypíše rychlý přehled parametrů a pro vestavěné příkazy shellu slouží help <příkaz>.“

**Zapojení / ukázka:** Vyzvěte studenty, aby napsali man ls, prolistovali šipkami a zmáčkli q.

**Přechod:** „Jak si usnadnit práci pomocí klávesových zkratek?“

## 14. Historie a doplňování

**Řekni:** „Nejdůležitější klávesa v terminálu je Tabulátor - automaticky doplňuje názvy souborů a příkazů. Šipky nahoru a dolů listují historií, Ctrl+C bezpečně přeruší běžící program a Ctrl+L vyčistí obrazovku.“

**Zapojení / ukázka:** Předveďte psaní cd /v a stisk Tabulátoru pro doplnění /var/.

**Přechod:** „Než začneme pracovat se soubory, musíme si říct důležitá bezpečnostní pravidla.“

## 15. Bezpečné návyky

**Řekni:** „V terminálu neexistuje tlačítko Zpět ani Koš. Než spustíte mazací příkaz, ověřte si cestu přes pwd a ls. Pokud má název složky mezeru, dejte ji do uvozovek. A u příkazů se sudo si vždy dvakrát zkontrolujte, co přesně spouštíte.“

**Zapojení / ukázka:** Zdůrazněte: „Nikdy nekopírujte z internetu příkazy, kterým nerozumíte.“

**Přechod:** „Pojďme si zjistit základní informace o našem počítači.“

## 16. Základní informace o systému

**Řekni:** „V této části si ukážeme příkazy, kterými zjistíme, pod jakým uživatelem pracujeme, jaký máme operační systém a hardware.“

**Zapojení / ukázka:** Uveďte, že tyto příkazy jsou první věc, kterou síťař na cizím serveru spustí.

**Přechod:** „Začneme příkazy pro identifikaci uživatele.“

## 17. Kdo jsem?

**Řekni:** „Příkaz whoami vypíše jméno aktuálního uživatele. Příkaz id k tomu přidá číselné UID (User ID), primární skupinu GID a seznam všech dalších skupin, do kterých uživatel patří.“

**Zapojení / ukázka:** Nechte všechny spustit whoami a id v terminálu a porovnat výstupy.

**Přechod:** „Jak zjistíme název stroje a verzi jádra?“

## 18. Stroj a systém

**Řekni:** „Příkaz hostname vrátí jméno počítače v síti. uname -a vypíše kompletní informace o jádře a architektuře procesoru (např. x86_64). A soubor /etc/os-release obsahuje přesný název a verzi distribuce.“

**Zapojení / ukázka:** Nechte účastníky spustit cat /etc/os-release a najít řádek s verzí systému.

**Přechod:** „Jak v terminálu zjistíme aktuální datum a čas?“

## 19. Čas a kalendář

**Řekni:** „Příkaz date ukazuje přesný systémový čas, datum a časové pásmo. Příkaz cal vypíše přehledný textový kalendář pro aktuální měsíc.“

**Zapojení / ukázka:** Nechte účastníky vyzkoušet date a cal.

**Přechod:** „Jak můžeme vypisovat vlastní texty a proměnné prostředí?“

## 20. Echo a proměnné

**Řekni:** „Příkaz echo slouží k vypsání textu na obrazovku. Pokud před název vložíme znak dolaru, například $HOME nebo $SHELL, shell text nahradí hodnotou dané proměnné prostředí.“

**Zapojení / ukázka:** Vyzkoušejte společně echo $HOME a echo $SHELL.

**Přechod:** „Nyní se posuneme k zásadnímu tématu: struktuře souborového systému v Linuxu.“

## 21. Souborový systém

**Řekni:** „V Linuxu neexistují disky C: a D: jako ve Windows. Všechny soubory a disky jsou uspořádány do jednoho jediného stromu začínajícího kořenem /.“

**Zapojení / ukázka:** Zeptejte se: „Kdo ví, jak se liší cesty ve Windows (zpětná lomítka) od Linuxu (obyčejná lomítka)?“

**Přechod:** „Podívejme se na základní větve tohoto stromu.“

## 22. Strom adresářů

**Řekni:** „V kořeni / najdeme standardní systémové složky: /home pro uživatelské složky, /etc pro konfigurační soubory služeb, /var pro proměnlivá data a logy, /tmp pro dočasné soubory, /usr pro nainstalované programy a /proc pro informace o procesech.“

**Zapojení / ukázka:** Projděte schéma na slajdu a vysvětlete účel jednotlivých větví.

**Přechod:** „Které z těchto cest jsou pro nás nejdůležitější?“

## 23. Důležité cesty

**Řekni:** „Nejdůležitější cesty jsou: / (kořen systému), /home/student (váš domovský adresář, kde máte plná práva), /root (domovská složka správce), /var/log (systémové logy pro řešení problémů) a /tmp (dočasné soubory, které se při restartu mažou).“

**Zapojení / ukázka:** Zdůrazněte, že běžný uživatel smí zapisovat především do svého /home.

**Přechod:** „Jak se zapisují cesty k souborům?“

## 24. Absolutní a relativní cesty

**Řekni:** „Absolutní cesta začíná vždy lomítkem / a vede přímo od kořene systému bez ohledu na to, kde se právě nacházíte. Relativní cesta lomítkem nezačíná a počítá se od aktuálního pracovního adresáře.“

**Zapojení / ukázka:** Uveďte příměr s navigací: Absolutní adresa je plné PSČ, město, ulice a číslo. Relativní směr je 'jdi o dvoje dveře doleva'.

**Přechod:** „Jaké speciální zkratky v cestách používáme?“

## 25. Speciální zápisy cest

**Řekni:** „V cestách používáme 4 důležité zkratky: tečka . označuje aktuální adresář, dvě tečky .. nadřazený adresář, vlnka ~ domovský adresář a pomlčka - přepne zpět do předchozí navštívené složky.“

**Zapojení / ukázka:** Ukažte cd ~ pro rychlý návrat domů a cd - pro přepínání mezi dvěma složkami.

**Přechod:** „Jakým příkazem zjistíme, v jaké složce se právě nacházíme?“

## 26. pwd - kde právě jsem?

**Řekni:** „Příkaz pwd znamená print working directory. Vypíše kompletní absolutní cestu k adresáři, ve kterém se váš terminál právě nachází.“

**Zapojení / ukázka:** Nechte všechny napsat pwd a zkontrolovat výstup.

**Přechod:** „Jak se mezi adresáři pohybujeme?“

## 27. cd - změna adresáře

**Řekni:** „Příkaz cd (change directory) slouží k přepnutí do jiného adresáře. Pokud zadáte cd bez argumentů, vrátí vás rovnou domů. Pamatujte, že Linux striktně rozlišuje velká a malá písmena: Dokumenty a dokumenty jsou dvě různé složky.“

**Zapojení / ukázka:** Nechte účastníky zkusit cd /var/log, ověřit přes pwd a vrátit se domů příkazem cd ~ .

**Přechod:** „Jak vypíšeme obsah složky?“

## 28. ls - výpis obsahu

**Řekni:** „Příkaz ls vypíše soubory a složky v aktuálním adresáři. Nejpoužívanější přepínače jsou -l (podrobný výpis s právy a velikostmi), -a (zobrazí i skryté soubory) a -h (čitelné jednotky jako KB, MB). Často se kombinují jako ls -lah.“

**Zapojení / ukázka:** Nechte účastníky spustit ls -la /etc a sledovat rozdíl.

**Přechod:** „Pojďme si rozebrat, co jednotlivé sloupce podrobného výpisu znamenají.“

## 29. Jak číst ls -l

**Řekni:** „Podrobný výpis má jasnou strukturu: 1. sloupec jsou práva a typ položky, 2. počet odkazů, 3. vlastník a skupina, 4. velikost v bajtech, 5. datum poslední změny a 6. název souboru.“

**Zapojení / ukázka:** Ukažte na řádek na projektoru a nechte účastníky určit, kdo je vlastníkem a jak je soubor velký.

**Přechod:** „Co přesně jsou skryté soubory?“

## 30. Skryté soubory

**Řekni:** „V Linuxu je skrytý každý soubor nebo složka, jejíž název začíná tečkou (např. .bashrc nebo .ssh). Není to bezpečnostní zámek, slouží to pouze k tomu, aby konfigurační soubory nepřekážely v běžném výpisu.“

**Zapojení / ukázka:** Spusťte ls a pak ls -a v domovském adresáři a porovnejte počet položek.

**Přechod:** „Nyní se naučíme vytvářet a číst nové soubory a adresáře.“

## 31. Vytváření a čtení souborů

**Řekni:** „V této kapitole si vyzkoušíme vytváření adresářů, prázdných souborů, čtení textů různými způsoby a práci s textovým editorem nano.“

**Zapojení / ukázka:** Připravte studenty na praktickou práci v jejich domovských složkách.

**Přechod:** „Prvním příkazem je mkdir.“

## 32. mkdir - nový adresář

**Řekni:** „Příkaz mkdir vytvoří novou složku. Pokud potřebujete vytvořit vnořenou strukturu více složek naráz, použijte přepínač -p (např. mkdir -p projekt/src/js), který vytvoří i chybějící mezisložky bez chybového hlášení.“

**Zapojení / ukázka:** Nechte účastníky vytvořit složku mkdir -p lssite/data.

**Přechod:** „Jak vytvoříme nový prázdný soubor?“

## 33. touch - prázdný soubor

**Řekni:** „Příkaz touch vytvoří prázdný textový soubor. Pokud soubor už existuje, touch nesmaže jeho obsah, ale pouze aktualizuje datum a čas jeho poslední změny.“

**Zapojení / ukázka:** Nechte všechny vytvořit soubor touch lssite/poznamky.txt.

**Přechod:** „Jakými nástroji můžeme obsah souboru přečíst?“

## 34. cat, less a head

**Řekni:** „Pro zobrazení obsahu máme více nástrojů: cat vypíše celý soubor naráz na obrazovku. less umožní velkým souborem pohodlně listovat a vyhledávat (ukončí se q). head -n 20 zobrazí prvních 20 řádků a tail -n 20 posledních 20 řádků.“

**Zapojení / ukázka:** Vyzkoušejte head -n 5 /etc/passwd a less /etc/services.

**Přechod:** „Jak můžeme sledovat soubor, do kterého se právě zapisují nová data?“

## 35. tail -f - sledování logu

**Řekni:** „Přepínač -f u příkazu tail znamená follow. Nechá soubor otevřený a v reálném čase vypisuje každý nový řádek, který do něj systém nebo aplikace zapíše. Ukončí se stiskem Ctrl+C.“

**Zapojení / ukázka:** Ukažte tail -f /var/log/syslog a vysvětlete, že je to hlavní nástroj při hledání chyb na serveru.

**Přechod:** „Jak soubor přímo v terminálu upravit a napsat do něj text?“

## 36. nano - jednoduchý editor

**Řekni:** „Editor nano je nejpřívětivější textový editor pro začátečníky. Ve spodní liště máte stálou nápovědu zkratek, kde stříška ^ znamená klávesu Ctrl. Soubor uložíte pomocí Ctrl+O (potvrdíte Enterem) a editor opustíte pomocí Ctrl+X.“

**Zapojení / ukázka:** Nechte každého otevřít nano soubor.txt, napsat větu, uložit a odejít.

**Přechod:** „Jak soubory kopírovat?“

## 37. cp - kopírování

**Řekni:** „Příkaz cp zkopíruje soubor ze zdroje do cíle: cp stary.txt kopie.txt. Chcete-li zkopírovat celou složku včetně jejího obsahu, musíte přidat přepínač -r pro rekurzivní kopírování.“

**Zapojení / ukázka:** Vyzkoušejte cp poznamky.txt zaloha.txt.

**Přechod:** „Jak soubory přesouvat nebo přejmenovávat?“

## 38. mv - přesun a přejmenování

**Řekni:** „V Linuxu je přesun i přejmenování stejná operace: příkaz mv. Pokud zadáte nový název ve stejné složce, soubor se přejmenuje (mv stary.txt novy.txt). Pokud zadáte cestu k jiné složce, soubor se do ní přesune.“

**Zapojení / ukázka:** Předveďte přejmenování souboru a ověřte výsledek přes ls.

**Přechod:** „Jak nepotřebné soubory smazat?“

## 39. rm a rmdir

**Řekni:** „Příkaz rm odstraní soubor. Pro smazání celé složky i s obsahem slouží rm -r. Pro prázdné složky existuje rmdir. Pamatujte: v Linuxu není Koš - smazání je definitivní. S příkazem rm -rf zacházejte s maximální opatrností!“

**Zapojení / ukázka:** Upozorněte na nebezpečí překlepů při mazání s právy roota.

**Přechod:** „Jak mazat bezpečněji?“

## 40. Bezpečnější mazání

**Řekni:** „Přepínač -i u příkazu rm se před každým smazáním zeptá na potvrzení (y/n). Přepínač -I se zeptá jednou před hromadným mazáním více než tří položek a -v podrobně vypisuje každou smazanou položku.“

**Zapojení / ukázka:** Zkuste rm -i test.txt a ukažte dialog potvrzení.

**Přechod:** „Jak pracovat s více soubory naráz pomocí zástupných znaků?“

## 41. Globy: více souborů najednou

**Řekni:** „Zástupné znaky (globy) umožňují vybrat skupinu souborů: hvězdička * nahrazuje libovolný počet znaků (např. *.txt), otazník ? nahrazuje právě jeden znak (např. obrazek?.png) a dvojitá pomlčka -- ukončí seznam přepínačů pro soubory začínající pomlčkou.“

**Zapojení / ukázka:** Spusťte ls *.txt a ukažte, jak shell automaticky rozbalí seznam.

**Přechod:** „Jak zjistit, co je soubor skutečně zač, bez ohledu na jeho příponu?“

## 42. file - skutečný typ souboru

**Řekni:** „V Linuxu přípona souboru neurčuje jeho formát - soubor bez přípony může být obrázek nebo skript. Nástroj file prozkoumá hlavičku a magické bajty na začátku souboru a vypíše jeho skutečný formát.“

**Zapojení / ukázka:** Zkuste přejmenovat textový soubor na .jpg a spusťte na něj file - Linux pozná, že jde o text.

**Přechod:** „Jak zjistit velikost souborů a volné místo na disku?“

## 43. tree a velikost

**Řekni:** „Příkaz tree zobrazí stromovou strukturu složek. Příkaz du -sh <cesta> spočítá celkovou velikost vybrané složky na disku a df -h vypíše celkové volné a obsazené místo na všech připojených diskových oddílech.“

**Zapojení / ukázka:** Nechte všechny spustit df -h a najít kořenový diskový oddíl /.

**Přechod:** „Nyní si dáme zaslouženou desetiminutovou přestávku.“

## 44. Přestávka (10 min)

**Řekni:** „Dáme si 10 minut pauzu na vydechnutí, kávu a toaletu. Po přestávce navážeme vyhledáváním, rourami a správou uživatelských práv.“

**Zapojení / ukázka:** Nastavte odpočet 10 minut.

**Přechod:** „Pokračujeme vyhledáváním a zpracováním textu.“

## 45. Vyhledávání a zpracování textu

**Řekni:** „V tomto bloku si ukážeme, jak v tisících souborů najít přesně to, co hledáme, a jak spojovat výstupy programů dohromady pomocí rour.“

**Zapojení / ukázka:** Zdůrazněte, že vyhledávání a filtrování je denní chléb každého správce i bezpečnostního analytika.

**Přechod:** „Prvním mocným nástrojem je příkaz find.“

## 46. find - hledání podle vlastností

**Řekni:** „Příkaz find prohledává strom složek podle jména, typu, velikosti nebo stáří. První argument je výchozí složka (např. . pro aktuální místo), -name "*.txt" hledá podle vzoru a -type f omezí hledání pouze na soubory (-type d na složky).“

**Zapojení / ukázka:** Spusťte find /etc -name "*.conf" 2>/dev/null a ukažte výsledky.

**Přechod:** „Jak hledat text uvnitř obsahu souborů?“

## 47. grep - hledání v obsahu

**Řekni:** „Nástroj grep prohledává obsah souborů a vypisuje řádky odpovídající hledanému vzoru. Klíčové přepínače jsou -i (nerozlišuje velká a malá písmena), -r (prohledává celou složku rekurzivně) a -n (vypíše číslo řádku).“

**Zapojení / ukázka:** Nechte studenty vyhledat své uživatelské jméno v souboru: grep "student" /etc/passwd.

**Přechod:** „A jak poslat výstup jednoho příkazu přímo do vstupu druhého?“

## 48. Roura |

**Řekni:** „Roura (svislítko |, pipe) je srdcem Unixu. Vezme standardní výstup prvního programu a pošle ho jako standardní vstup druhému programu. Například ls -la /etc | less umožní stránkovat dlouhý výpis a ps aux | grep nginx vyfiltruje běžící procesy.“

**Zapojení / ukázka:** Napište na klávesnici znak | (pravý Alt + W nebo Alt + 124) a ujistěte se, že ho všichni umí napsat.

**Přechod:** „Jak uložit výstup příkazu do souboru na disku?“

## 49. Přesměrování výstupu

**Řekni:** „Výstup do souboru přesměrujeme operátory: jedno zobáček > soubor vytvoří nebo jeho původní obsah přepíše. Dva zobáčky >> přidají nový výstup na konec existujícího souboru bez smazání původních dat.“

**Zapojení / ukázka:** Předveďte rozdíl mezi echo "Ahoj" > test.txt a následným echo "Svět" >> test.txt.

**Přechod:** „Co když příkaz skončí chybou? Kam putují chybová hlášení?“

## 50. Chyby: stderr

**Řekni:** „Každý linuxový program má dva výstupní kanály: 1 je standardní výstup (stdout) a 2 je chybový výstup (stderr). Zápisem 2> chyby.txt uložíme pouze chyby. Zápis 2>&1 sloučí chyby s běžným výstupem a 2>/dev/null chyby tiše zahodí do černé díry.“

**Zapojení / ukázka:** Spusťte ls /root 2>/dev/null jako běžný uživatel a ukažte, jak chybová hláška 'Permission denied' zmizí.

**Přechod:** „Pojďme si ukázat praktický řetězec spojující více těchto nástrojů.“

## 51. Praktický řetězec

**Řekni:** „V praxi běžně spojujeme více kroků: například vyhledáme logy, seřadíme je podle abecedy a uložíme do souboru: find . -type f -name "*.log" | sort > seznam-logu.txt. Nebo prohledáme systémové logy a stránkujeme chyby přes less.“

**Zapojení / ukázka:** Nechte studenty sestavit vlastní pipeline zkoumající systémové soubory.

**Přechod:** „Přejdeme k další klíčové kapitole: uživatelům, skupinám a oprávněním.“

## 52. Uživatelé, skupiny a práva

**Řekni:** „Linux je od základu víceuživatelský a zabezpečený systém. Každý soubor, složka i proces má přesně definovaného vlastníka a přístupová práva.“

**Zapojení / ukázka:** Zeptejte se: „Proč je důležité, aby běžný uživatel nemohl měnit systémové soubory?“

**Přechod:** „Jaké tři kategorie uživatelů u každého souboru rozlišujeme?“

## 53. Vlastník, skupina, ostatní

**Řekni:** „Oprávnění se v Linuxu dělí do tří úrovní: Vlastník (User u, konkrétní člověk), Skupina (Group g, sdružení uživatelů) a Ostatní (Others o, všichni ostatní na počítači). Systém vyhodnocuje práva v tomto pořadí odshora dolů.“

**Zapojení / ukázka:** Ukažte řádek -rwxr-x--- 1 alice vyvojari a vysvětlete, jaká práva má Alice a jaká lidé ze skupiny vyvojari.

**Přechod:** „Jaká konkrétní práva můžeme nastavit?“

## 54. r, w, x

**Řekni:** „Máme tři základní práva: r (read, čtení), w (write, zápis a změna) a x (execute, spuštění). U adresářů má r význam čtení seznamu souborů, w vytváření a mazání souborů a x možnost do adresáře vstoupit.“

**Zapojení / ukázka:** Zdůrazněte rozdíl mezi spustitelným programem a pouhým textovým souborem.

**Přechod:** „Jak celkový řetězec oprávnění rozkódovat?“

## 55. Rozebrání oprávnění

**Řekni:** „Desetimístný řetězec čteme po částech: 1. znak určuje typ položky (- pro soubor, d pro adresář, l pro symbolický odkaz). Následuje trojice pro vlastníka (rwx), trojice pro skupinu (r-x) a trojice pro ostatní (r--).“

**Zapojení / ukázka:** Napište na tabuli náhodný řetězec typu drwxr-xr-x a nechte studenty určit typ a práva.

**Přechod:** „Kromě písmen se práva velmi často zapisují pomocí čísel.“

## 56. Číselný zápis práv

**Řekni:** „Každé právo má svou číselnou hodnotu: r = 4, w = 2, x = 1. Jejich součtem získáme hodnotu pro danou trojici: 7 = rwx, 6 = rw-, 5 = r-x, 4 = r--. Zápis chmod 754 tedy znamená vlastník 7 (rwx), skupina 5 (r-x) a ostatní 4 (r--).“

**Zapojení / ukázka:** Procvičte rychlé počítání z hlavy: „Kolik je čtení + zápis? 4 + 2 = 6.“

**Přechod:** „Jakým příkazem práva souboru změníme?“

## 57. chmod - změna práv

**Řekni:** „Příkaz chmod mění oprávnění souboru. Můžeme použít číselný zápis (chmod 755 skript.sh) nebo symbolický zápis (chmod u+x skript.sh přidá spouštění vlastníkovi, chmod g-w soubor.txt odebere zápis skupině).“

**Zapojení / ukázka:** Nechte každého vytvořit skript touch skript.sh, přidat právo spouštění chmod +x skript.sh a ověřit barvu ve výpisu ls -l.

**Přechod:** „Jaká nastavení práv se v praxi používají nejčastěji?“

## 58. Běžná nastavení

**Řekni:** „Čtyři nejčastější masky v praxi: 644 (vlastník čte i píše, ostatní jen čtou - standard pro web a dokumenty), 600 (přístup pouze pro vlastníka - nutnost pro SSH klíče), 755 (spustitelný skript nebo veřejná složka) a 700 (soukromá složka přístupná jen autorovi).“

**Zapojení / ukázka:** Upozorněte, že SSH klient odmítne použít privátní klíč, pokud nemá striktní práva 600.

**Přechod:** „Jak změnit vlastníka nebo skupinu souboru?“

## 59. chown a chgrp

**Řekni:** „Příkaz chown mění vlastníka: sudo chown alice soubor.txt, případně vlastníka i skupinu naráz: sudo chown alice:vyvojari soubor.txt. Příkaz chgrp mění samostatně skupinu. Tuto operaci smí z bezpečnostních důvodů provádět pouze správce root.“

**Zapojení / ukázka:** Vysvětlete, proč běžný uživatel nemůže své soubory jen tak 'přehodit' na někoho jiného.

**Přechod:** „Co přesně je příkaz sudo a jak funguje?“

## 60. sudo

**Řekni:** „Příkaz sudo (superuser do) umožní oprávněnému uživateli spustit konkrétní příkaz s plnými administrátorskými právy uživatele root. sudo není kouzelná hůlka na opravu chyb - používejte ho jen tehdy, když přesně víte, jaký systémový zásah provádíte.“

**Zapojení / ukázka:** Zdůrazněte: „Při psaní hesla k sudo se na obrazovce z bezpečnostních důvodů nezobrazují žádné hvězdičky ani tečky - píšete naslepo a potvrdíte Enterem.“

**Přechod:** „Jak systém určuje výchozí práva pro nově vytvořené soubory?“

## 61. Umask

**Řekni:** „Nástroj umask funguje jako filtr, který odebírá výchozí práva nově vznikajícím souborům a složkám. Výchozí hodnota 022 způsobí, že nové složky automaticky dostanou práva 755 (777 - 022) a nové soubory 644 (666 - 022).“

**Zapojení / ukázka:** Spusťte v terminálu příkaz umask a podívejte se na aktuální masku.

**Přechod:** „Je důležité pamatovat, že práva souboru nejsou jediným faktorem.“

## 62. Práva nejsou vše

**Řekni:** „Pamatujte na tři zásady: K tomu, abyste soubor smazali, nepotřebujete mít právo zápisu k samotnému souboru - rozhodují práva nadřazeného adresáře! Dále mohou přístup omezovat rozšířená ACL nebo bezpečnostní moduly SELinux/AppArmor.“

**Zapojení / ukázka:** Ukažte zajímavost: pokud máte práva zápisu do složky, můžete smazat i soubor s právy 444.

**Přechod:** „Nyní máme za sebou kompletní základní část a dáme si krátkou přestávku.“

## 63. Přestávka (10 min)

**Řekni:** „Dáme si 10 minut pauzu. Základní látku máme hotovou. V navazující části se podíváme na pokročilejší témata pro fajnšmekry: hlubší fungování shellu, procesy na pozadí, práci s archivy tar a detailní textové filtry.“

**Zapojení / ukázka:** Nechte prostor pro dotazy účastníků k základní části.

**Přechod:** „Pokračujeme pokročilejšími funkcemi shellu.“

## 64. Shell ve větší hloubce

**Řekni:** „V této rozšiřující sekci se podíváme na to, jak shell pracuje s uvozovkami, jak fungují návratové kódy a jak spouštět úlohy na pozadí.“

**Zapojení / ukázka:** Ujistěte účastníky, že tyto znalosti se jim budou skvěle hodit při psaní vlastních skriptů.

**Přechod:** „Jaký je rozdíl mezi jednoduchými a dvojitými uvozovkami?“

## 65. Uvozovky a mezery

**Řekni:** „Jednoduché uvozovky 'text' zachovají text přesně doslova bez jakýchkoliv úprav. Dvojité uvozovky "text" umožní shellu rozbalit proměnné jako $HOME nebo speciální znaky. Pokud uvozovky vynecháte, shell mezeru vyhodnotí jako oddělovač více různých parametrů.“

**Zapojení / ukázka:** Porovnejte v terminálu výstup echo '$HOME' a echo "$HOME".

**Přechod:** „Jak napsat speciální znaky pomocí zpětného lomítka?“

## 66. Escapování

**Řekni:** „Zpětné lomítko \ (escape znak) říká shellu: Následující znak ber jako obyčejné písmeno bez jeho speciální funkce. Tímto způsobem můžeme zapsat znak dolaru \$10 nebo mezeru v názvu souboru bez uvozovek: soubor\ s\ mezerou.txt.“

**Zapojení / ukázka:** Vyzkoušejte echo "Cena je \$100".

**Přechod:** „Jak programy po svém skončení sdělují, zda proběhly úspěšně?“

## 67. Návratový kód

**Řekni:** „Každý příkaz po svém dokončení vrátí celočíselný návratový kód (exit code), který se uloží do speciální proměnné $?. Kód 0 znamená stoprocentní úspěch. Jakékoliv nenulové číslo (1 až 255) signalizuje chybu nebo varování.“

**Zapojení / ukázka:** Spusťte ls /etc a následně echo $? (vrátí 0). Pak zkuste ls /neexistuje a echo $? (vrátí 2).

**Přechod:** „Jak na základě úspěchu či neúspěchu řetězit příkazy?“

## 68. Logické operátory

**Řekni:** „Dva ampersandy && spustí následující příkaz pouze tehdy, když předchozí skončil úspěchem (např. mkdir projekt && cd projekt). Dvě svislítka || naopak spustí další příkaz jen při neúspěchu (např. ping -c 1 server || echo "Server je nedostupný").“

**Zapojení / ukázka:** Vyzkoušejte obě konstrukce v terminálu.

**Přechod:** „Jak si v shellu vytvářet vlastní proměnné?“

## 69. Proměnné shellu

**Řekni:** „Vlastní proměnnou vytvoříme zápisem jmeno="Jan". Pozor: kolem rovnítka nesmí být žádné mezery! Pokud chceme, aby proměnnou viděly i ostatní programy spouštěné z tohoto shellu, musíme ji exportovat pomocí export EDITOR=nano.“

**Zapojení / ukázka:** Zkuste vytvořit proměnnou a vypsat ji přes echo $jmeno.

**Přechod:** „Jak si vytvořit vlastní trvalé zkratky pro dlouhé příkazy?“

## 70. Aliasy

**Řekni:** „Alias je uživatelská zkratka v shellu. Například alias ll='ls -lah' vytvoří příkaz ll. Chceme-li, aby zkratka fungovala i po restartu terminálu, zapíšeme ji do konfiguračního souboru ~/.bashrc.“

**Zapojení / ukázka:** Nechte účastníky nastavit alias ll='ls -lah' a vyzkoušet ho.

**Přechod:** „Jak spustit program tak, aby nám neblokoval terminál?“

## 71. Pozadí a procesy

**Řekni:** „Pokud na konec příkazu přidáme znak ampersand & (např. sleep 60 &), proces poběží na pozadí a terminál zůstane volný pro další práci. Příkaz jobs vypíše běžící úlohy na pozadí a fg vrátí úlohu zpět do popředí.“

**Zapojení / ukázka:** Spusťte sleep 30 &, ověřte přes jobs a vraťte do popředí přes fg.

**Přechod:** „Nyní se podíváme hlouběji na souborový systém, odkazy a virtuální složky.“

## 72. Filesystem do hloubky

**Řekni:** „V této části si vysvětlíme symbolické a pevné linky, připojování disků a nahlédneme do virtuálních adresářů jádra /proc a /sys.“

**Zapojení / ukázka:** Uveďte, že pochopení odkazů ušetří spoustu místa na disku.

**Přechod:** „Co je to symbolický odkaz?“

## 73. Symbolické odkazy

**Řekni:** „Symbolický odkaz (symlink) vytvoříme příkazem ln -s <cíl> <název_odkazu>. Je to obdoba zástupce z Windows - malý soubor, který pouze ukazuje na jinou cestu. Ve výpisu ls -l ho poznáte podle počátečního písmene l a šipky ->.“

**Zapojení / ukázka:** Vytvořte symlink ln -s /var/log moje-logy a otevřete přes něj soubor.

**Přechod:** „Jak se od symbolického liší pevný odkaz?“

## 74. Pevné odkazy

**Řekni:** „Pevný odkaz (hard link) vytvoříme příkazem ln puvodni.txt kopie.txt. Je to další rovnocenný název pro stejný datový blok na disku (stejný inode). Smazáním jednoho jména data nezmizí, dokud existuje alespoň jeden pevný odkaz. Nelze ho vytvořit pro složky ani přes různé disky.“

**Zapojení / ukázka:** Ukažte shodu čísel inode pomocí příkazu ls -li.

**Přechod:** „Jak systém připojuje disky a oddíly?“

## 75. Připojené filesystémy

**Řekni:** „Disky a USB flashky se v Linuxu zpřístupňují připojením (mountováním) do konkrétní složky. Příkaz lsblk přehledně vypíše strom všech blokových zařízení a oddílů, findmnt ukáže jejich přípojné body a df -hT zobrazí typ souborového systému (ext4, btrfs apod.).“

**Zapojení / ukázka:** Nechte účastníky spustit lsblk a prozkoumat diskové oddíly.

**Přechod:** „Jak Linux reprezentuje hardware v adresáři /dev?“

## 76. Zařízení v /dev

**Řekni:** „Ve složce /dev reprezentuje Linux zařízení jako speciální soubory. Tři nejznámější jsou: /dev/null (černá díra, co do ní zapíšete, to zahodí), /dev/zero (nekonečný zdroj nulových bajtů) a /dev/random (zdroj kryptograficky bezpečných náhodných dat).“

**Zapojení / ukázka:** Spusťte head -c 10 /dev/random | xxd a ukažte náhodné bajty.

**Přechod:** „Co najdeme ve virtuálních složkách /proc a /sys?“

## 77. Virtuální /proc a /sys

**Řekni:** „Adresáře /proc a /sys neexistují na fyzickém disku - generuje je přímo linuxové jádro v RAM. Například soubor /proc/cpuinfo obsahuje parametry procesoru a /proc/meminfo aktuální stav operační paměti.“

**Zapojení / ukázka:** Zkuste cat /proc/cpuinfo | grep "model name" a zjistěte model vašeho CPU.

**Přechod:** „Jak v Linuxu vytvářet a rozbalovat archivy souborů?“

## 78. Archivace pomocí tar

**Řekni:** „Nástroj tar spojuje více souborů do jednoho archivu a obvykle je komprimuje přes gzip (.tar.gz). Pamatujte si zkratky: tar -czf archiv.tar.gz slozka/ archiv vytvoří (c=create), tar -xzf archiv.tar.gz ho rozbalí (x=extract) a tar -tzf vypíše jeho obsah (t=list).“

**Zapojení / ukázka:** Vytvořte zkušební archiv složky a následně ho rozbalte.

**Přechod:** „Pojďme si shrnout, jaký nástroj zvolit pro jakou situaci.“

## 79. Výběr správného nástroje

**Řekni:** „Rychlý přehled pro orientaci: Hledáte podle názvu souboru? Použijte find. Hledáte text uvnitř souboru? Použijte grep. Chcete vědět velikost složky? Použijte du -sh. Chcete vědět volné místo na disku? Použijte df -h. A pro zjištění typu souboru poslouží file.“

**Zapojení / ukázka:** Projděte souhrnnou tabulku na slajdu.

**Přechod:** „Podíváme se na pokročilé nástroje pro zpracování textových proudů.“

## 80. Textové nástroje

**Řekni:** „V této části si ukážeme nástroje pro třídění, řezání sloupců a hromadné úpravy textu: sort, uniq, cut, tr, sed a xargs.“

**Zapojení / ukázka:** Uveďte, že tyto nástroje umožňují provádět komplexní datovou analýzu bez nutnosti programování.

**Přechod:** „Začneme řazením a počítáním unikátních řádků.“

## 81. sort, uniq a wc

**Řekni:** „Příkaz sort seřadí řádky podle abecedy nebo číselně. uniq odstraní sousední duplicitní řádky (s přepínačem -c spočítá výskyty každé položky). A příkaz wc -l spočítá celkový počet řádků textu.“

**Zapojení / ukázka:** Spusťte cat /etc/passwd | cut -d: -f7 | sort | uniq -c a spočítejte, kolik uživatelů používá který shell.

**Přechod:** „Jak z řádků vyříznout konkrétní sloupec nebo nahradit písmena?“

## 82. cut a tr

**Řekni:** „Příkaz cut -d: -f1 /etc/passwd rozdělí řádek podle dvojtečky a vybere 1. pole (uživatelská jména). Nástroj tr slouží k transformaci znaků na vstupu, například převede malá písmena na velká: tr '[:lower:]' '[:upper:]'.“

**Zapojení / ukázka:** Vyzkoušejte echo "letni skola siti" | tr '[:lower:]' '[:upper:]'.

**Přechod:** „Jak provádět automatické úpravy a nahrazování textu pomocí regulárních výrazů?“

## 83. sed - jednoduché úpravy

**Řekni:** „Stream editor sed slouží k rychlým úpravám textu. Zápis sed 's/staré/nové/g' soubor.txt nahradí všechny výskyty v textu. Přepínač -i provede úpravu přímo v souboru a -i.bak navíc před úpravou vytvoří bezpečnostní zálohu.“

**Zapojení / ukázka:** Vyzkoušejte nahrazení slova v testovacím textu.

**Přechod:** „Jak předat textový výstup z roury jako parametry na příkazový řádek?“

## 84. xargs

**Řekni:** „Nástroj xargs čte položky ze standardního vstupu a spouští s nimi zadaný příkaz jako parametry. V kombinaci find . -name "*.tmp" -print0 | xargs -0 rm bezpečně smaže všechny nalezené soubory i v případě, že jejich názvy obsahují mezery.“

**Zapojení / ukázka:** Předveďte vyhledání a zjištění typu souborů: find . -type f -print0 | xargs -0 file.

**Přechod:** „Méně je někdy více - vyhněte se zbytečným rourám.“

## 85. Když je lepší použít méně

**Řekni:** „Častou začátečnickou chybou je zbytečné psaní cat soubor.txt | grep text. Nástroj grep i většina ostatních utilit umí číst soubor přímo ze zadaného parametru: grep text soubor.txt. Je to rychlejší, úspornější a přehlednější.“

**Zapojení / ukázka:** Ukažte rozdíl v zápisu na obrazovce.

**Přechod:** „Podíváme se na pokročilá bezpečnostní oprávnění: sticky bit, setuid a ACL.“

## 86. Oprávnění do hloubky

**Řekni:** „Kromě základních práv rwx nabízí Linux speciální přístupové bity pro sdílené složky a jemnější řízení přístupu přes ACL.“

**Zapojení / ukázka:** Zeptejte se: „Napadá vás, jak zařídit, aby ve sdílené složce mohl každý vytvářet soubory, ale nikdo nemohl mazat soubory cizí?“

**Přechod:** „K tomu slouží takzvaný Sticky bit.“

## 87. Práva adresáře v praxi

**Řekni:** „Zopakujme si chování práv na složkách: r umožňuje číst seznam jmen souborů, w dovoluje soubory tvořit, přejmenovávat a mazat, a x je nutné pro vstup do složky a přístup k souborům uvnitř.“

**Zapojení / ukázka:** Upozorněte: „Bez práva x na složce si nepřečtete ani soubor uvnitř, i kdyby měl práva 777.“

**Přechod:** „Jak přesně funguje Sticky bit na sdílených složkách?“

## 88. Sticky bit

**Řekni:** „Sticky bit (písmeno t na konci práv, např. drwxrwxrwt) zajistí, že ve sdílené složce smí soubor smazat nebo přejmenovat pouze jeho skutečný vlastník nebo root. Typickým příkladem je systémová složka /tmp.“

**Zapojení / ukázka:** Spusťte ls -ld /tmp a ukažte studentům písmeno t na konci oprávnění.

**Přechod:** „Co znamenají speciální bity Setuid a Setgid?“

## 89. Setuid a setgid

**Řekni:** „Setuid (písmeno s u práv vlastníka) způsobí, že se program spouští s právy vlastníka souboru namísto práv spouštějícího uživatele. Díky tomu může například běžný uživatel spustit `/usr/bin/passwd` a bezpečně si změnit heslo v systému. Setgid na složce zase zajistí dědění skupiny.“

**Zapojení / ukázka:** Spusťte `ls -l /usr/bin/passwd` a ukažte příznak `-rwsr-xr-x`.

**Přechod:** „Jak nastavit jemnější pravidla pro více uživatelů pomocí ACL?“

## 90. ACL

**Řekni:** „Access Control Lists (ACL) umožňují přiřadit specifická práva konkrétním uživatelům nebo skupinám nad rámec standardní trojice vlastník-skupina-ostatní. Pro čtení slouží `getfacl <soubor>` a pro nastavení `setfacl -m u:alice:rw <soubor>`.“

**Zapojení / ukázka:** Vyzkoušejte `getfacl` na libovolný soubor a ukažte rozšířenou tabulku práv.

**Přechod:** „Jak ověřit práva celé cesty před provedením změny?“

## 91. Audit před změnou

**Řekni:** „Před úpravami oprávnění se hodí tři kontrolní příkazy: `ls -ld <složka>` pro ověření práv samotného adresáře, `namei -l <cesta>` pro vypsání práv všech nadřazených složek v cestě a `stat <soubor>` pro kompletní metadata a časy.“

**Zapojení / ukázka:** Spusťte `namei -l /var/log/syslog` a sledujte přehledný strom oprávnění.

**Přechod:** „Pojďme si všechny získané znalosti vyzkoušet v praktickém cvičení.“

## 92. Praktické cvičení

**Řekni:** „Nyní si v samostatném čtyřkrokovém cvičení ověříme vše, co jsme se dnes naučili: vytvoříme pracovní prostor, naplníme soubory, vyzkoušíme přesun a vyhledávání a nastavíme správná oprávnění.“

**Zapojení / ukázka:** Vyzvěte všechny, aby postupovali podle instrukcí na následujících čtyřech slajdech.

**Přechod:** „Krok 1: Příprava pracovního prostoru.“

## 93. 1. Připrav pracovní prostor

**Řekni:** „Vytvořte si ve svém domovském adresáři složku `linux-cviceni` se dvěma podsložkami `data` a `zaloha`. Přepněte se do ní, ověřte svou polohu přes `pwd` a vypište obsah přes `ls -la`.“

**Zapojení / ukázka:** Příkazy: `mkdir -p ~/linux-cviceni/{data,zaloha}`, `cd ~/linux-cviceni`, `pwd`, `ls -la`.

**Přechod:** „Krok 2: Vytvoření a naplnění souboru.“

## 94. 2. Vytvoř a naplň soubor

**Řekni:** „Vytvořte soubor `data/poznamky.txt` a zapište do něj dva řádky textu pomocí operátorů `>` a `>>`. Následně si výsledek zkontrolujte příkazem `cat`.“

**Zapojení / ukázka:** Příkazy: `echo "Úvod do Linuxu" > data/poznamky.txt`, `echo "Druhý řádek" >> data/poznamky.txt`, `cat data/poznamky.txt`.

**Přechod:** „Krok 3: Kopírování, přejmenování a vyhledávání.“

## 95. 3. Kopie, přesun, hledání

**Řekni:** „Zkopírujte soubor do složky `zaloha/`, původní soubor přejmenujte na `linux.txt`, vyhledejte všechny textové soubory přes `find` a prohledejte obsah pomocí `grep`.“

**Zapojení / ukázka:** Příkazy: `cp data/poznamky.txt zaloha/`, `mv data/poznamky.txt data/linux.txt`, `find . -name "*.txt"`, `grep -n "Linux" data/linux.txt`.

**Přechod:** „Krok 4: Nastavení striktních oprávnění.“

## 96. 4. Oprávnění

**Řekni:** „Zkontrolujte aktuální práva souboru `data/linux.txt`, nastavte mu práva `600` (pouze pro čtení a zápis vlastníka) a popište, co znamená výsledek `-rw-------`.“

**Zapojení / ukázka:** Příkazy: `ls -l data/linux.txt`, `chmod 600 data/linux.txt`, `ls -l data/linux.txt`.

**Přechod:** „Pojďme si na závěr ověřit pochopení látky 5 kontrolními otázkami.“

## 97. Kontrolní otázky

**Řekni:** „Pojďme si společně projít 5 rychlých otázek: 1. Jaký je rozdíl mezi terminálem a shellem? 2. Jak se liší absolutní a relativní cesta? 3. Co dělá `>` a co `>>`? 4. Co znamená číselné oprávnění `chmod 754`? 5. Proč je příkaz `rm -rf` nebezpečný?“

**Zapojení / ukázka:** Nechte jednotlivé účastníky dobrovolně odpovídat a doplňujte jejich odpovědi.

**Přechod:** „Máme hotovo!“

## 98. Hotovo

**Řekni:** „Skvělá práce! Prošli jsme kompletní základy Linuxu od terminálu až po práva, roury a vyhledávání. Tento základ budeme odteď využívat každý den.“

**Zapojení / ukázka:** Poblahopřejte všem k úspěšnému absolvování 1. bloku a zeptejte se na dojmy.

**Přechod:** „Přejdeme k navazující prezentaci: Základy sítí.“
