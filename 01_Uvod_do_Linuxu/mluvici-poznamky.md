# Mluvené poznámky ke každému slajdu — Letní škola sítí: 1. Úvod do Linuxu

Scénář je psaný pro úplné začátečníky. Není potřeba učit se ho doslova. Text po značce **Řekni** můžeš použít skoro jako hotovou formulaci, **Zapojení / ukázka** říká, co máš udělat s publikem, a **Přechod** ti pomůže plynule n   avázat.

U příkazů nečti kód z obrazovky jako holý text – vysvětli nejprve účel příkazu, pak vylož jeho příznaky (flags) a argumenty.

## Doporučené tempo

- Slajdy 1–9: Úvod, kernel vs GNU, distribuce a Unixová filozofie, přibližně 25 minut.
- Slajdy 10–20: Terminál, shell, nápověda, bezpečné návyky a info o systému, přibližně 35 minut.
- Slajdy 21–43: Souborový systém, navigace, vytváření, čtení, mazání a globy, přibližně 60 minut.
- Slajd 44: Přestávka (10 min).
- Slajdy 45–51: Vyhledávání, grep, roury a přesměrování výstupu, přibližně 45 minut.
- Slajdy 52–62: Uživatelé, skupiny, oprávnění (chmod, chown, sudo, umask), přibližně 45 minut.
- Slajd 63: Přestávka (10 min).
- Slajdy 64–71: Shell ve větší hloubce, uvozovky, návratové kódy a procesy, přibližně 30 minut.
- Slajdy 72–79: Filesystem do hloubky, symlinky, /proc, /sys a tar, přibližně 30 minut.
- Slajdy 80–91: Pokročilé textové nástroje (sed, xargs, sticky bit, ACL), přibližně 30 minut.
- Slajdy 92–98: Praktická cvičení, kontrolní otázky a závěr, přibližně 30–45 minut.

---

## 1. Úvod do Linuxu

**Řekni:** „Vítám vás u prvního bloku výuky. Dnes se naučíme ovládat operační systém Linux z rozhraní příkazového řádku – terminálu.“

**Zapojení / ukázka:** Zeptej se: „Kdo z vás už někdy viděl černé okno terminálu a bál se do něj cokoliv napsat?“

**Přechod:** „Pojďme si ukázat přehled toho, co dnes společně zvládneme.“

## 2. Co dnes zvládneme

**Řekni:** „Dnes zvládneš základy rozhraní shellu, souborový systém, práci s uživatelskými právy, vyhledávání, přesměrování výstupů a základy procesů.“

**Zapojení / ukázka:** Ujisti všechny: „Začínáme od nuly, tempo přizpůsobíme tak, aby nikdo nezůstal pozadu.“

**Přechod:** „Nejdříve si musíme ujasnit, co vlastně slovo Linux znamená.“

## 3. Co je Linux?

**Řekni:** „Linux je open-source operační systém. Původně ho v roce 1991 vytvořil Linus Torvalds jako volně dostupný koncept jádra.“

**Zapojení / ukázka:** Zeptej se: „Víte, jaký je rozdíl mezi volným softwarem a komerčním systémem jako Windows?“

**Přechod:** „Důležité je vědět, že samotný Kernel ještě není celý operační systém.“

## 4. Kernel není celý systém

**Řekni:** „Kernel je jádro – vrstva, která komunikuje přímo s hardwerem (procesor, paměť, disky). Samotné jádro ale uživateli nestačí.“

**Zapojení / ukázka:** Ukaž schéma: Jádo doplňují systémové nástroje, knihovny a uživatelské rozhraní.

**Přechod:** „A právě tyto uživatelské nástroje pocházejí z projektu GNU.“

## 5. GNU

**Řekni:** „Projekt GNU založil Richard Stallman. Poskytl svobodné utility jako kompilátory, shelly a základní unixové příkazy. Proto správné označení systému je GNU/Linux.“

**Zapojení / ukázka:** Zeptej se pro odlehčení: „Kdo ví, co znamená zkratka GNU? (GNU's Not Unix).“

**Přechod:** „Kde všude se dnes s Linuxem setkáte?“

## 6. Kde Linux potkáš?

**Řekni:** „Linux potkáte všude: běží na něm drtivá většina webových serverů, superpočítače, mobilní telefony Android, routery i chytrá elektronika.“

**Zapojení / ukázka:** Vyzvy účastníky: „Vytáhněte telefon – pokud máte Android, nosíte v kapse linuxové jádro.“

**Přechod:** „Proč vlastně dávají vývojáři a síťaři přednost Linuxu?“

## 7. Proč Linux?

**Řekni:** „Hlavní výhody jsou: stabilitu, vysoký výkon, bezpečnost, nulové licenční poplatky a kompletní kontrolu nad systémem.“

**Zapojení / ukázka:** Ukaž kontrast: V Linuxu nic neprobíhá za vašimi zády bez vašeho vědomí.

**Přechod:** „Jak se tyto systémy distribuují uživatelům?“

## 8. Distribuce
 

**Zapojení / ukázka:** Zeptej se: „Vyzkoušel už někdo z vás nějakou linuxovou distribuci doma?“

**Přechod:** „Důležitým filozofickým základem Linuxu je Unixová filozofie.“

## 9. Filozofie Unixu

**Řekni:** „Unixová filozofie říká: Dělej jednu věc a dělej ji dobře. Programy spolu komunikují pomocí textu a vše v systému je reprezentováno jako soubor.“

**Zapojení / ukázka:** Zdůrazni: Tento princip spojování malých nástrojů do velkých řetězců uvidíme za chvíli u rour.

**Přechod:** „Nyní si otevřeme terminál a vysvětlíme si základní pojmy.“

## 10. Terminál, shell a příkaz

**Řekni:** „Terminál je aplikace/okno. Shell je interpreter, který čte příkazy a spouští je (např. Bash, Zsh). Příkaz je instrukce pro systém.“

**Zapojení / ukázka:** Nechte účastníky otevřít okno terminálu.

**Přechod:** „Co znamenají značky na začátku řádku terminálu?“

## 11. Prompt

**Řekni:** „Příkazová výzva (Prompt) ukazuje: jméno uživatele (`student`), jméno stroje (`pc`), aktuální adresář (`~`) a symbol znaku (`$` pro běžného uživatele, `#` pro root).“

**Zapojení / ukázka:** Zkontroluj, že všichni vidí ve svém terminálu znak `$`.

**Přechod:** „Z jakých částí se skládá samotný příkaz?“

## 12. Anatomie příkazu

**Řekni:** „Anatomie příkazu se skládá z: název příkazu (`ls`), volby/příznaky (`-la`) a argumenty (`/var/log`).“

**Zapojení / ukázka:** Ukaž rozdíl mezi spuštěním samotného `ls` a `ls -l`.

**Přechod:** „Když nevím, co příkaz dělá, jak získám nápovědu?“

## 13. Nápověda

**Řekni:** „Nápovědu získáš pomocí `man <příkaz>` (manuálové stránky, ukončíš stiskem `q`), `--help` nebo vestavěného `help` pro shell prkazy.“

**Zapojení / ukázka:** Nechte všechny vyzkoušet napište `man ls` a opustit klávesou `q`.

**Přechod:** „Jak si ušetřit psaní pomocí klávesových zkratek?“

## 14. Historie a doplňování

**Řekni:** „Šipky nahoru/dolů prochází historii, klávesa Tab automaticky doplňuje cesty, `Ctrl+C` zastaví proces a `Ctrl+L` vyčistí obrazovku.“

**Zapojení / ukázka:** Předveď rychlé doplnění Tabulátorem v terminálu.

**Přechod:** „Dříve než začneme zkoušet další příkazy, řekněme si pravidla bezpečnosti.“

## 15. Bezpečné návyky

**Řekni:** „Než něco smažeš, zkontroluj cestu (`pwd`). Cesty s mezerami dávej do uvozovek. Nikdy nespouštěj cizí skripty bez přečtení a před `sudo` vždy přemýšlej.“

**Zapojení / ukázka:** Zdůrazni: V terminálu neexistuje tlačítko 'Zpět'.

**Přechod:** „Pojďme si zjistit základní informace o našem počítači.“

## 16. Základní informace o systému

**Řekni:** Vysvětli téma slajdu "Základní informace o systému". 

**Zapojení / ukázka:** Polož publiku otázku k tématu slajdu nebo nechte účastníky vyzkoušet příkaz v terminálu.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 17. Kdo jsem?

**Řekni:** Vysvětli téma slajdu "Kdo jsem?". Projdi následující klíčové body: whoamivypíše aktuální uživatelské jméno., idpřidá UID, primární skupinu a další skupiny.. Na obrazovce ukaž příkaz/zápis `whoami
id` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 18. Stroj a systém

**Řekni:** Vysvětli téma slajdu "Stroj a systém". Projdi následující klíčové body: hostname— název počítače., uname -a— informace o jádře a architektuře., /etc/os-release— informace o distribuci.. Na obrazovce ukaž příkaz/zápis `hostname
uname -a
cat /etc/os-release` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 19. Čas a kalendář

**Řekni:** Vysvětli téma slajdu "Čas a kalendář". dateukazuje aktuální datum a čas.calzobrazí kalendář (pokud je nainstalovaný). Na obrazovce ukaž příkaz/zápis `date
cal` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 20. Echo a proměnné

**Řekni:** Vysvětli téma slajdu "Echo a proměnné". Projdi následující klíčové body: echovypisuje text., $HOMEje domovský adresář aktuálního uživatele., $SHELLukazuje výchozí shell.. Na obrazovce ukaž příkaz/zápis `echo "Ahoj světe"
echo $HOME
echo $SHELL` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.  

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 21. Souborový systém

**Řekni:** Vysvětli téma slajdu "Souborový systém". 

**Zapojení / ukázka:** Polož publiku otázku k tématu slajdu nebo nechte účastníky vyzkoušet příkaz v terminálu.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 22. Strom adresářů

**Řekni:** Vysvětli téma slajdu "Strom adresářů". Na obrazovce ukaž příkaz/zápis `/
├── home/     domovské adresáře uživatelů
├── etc/      konfigurace systému a služeb
├── usr/      programy, knihovny a sdílená data
├── var/      proměnlivá data, například logy
├── tmp/      dočasné soubory
├── dev/      zařízení jako soubory
└── proc/     informace o procesech a jádře` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 23. Důležité cesty

**Řekni:** Vysvětli téma slajdu "Důležité cesty". Projdi následující klíčové body: /— kořen souborového systému, root., /home/alice— domovský adresář běžného uživatele., /root— domovský adresář administrátora root., /var/log— systémové a aplikační logy., /tmp— dočasná data; nespoléhej, že přežijí restart.. Na obrazovce ukaž příkaz/zápis `/` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 24. Absolutní a relativní cesty

**Řekni:** Vysvětli téma slajdu "Absolutní a relativní cesty". Začíná lomítkem a vždy vede od kořene. Vychází z aktuálního adresáře. Na obrazovce ukaž příkaz/zápis `/home/student/poznamky.txt` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 25. Speciální zápisy cest

**Řekni:** Vysvětli téma slajdu "Speciální zápisy cest". Napříkladcd ~tě vrátí domů acd -přepne zpět na předchozí cestu. Na obrazovce ukaž příkaz/zápis `.       # aktuální adresář
..      # nadřazený adresář
~       # domovský adresář
-       # předchozí adresář` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 26. pwd — kde právě jsem?

**Řekni:** Vysvětli téma slajdu "pwd — kde právě jsem?". pwdznamenáprint working directorya vypíše absolutní cestu aktuálního adresáře. Na obrazovce ukaž příkaz/zápis `pwd
# /home/student/projekty` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 27. cd — změna adresáře

**Řekni:** Vysvětli téma slajdu "cd — změna adresáře". Projdi následující klíčové body: Bez argumentucdvede do domovského adresáře., Jména rozlišují velká a malá písmena:Dokumenty≠dokumenty.. Na obrazovce ukaž příkaz/zápis `cd /var/log
cd dokumenty
cd ..
cd ~` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 28. ls — výpis obsahu

**Řekni:** Vysvětli téma slajdu "ls — výpis obsahu". Projdi následující klíčové body: -lpodrobný výpis, -avčetně skrytých položek, -hčitelné velikosti. Na obrazovce ukaž příkaz/zápis `ls
ls -l
ls -a
ls -lah` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 29. Jak číst ls -l

**Řekni:** Vysvětli téma slajdu "Jak číst ls -l". Projdi následující klíčové body: typ a oprávnění, počet odkazů, vlastník a skupina, velikost, datum, název. Na obrazovce ukaž příkaz/zápis `-rw-r--r--  1 student studenti  1240  9. srp  poznamky.txt` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 30. Skryté soubory

**Řekni:** Vysvětli téma slajdu "Skryté soubory". Název začínající tečkou je běžně skrytý. Nejde o bezpečnostní mechanismus — pouze se ve výchozím výpisu nezobrazuje. Na obrazovce ukaž příkaz/zápis `ls -a
.bashrc  .config  .ssh` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 31. Vytváření a čtení souborů

**Řekni:** Vysvětli téma slajdu "Vytváření a čtení souborů". 

**Zapojení / ukázka:** Polož publiku otázku k tématu slajdu nebo nechte účastníky vyzkoušet příkaz v terminálu.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 32. mkdir — nový adresář

**Řekni:** Vysvětli téma slajdu "mkdir — nový adresář". -pvytvoří i chybějící nadřazené adresáře a nevadí mu, když už existují. Na obrazovce ukaž příkaz/zápis `mkdir projekt
mkdir -p projekt/src/js` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 33. touch — prázdný soubor

**Řekni:** Vysvětli téma slajdu "touch — prázdný soubor". Pokud soubor existuje,touchaktualizuje jeho časové razítko. Na obrazovce ukaž příkaz/zápis `touch poznamky.txt
touch index.html style.css` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 34. cat, less a head

**Řekni:** Vysvětli téma slajdu "cat, less a head". Projdi následující klíčové body: catse hodí na krátké soubory., lessumožní stránkování a hledání; ukončíšq., head/tailukáží začátek/konec.. Na obrazovce ukaž příkaz/zápis `cat poznamky.txt
less /var/log/syslog
head -n 20 soubor.txt
tail -n 20 soubor.txt` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 35. tail -f — sledování logu

**Řekni:** Vysvětli téma slajdu "tail -f — sledování logu". Průběžně vypisuje nové řádky. Ukonči pomocíCtrl+C. Na obrazovce ukaž příkaz/zápis `tail -f /var/log/auth.log` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 36. nano — jednoduchý editor

**Řekni:** Vysvětli téma slajdu "nano — jednoduchý editor". Projdi následující klíčové body: Nápověda je dole v okně; znak^znamenáCtrl., Ctrl+Ouloží,Ctrl+Xukončí., Pro první práci na serveru jenanonejpřívětivější.. Na obrazovce ukaž příkaz/zápis `nano poznamky.txt` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 37. cp — kopírování

**Řekni:** Vysvětli téma slajdu "cp — kopírování". -rkopíruje adresář rekurzivně včetně jeho obsahu. Na obrazovce ukaž příkaz/zápis `cp poznamky.txt zaloga.txt
cp -r projekt projekt-zaloha` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 38. mv — přesun a přejmenování

**Řekni:** Vysvětli téma slajdu "mv — přesun a přejmenování". Stejný příkaz soubor přejmenuje, nebo ho přesune — záleží na cíli. Na obrazovce ukaž příkaz/zápis `mv stary.txt novy.txt
mv poznamky.txt dokumenty/` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 39. rm a rmdir

**Řekni:** Vysvětli téma slajdu "rm a rmdir". Na obrazovce ukaž příkaz/zápis `rmdir prazdna-slozka
rm soubor.txt
rm -r adresar` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 40. Bezpečnější mazání

**Řekni:** Vysvětli téma slajdu "Bezpečnější mazání". Projdi následující klíčové body: -ise ptá před odstraněním., -Ise zeptá jednou před hromadným/rekurzivním mazáním., -vvypisuje, co se děje.. Na obrazovce ukaž příkaz/zápis `rm -i soubor.txt
rm -Iv adresar/` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 41. Globy: více souborů najednou

**Řekni:** Vysvětli téma slajdu "Globy: více souborů najednou". Projdi následující klíčové body: *znamená libovolný počet znaků., ?znamená právě jeden znak., --ukončí volby — hodí se pro názvy začínající pomlčkou.. Na obrazovce ukaž příkaz/zápis `ls *.txt
cp obrazek?.png galerie/
rm -- *.tmp` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 42. file — skutečný typ souboru

**Řekni:** Vysvětli téma slajdu "file — skutečný typ souboru". Linux nebere příponu jako autoritu; nástrojfilezkoumá obsah a hlavičku souboru. Na obrazovce ukaž příkaz/zápis `file dokument.docx
# Microsoft Word 2007+` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 43. tree a velikost

**Řekni:** Vysvětli téma slajdu "tree a velikost". Projdi následující klíčové body: treevypíše strom adresářů (nemusí být nainstalovaný)., du -shvelikost konkrétní cesty., df -hvolné místo na připojených filesystémech.. Na obrazovce ukaž příkaz/zápis `tree
du -sh projekt/
df -h` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 44. Přestávka (10 min)

**Řekni:** „Máme za sebou první velký blok práce se soubory. Dáme si 10 minut přestávku na vyvětrání a kávu/vodu.“

**Zapojení / ukázka:** Vyhlašte pauzu a nastavte časovač 10 minut.

**Přechod:** „Po přestávce se podíváme na vyhledávání a filtrování textu.“

## 45. Vyhledávání a zpracování textu

**Řekni:** Vysvětli téma slajdu "Vyhledávání a zpracování textu". 

**Zapojení / ukázka:** Polož publiku otázku k tématu slajdu nebo nechte účastníky vyzkoušet příkaz v terminálu.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 46. find — hledání podle vlastností

**Řekni:** Vysvětli téma slajdu "find — hledání podle vlastností". findprochází strom adresářů. Tečka znamená „začni zde“. Na obrazovce ukaž příkaz/zápis `find . -name "*.txt"
find ~/Dokumenty -type f
find . -type d -name "node_modules"` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 47. grep — hledání v obsahu

**Řekni:** Vysvětli téma slajdu "grep — hledání v obsahu". Projdi následující klíčové body: -iignoruje velikost písmen., -rhledá rekurzivně., -npřidá čísla řádků.. Na obrazovce ukaž příkaz/zápis `grep "chyba" aplikace.log
grep -i "linux" poznamky.txt
grep -rn "TODO" projekt/` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 48. Roura |

**Řekni:** Vysvětli téma slajdu "Roura |". Operátor|pošle standardní výstup prvního programu na standardní vstup dalšího. Na obrazovce ukaž příkaz/zápis `ls -la | less
ps aux | grep nginx
cat pristupy.log | grep "404"` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 49. Přesměrování výstupu

**Řekni:** Vysvětli téma slajdu "Přesměrování výstupu". Projdi následující klíčové body: >soubor vytvoří nebo přepíše., >>výstup přidá na konec souboru., Před použitím>se vždy zastav: přepis je tichý.. Na obrazovce ukaž příkaz/zápis `echo "Ahoj" > pozdrav.txt
echo "Druhý řádek" >> pozdrav.txt
ls -la > vypis.txt` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 50. Chyby: stderr

**Řekni:** Vysvětli téma slajdu "Chyby: stderr". Projdi následující klíčové body: 1je standardní výstup,2standardní chybový výstup., 2>&1spojí chyby s běžným výstupem., /dev/nulldata zahodí.. Na obrazovce ukaž příkaz/zápis `prikaz > vystup.txt 2> chyby.txt
prikaz > vse.txt 2>&1
prikaz 2>/dev/null` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 51. Praktický řetězec

**Řekni:** Vysvětli téma slajdu "Praktický řetězec". Malé nástroje lze poskládat do užitečného pracovního postupu. Na obrazovce ukaž příkaz/zápis `find . -type f -name "*.log" | sort > seznam-logu.txt
grep -ri "error" /var/log 2>/dev/null | less` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 52. Uživatelé, skupiny a práva

**Řekni:** Vysvětli téma slajdu "Uživatelé, skupiny a práva". 

**Zapojení / ukázka:** Polož publiku otázku k tématu slajdu nebo nechte účastníky vyzkoušet příkaz v terminálu.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 53. Vlastník, skupina, ostatní

**Řekni:** Vysvětli téma slajdu "Vlastník, skupina, ostatní". Projdi následující klíčové body: aliceje vlastník souboru., vyvojarije skupina., Práva se vyhodnocují pro vlastníka, pak skupinu, jinak pro ostatní.. Na obrazovce ukaž příkaz/zápis `-rwxr-x--- 1 alice vyvojari  523 start.sh` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 54. r, w, x

**Řekni:** Vysvětli téma slajdu "r, w, x". Projdi následující klíčové body: rčtení obsahu, wzměna obsahu, xspuštění jako programu, rvýpis jmen, wvytváření/mazání položek, xprůchod do adresáře. Na obrazovce ukaž příkaz/zápis `r` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 55. Rozebrání oprávnění

**Řekni:** Vysvětli téma slajdu "Rozebrání oprávnění". První znak určuje typ:-soubor,dadresář,lsymbolický odkaz. Na obrazovce ukaž příkaz/zápis `- rwx r-x r--
  │   │   └─ ostatní: čtení
  │   └───── skupina: čtení, spuštění
  └───────── vlastník: čtení, zápis, spuštění` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 56. Číselný zápis práv

**Řekni:** Vysvětli téma slajdu "Číselný zápis práv". Trojice754znamená vlastníkrwx, skupinar-x, ostatnír--. Na obrazovce ukaž příkaz/zápis `r = 4   w = 2   x = 1

7 = rwx   6 = rw-   5 = r-x   4 = r--
chmod 754 skript.sh` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 57. chmod — změna práv

**Řekni:** Vysvětli téma slajdu "chmod — změna práv". Projdi následující klíčové body: Číselný zápis nastaví všechna tři pole najednou., Symbolický zápis:uuser,ggroup,oothers,aall.. Na obrazovce ukaž příkaz/zápis `chmod 644 poznamky.txt
chmod 755 skript.sh
chmod u+x skript.sh
chmod g-w soukromy.txt` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 58. Běžná nastavení

**Řekni:** Vysvětli téma slajdu "Běžná nastavení". Na obrazovce ukaž příkaz/zápis `644` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 59. chown a chgrp

**Řekni:** Vysvětli téma slajdu "chown a chgrp". Vlastníka a skupinu mění obvykle jen root nebo vlastník podle pravidel systému. Na obrazovce ukaž příkaz/zápis `sudo chown alice soubor.txt
sudo chown alice:vyvojari soubor.txt
sudo chgrp vyvojari projekt/` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 60. sudo

**Řekni:** Vysvětli téma slajdu "sudo". Projdi následující klíčové body: sudospustí konkrétní příkaz s administrátorskými právy., Není to „opravovač chyb“ — nepoužívej ho bez pochopení příkazu., Pro každodenní práci zůstávej běžným uživatelem.. Na obrazovce ukaž příkaz/zápis `sudo apt update
sudo systemctl restart nginx` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 61. Umask

**Řekni:** Vysvětli téma slajdu "Umask". umaskodebírá výchozí práva nově vytvářeným souborům a adresářům. Častá hodnota022vede typicky k souborům644a adresářům755. Na obrazovce ukaž příkaz/zápis `umask
umask 022` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 62. Práva nejsou vše

**Řekni:** Vysvětli téma slajdu "Práva nejsou vše". Projdi následující klíčové body: Přístup mohou řídit i ACL, SELinux/AppArmor nebo oprávnění síťového úložiště., Na smazání souboru jsou důležitá právaadresáře, ve kterém leží., Ssudoobcházíš běžná omezení — proto je rizikové.. Na obrazovce ukaž příkaz/zápis `sudo` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 63. Přestávka (10 min)

**Řekni:** „Dostali jsme se přes uživatele a práva. Dáme si druhou 10minutovou přestávku na oddych.“

**Zapojení / ukázka:** Vyhlašte pauzu 10 minut.

**Přechod:** „V poslední třetině si probereme shell do hloubky a tar archivaci.“

## 64. Shell ve větší hloubce

**Řekni:** Vysvětli téma slajdu "Shell ve větší hloubce". Méně důležité (jen při dostatku času) 

**Zapojení / ukázka:** Polož publiku otázku k tématu slajdu nebo nechte účastníky vyzkoušet příkaz v terminálu.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 65. Uvozovky a mezery

**Řekni:** Vysvětli téma slajdu "Uvozovky a mezery". Projdi následující klíčové body: Jednoduché uvozovky zachovají text doslova., Dvojité uvozovky rozbalí proměnné jako$HOME., Bez uvozovek shell rozdělí mezeru na více argumentů.. Na obrazovce ukaž příkaz/zápis `touch "moje poznamky.txt"
cat 'moje poznamky.txt'
echo "Jsem v $HOME"
echo 'Jsem v $HOME'` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 66. Escapování

**Řekni:** Vysvětli téma slajdu "Escapování". Zpětné lomítko\říká shellu, že následující znak nemá mít svůj speciální význam. Na obrazovce ukaž příkaz/zápis `echo "Cena je \$10"
echo 'Cena je $10'
touch soubor\ s\ mezerami.txt` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 67. Návratový kód

**Řekni:** Vysvětli téma slajdu "Návratový kód". Projdi následující klíčové body: 0znamená úspěch., Nenulová hodnota znamená chybu nebo jiný stav., Příkazy a skripty tak mohou rozhodovat, co udělat dál.. Na obrazovce ukaž příkaz/zápis `grep "Linux" poznamky.txt
echo $?` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 68. Logické operátory

**Řekni:** Vysvětli téma slajdu "Logické operátory". Projdi následující klíčové body: &&spustí další příkaz jen po úspěchu., ||spustí další příkaz při neúspěchu.. Na obrazovce ukaž příkaz/zápis `mkdir projekt && cd projekt
test -f poznamky.txt && cat poznamky.txt
ping -c 1 example.com || echo "Nedostupné"` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 69. Proměnné shellu

**Řekni:** Vysvětli téma slajdu "Proměnné shellu". Projdi následující klíčové body: Při přiřazení nesmí být mezery kolem=., exportpředá proměnnou i programům spouštěným ze shellu.. Na obrazovce ukaž příkaz/zápis `jmeno="Ada"
echo "Ahoj, $jmeno"
export EDITOR=nano
printenv | less` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 70. Aliasy

**Řekni:** Vysvětli téma slajdu "Aliasy". Alias je zkratka v aktuálním shellu. Trvalé aliasy se obvykle zapisují do~/.bashrcnebo konfigurace používaného shellu. Na obrazovce ukaž příkaz/zápis `alias ll='ls -lah'
alias ..='cd ..'
alias` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 71. Pozadí a procesy

**Řekni:** Vysvětli téma slajdu "Pozadí a procesy". Projdi následující klíčové body: &pustí úlohu na pozadí., jobsukazuje úlohy aktuálního shellu., fgvrátí úlohu do popředí.. Na obrazovce ukaž příkaz/zápis `sleep 60 &
jobs
fg
ps aux | less` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 72. Filesystem do hloubky

**Řekni:** Vysvětli téma slajdu "Filesystem do hloubky". 

**Zapojení / ukázka:** Polož publiku otázku k tématu slajdu nebo nechte účastníky vyzkoušet příkaz v terminálu.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 73. Symbolické odkazy

**Řekni:** Vysvětli téma slajdu "Symbolické odkazy". Symbolický odkaz je speciální soubor ukazující na jinou cestu. Poznáš ho podlelna začátku výpisuls -l. Na obrazovce ukaž příkaz/zápis `ln -s /var/log moje-logy
ls -l moje-logy
cat moje-logy/syslog` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 74. Pevné odkazy

**Řekni:** Vysvětli téma slajdu "Pevné odkazy". Pevný odkaz je další jméno pro stejná data na disku. Nejde vytvořit přes filesystémy ani na adresáře. Na obrazovce ukaž příkaz/zápis `ln puvodni.txt druhe-jmeno.txt
ls -li puvodni.txt druhe-jmeno.txt` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 75. Připojené filesystémy

**Řekni:** Vysvětli téma slajdu "Připojené filesystémy". Projdi následující klíčové body: Disk nebo oddíl se zpřístupní připojením do určitého adresáře., lsblkukáže bloková zařízení., findmntzobrazí strom připojení.. Na obrazovce ukaž příkaz/zápis `mount | less
findmnt
lsblk
df -hT` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 76. Zařízení v /dev

**Řekni:** Vysvětli téma slajdu "Zařízení v /dev". Projdi následující klíčové body: /dev/nullzahazuje data., /dev/zeroposkytuje nulové bajty., /dev/randomposkytuje náhodná data.. Na obrazovce ukaž příkaz/zápis `ls -l /dev/null /dev/zero /dev/random` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 77. Virtuální /proc a /sys

**Řekni:** Vysvětli téma slajdu "Virtuální /proc a /sys". Jádro přes tyto adresáře zpřístupňuje informace o procesech, paměti, zařízeních a systému. Na obrazovce ukaž příkaz/zápis `cat /proc/cpuinfo | less
cat /proc/meminfo | head
ls /sys` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 78. Archivace pomocí tar

**Řekni:** Vysvětli téma slajdu "Archivace pomocí tar". Projdi následující klíčové body: -cvytvoří archiv,-xrozbalí,-tvypíše obsah., -zpoužije gzip,-furčuje název souboru.. Na obrazovce ukaž příkaz/zápis `tar -czf zaloha.tar.gz projekt/
tar -tzf zaloha.tar.gz
tar -xzf zaloha.tar.gz` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 79. Výběr správného nástroje

**Řekni:** Vysvětli téma slajdu "Výběr správného nástroje". Na obrazovce ukaž příkaz/zápis `find` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 80. Textové nástroje

**Řekni:** Vysvětli téma slajdu "Textové nástroje". 

**Zapojení / ukázka:** Polož publiku otázku k tématu slajdu nebo nechte účastníky vyzkoušet příkaz v terminálu.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 81. sort, uniq a wc

**Řekni:** Vysvětli téma slajdu "sort, uniq a wc". Projdi následující klíčové body: sortřadí řádky., uniqodstraní sousední duplicity., wc -lpočítá řádky.. Na obrazovce ukaž příkaz/zápis `sort jmena.txt
sort jmena.txt | uniq
sort jmena.txt | uniq -c
wc -l jmena.txt` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 82. cut a tr

**Řekni:** Vysvětli téma slajdu "cut a tr". cutvybírá sloupce nebo znaky;trnahrazuje či maže znaky. Na obrazovce ukaž příkaz/zápis `cut -d: -f1 /etc/passwd
echo "Linux" | tr '[:upper:]' '[:lower:]'
cut -c1-10 poznamky.txt` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 83. sed — jednoduché úpravy

**Řekni:** Vysvětli téma slajdu "sed — jednoduché úpravy". Projdi následující klíčové body: Bez-ise změněný text jen vypíše., -i.bakupraví soubor a nejdříve vytvoří zálohu.. Na obrazovce ukaž příkaz/zápis `sed 's/staré/nové/g' text.txt
sed -n '1,10p' text.txt
sed -i.bak 's/http:/https:/g' konfigurace.txt` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 84. xargs

**Řekni:** Vysvětli téma slajdu "xargs". xargspřevádí řádky ze vstupu na argumenty příkazu. Kombinace-print0a-0bezpečně zvládne mezery v názvech. Na obrazovce ukaž příkaz/zápis `find . -name "*.tmp" -print0 | xargs -0 rm -i
find . -type f -print0 | xargs -0 file` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 85. Když je lepší použít méně

**Řekni:** Vysvětli téma slajdu "Když je lepší použít méně". Mnoho programů už umí číst soubor přímo. Zbytečná roura scatzhoršuje čitelnost. Na obrazovce ukaž příkaz/zápis `grep -r "TODO" projekt/
# místo: cat soubor | grep TODO` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 86. Oprávnění do hloubky

**Řekni:** Vysvětli téma slajdu "Oprávnění do hloubky". 

**Zapojení / ukázka:** Polož publiku otázku k tématu slajdu nebo nechte účastníky vyzkoušet příkaz v terminálu.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 87. Práva adresáře v praxi

**Řekni:** Vysvětli téma slajdu "Práva adresáře v praxi". Proto se soubor obvykle nemaže podle svých práv, ale podle práv jeho nadřazeného adresáře. Na obrazovce ukaž příkaz/zápis `r` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 88. Sticky bit

**Řekni:** Vysvětli téma slajdu "Sticky bit". Sticky bit na sdíleném adresáři dovolí uživatelům mazat jen jejich vlastní položky. Typický příklad je/tmp. Na obrazovce ukaž příkaz/zápis `ls -ld /tmp
# drwxrwxrwt ... /tmp
sudo chmod +t sdilene/` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 89. Setuid a setgid

**Řekni:** Vysvětli téma slajdu "Setuid a setgid". Projdi následující klíčové body: Setuid spouští program s právy vlastníka souboru., Setgid na adresáři zajistí, že nové položky dědí jeho skupinu., Tyto bity jsou pokročilé a nesmí se nastavovat bez důvodu.. Na obrazovce ukaž příkaz/zápis `ls -l /usr/bin/passwd
# -rwsr-xr-x ... /usr/bin/passwd` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 90. ACL

**Řekni:** Vysvětli téma slajdu "ACL". Access Control Lists přidávají jemnější pravidla než vlastník/skupina/ostatní. Často se používají na sdílených úložištích. Na obrazovce ukaž příkaz/zápis `getfacl sdilene/
setfacl -m u:alice:rw soubor.txt` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 91. Audit před změnou

**Řekni:** Vysvětli téma slajdu "Audit před změnou". Projdi následující klíčové body: ls -ldukáže práva samotného adresáře., namei -lukáže práva každé části cesty., statvypíše podrobná metadata.. Na obrazovce ukaž příkaz/zápis `ls -ld cesta
namei -l cesta/k/souboru
stat soubor.txt` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 92. Praktické cvičení

**Řekni:** Vysvětli téma slajdu "Praktické cvičení". 

**Zapojení / ukázka:** Polož publiku otázku k tématu slajdu nebo nechte účastníky vyzkoušet příkaz v terminálu.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 93. 1. Připrav pracovní prostor

**Řekni:** Vysvětli téma slajdu "1. Připrav pracovní prostor". Vytvoř adresář cvičení se dvěma podsložkami a ověř, kde jsi. Na obrazovce ukaž příkaz/zápis `mkdir -p ~/linux-cviceni/{data,zaloha}
cd ~/linux-cviceni
pwd
ls -la` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 94. 2. Vytvoř a naplň soubor

**Řekni:** Vysvětli téma slajdu "2. Vytvoř a naplň soubor". Všimni si rozdílu mezi>a>>. Na obrazovce ukaž příkaz/zápis `echo "Úvod do Linuxu" > data/poznamky.txt
echo "Druhý řádek" >> data/poznamky.txt
cat data/poznamky.txt` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 95. 3. Kopie, přesun, hledání

**Řekni:** Vysvětli téma slajdu "3. Kopie, přesun, hledání". Na obrazovce ukaž příkaz/zápis `cp data/poznamky.txt zaloha/
mv data/poznamky.txt data/linux.txt
find . -name "*.txt"
grep -n "Linux" data/linux.txt` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 96. 4. Oprávnění

**Řekni:** Vysvětli téma slajdu "4. Oprávnění". Popiš, co znamená výsledek-rw-------. Na obrazovce ukaž příkaz/zápis `ls -l data/linux.txt
chmod 600 data/linux.txt
ls -l data/linux.txt` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 97. Kontrolní otázky

**Řekni:** Vysvětli téma slajdu "Kontrolní otázky". Projdi následující klíčové body: Jaký je rozdíl mezi terminálem a shellem?, Jak se liší absolutní a relativní cesta?, Co dělá>a co>>?, Co znamenáchmod 754?, Proč jerm -rfnebezpečné?. Na obrazovce ukaž příkaz/zápis `>` a vysvětli jeho syntaktické složky a výstup.

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a sami napsali příkaz a sledovali výstup.

**Přechod:** Nyní se posuneme k dalším aspektům v následujícím slajdu.

## 98. Hotovo

**Řekni:** „Skvělá práce! Prošli jsme kompletní základy Linuxu od terminálu až po práva, roury a vyhledávání. Tento základ budeme odteď využívat každý den.“

**Zapojení / ukázka:** Poblahopřejte všem k úspěšnému absolvování 1. bloku a zeptejte se na dojmy.

**Přechod:** „Přejdeme k navazující prezentaci: Základy sítí.“
