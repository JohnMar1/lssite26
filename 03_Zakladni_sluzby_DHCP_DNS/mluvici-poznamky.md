# Mluvené poznámky ke každému slajdu - Letní škola sítí: 3. Základní služby DHCP a DNS

Scénář je psaný pro úplné začátečníky. Není potřeba učit se ho doslova. Text po značce **Řekni** můžeš použít skoro jako hotovou formulaci, **Zapojení / ukázka** říká, co máš udělat s publikem, a **Přechod** ti pomůže plynule navázat.

U DHCP proces DORA předveď dramatizovaným rozhovorem klienta a serveru.

## Doporučené tempo

- Slajdy 1-11: DHCP (princip DORA, lease, Linux konfigurace a obnovení), přibližně 45 minut.
- Slajdy 12-20: DNS (domény, hierarchie, A/AAAA/CNAME záznamy, dig a /etc/hosts), přibližně 45 minut.
- Slajdy 21-24: Praktické cvičení (kontrola DHCP a DNS v terminálu), přibližně 30 minut.

---

## 1. Základní služby

**Řekni:** „Vítám vás u třetího bloku. Dnes se podíváme na dvě naprosto nepostradatelné služby každé sítě: DHCP pro automatické přidělování IP adres a DNS pro překlad jmen na IP adresy.“

**Zapojení / ukázka:** Zeptej se: „Kdo z vás musel při připojování k Wi-Fi doma nebo v kavárně ručně vyplňovat IP adresu, masku a bránu? Nikdo - a právě za to vděčíme DHCP.“

**Přechod:** „Pojďme si ukázat přehled toho, co dnes společně probereme.“

---

## 2. Co dnes probereme

**Řekni:** „Dnešní program má 5 částí: nejprve probereme DHCP a princip získávání adresy, poté konfiguraci síťových klientů v Linuxu, přejdeme k DNS jako telefonnímu seznamu internetu, rozebereme jednotlivé DNS záznamy s resolverem a na závěr si ukážeme diagnostiku pro situace, kdy 'nejde internet'.“

**Zapojení / ukázka:** Ujistěte účastníky, že po dnešku budou přesně vědět, co zkontrolovat, když se počítač nepřipojí k síti.

**Přechod:** „Začneme první velkou službou - protokolem DHCP.“

---

## 3. DHCP

**Řekni:** „DHCP (Dynamic Host Configuration Protocol) je protokol, který nově připojeným zařízením automaticky zapůjčuje IP adresu, masku podsítě, výchozí bránu a adresy DNS serverů.“

**Zapojení / ukázka:** Zdůrazněte: „Bez DHCP byste na každém novém mobilu, televizi i tiskárně museli ručně vyťukávat čísla a hlídat, že nikdo nemá stejnou adresu.“

**Přechod:** „Proč je automatické přidělování tak zásadní výhodou?“

---

## 4. Proč DHCP?

**Řekni:** „DHCP přináší tři obrovské výhody: 1. Ruční nastavování u stovek počítačů ve firmě nebo škole je lidsky neudržitelné. 2. Zabraňuje konfliktům IP adres (dvě zařízení nesmí mít stejnou IP). 3. Umožňuje centrální správu - když změníte DNS server na routeru, všechny počítače v síti dostanou novou konfiguraci automaticky.“

**Zapojení / ukázka:** Uveďte situaci z praxe: „Představte si konferenci s 500 účastníky, kde by každý musel jít za správcem pro přidělení papírku s IP adresou.“

**Přechod:** „Jak přesně probíhá vyjednání adresy mezi počítačem a routerem? Pomocí čtyřkrokového procesu DORA.“

---

## 5. Jak to funguje? (DORA)

**Řekni:** „Proces přidělení adresy se skládá ze čtyř kroků podle zkratky DORA: 1. Discover (Klient pošle broadcast: 'Hledám DHCP server!'), 2. Offer (Server odpoví: 'Mám pro tebe IP adresu 192.168.1.50'), 3. Request (Klient říká: 'Díky, beru tuto nabízenou IP'), 4. Acknowledge (Server potvrzuje: 'Rozumím, IP je tvoje na 24 hodin').“

**Zapojení / ukázka:** Předveďte dramatizovaný rozhovor s účastníkem v první řadě (ty jsi klient hledající IP, on je DHCP server odpovídající na nabídku).

**Přechod:** „Pamatujte, že IP adresa není přidělena natrvalo - je pouze pronajatá.“

---

## 6. DHCP Lease (Pronájem)

**Řekni:** „Doba, po kterou je IP adresa zařízením přidělena, se nazývá Lease Time. Typicky bývá nastavená na několik hodin nebo dní. V polovině doby platnosti (T1, 50 %) se klient pokusí o tiché prodloužení (Renewal). Pokud se odpojíte a vrátíte, server se vám pokusí přidělit stejnou adresu znovu.“

**Zapojení / ukázka:** Zeptej se: „Proč je v kavárně výhodné mít krátký lease time (třeba 1 hodinu) a v kanceláři dlouhý (třeba 7 dní)?“ (V kavárně se střídají stovky hostů a adresy by rychle došly).

**Přechod:** „Jaké další parametry nám DHCP server kromě samotné IP adresy pošle?“

---

## 7. Co všechno DHCP posílá?

**Řekni:** „V odpovědi DHCP serveru dostane klient kompletní síťový balíček: 1. IP adresu a masku podsítě, 2. Výchozí bránu (Default Gateway - IP routeru pro cestu do internetu), 3. IP adresy DNS serverů (překlad domén), a volitelně NTP server pro synchronizaci času nebo název domény.“

**Zapojení / ukázka:** Ukažte, že bez výchozí brány a DNS serveru by počítač viděl jen sousedy v lokální síti, ale nedostal by se na žádný web.

**Přechod:** „Jak vypadá práce s DHCP v Linuxu?“

---

## 8. DHCP na Linuxu

**Řekni:** „V Linuxu se o komunikaci s DHCP serverem stará klientský démon na pozadí. V této sekci si ukážeme, jací správci sítě se používají a jak si v případě problémů vynutit novou adresu.“

**Zapojení / ukázka:** Připravte studenty na práci s terminálem.

**Přechod:** „Jací správci sítě se v Linuxu běžně vyskytují?“

---

## 9. Správci sítě

**Řekni:** „V linuxových distribucích potkáte tři hlavní nástroje: 1. NetworkManager (standard na desktopech jako Ubuntu, ovládá se příkazem `nmcli`), 2. systemd-networkd (moderní a rychlý správce na serverech), 3. dhclient (tradiční nízkoúrovňový DHCP klient).“

**Zapojení / ukázka:** Nechte účastníky zjistit běžícího správce příkazem `systemctl status NetworkManager`.

**Přechod:** „Jak postupovat, když potřebujete IP adresu uvolnit a vyžádat novou?“

---

## 10. Jak získat novou adresu?

**Řekni:** „Pro vyžádání nové adresy z DHCP můžeme použít buď NetworkManager: `nmcli connection up <nazev>`, nebo nízkoúrovňový nástroj dhclient: nejprve uvolníme starou adresu `sudo dhclient -r` (release) a následně požádáme o novou `sudo dhclient <rozhrani>`.“

**Zapojení / ukázka:** Předveďte v terminálu uvolnění adresy a sledování, jak se rozhraní znovu nakonfiguruje.

**Přechod:** „Kde hledat příčinu, když počítač IP adresu nezíská?“

---

## 11. Kde hledat chybu?

**Řekni:** „Pokud počítač nezíská IP adresu, postupujte systematicky: 1. Zkontrolujte fyzické připojení kabelu nebo stav Wi-Fi (`ip link`). 2. Ověřte, zda běží síťová služba. 3. Nahlédněte do systémového logu příkazem `journalctl -u NetworkManager` nebo `dmesg | grep eth0`. 4. Ověřte, zda na síti vůbec běží a odpovídá DHCP server.“

**Zapojení / ukázka:** Upozorněte: „Pokud počítač dostane adresu začínající `169.254.x.x` (APIPA), znamená to, že se nedovolal žádného DHCP serveru.“

**Přechod:** „Tím máme probrané DHCP a přesouváme se ke druhé klíčové službě - DNS.“

---

## 12. DNS

**Řekni:** „DNS (Domain Name System) je globální hierarchický systém, který překládá lidsky čitelná jména domén (jako `seznam.cz` nebo `google.com`) na číselné IP adresy, kterým rozumí počítače a směrovače.“

**Zapojení / ukázka:** Zeptejte se: „Pamatujete si telefonní čísla všech svých kamarádů z hlavy, nebo používáte kontakty v telefonu? DNS je přesně takový telefonní seznam pro internet.“

**Přechod:** „K čemu všemu DNS v praxi slouží?“

---

## 13. K čemu to je?

**Řekni:** „Lidé si snadno pamatují slovní názvy jako `ssps.cz`, ale síťové pakety potřebují konkrétní číselnou cílovou adresu (např. `195.113.144.1`). DNS funguje jako celosvětová distribuovaná databáze, která tento překlad provede během několika milisekund před každým načtením stránky.“

**Zapojení / ukázka:** Předveďte v terminálu příkaz `ping ssps.cz` a ukažte, jak ping ihned v závorce vypíše přeloženou IP adresu.

**Přechod:** „Jak je systém doménových jmen hierarchicky uspořádán?“

---

## 14. Hierarchie DNS

**Řekni:** „DNS je stromová hierarchie: Na samém vrcholu je kořenová zóna (Root Zone, označovaná tečkou `.`). Pod ní jsou domény nejvyššího řádu (TLD - Top Level Domains, jako `.cz`, `.com`, `.org`). Následují domény 2. řádu (`seznam.cz`, `ssps.cz`) a subdomény 3. řádu (`is.ssps.cz`, `mail.google.com`).“

**Zapojení / ukázka:** Ukažte na tabuli rozpad celého jména: `is.ssps.cz.` - od kořenové tečky zprava doleva.

**Přechod:** „Jaké typy záznamů můžeme v DNS zóně vytvořit?“

---

## 15. Typy záznamů

**Řekni:** „V DNS se setkáváme s několika základními typy záznamů: `A` (překlad na IPv4 adresu), `AAAA` (překlad na 128bitovou IPv6 adresu), `CNAME` (kanonické jméno neboli alias ukazující na jinou doménu), `MX` (poštovní server pro doručování e-mailů) a `TXT` (libovolný text, využívaný pro ověření domény a antispamové SPF záznamy).“

**Zapojení / ukázka:** Projděte přehlednou tabulku na slajdu a vysvětlete rozdíl mezi A a CNAME.

**Přechod:** „Jak se na DNS dotazuje operační systém Linux?“

---

## 16. DNS v Linuxu

**Řekni:** „V Linuxu provádí překlad jmen systémová komponenta zvaná Resolver. V této části se podíváme na soubory `/etc/resolv.conf`, `/etc/hosts` a diagnostický nástroj `dig`.“

**Zapojení / ukázka:** Uveďte, že pochopení resolveru je základ pro řešení potíží s připojením k webům.

**Přechod:** „Podívejme se na hlavní konfigurační soubor překladu jmen.“

---

## 17. /etc/resolv.conf

**Řekni:** „Soubor `/etc/resolv.conf` obsahuje IP adresy nameserverů, na které systém posílá své DNS dotazy (např. `nameserver 1.1.1.1` nebo `nameserver 8.8.8.8`). V moderních systémech je tento soubor často automaticky spravován službou `systemd-resolved` formou symbolického odkazu.“

**Zapojení / ukázka:** Nechte všechny spustit `cat /etc/resolv.conf` a podívat se, jaký DNS server jejich systém právě využívá.

**Přechod:** „Jak nastavit překlad domény pouze na našem lokálním počítači bez DNS?“

---

## 18. /etc/hosts

**Řekni:** „Soubor `/etc/hosts` funguje jako lokální statická tabulka překladu, která má v systému vždy přednost před vzdálenými DNS servery. Pokud do něj zapíšete řádek `192.168.1.5 muj-server.test`, váš počítač se při zadání tohoto jména připojí rovnou na danou IP adresu.“

**Zapojení / ukázka:** Uveďte příklad: „Vývojáři webů používají `/etc/hosts` k testování nového webu ještě před tím, než na něj nasměrují veřejnou doménu.“

**Přechod:** „Jaký nástroj je nejlepší pro diagnostiku a dotazování DNS z terminálu?“

---

## 19. Diagnostika: dig

**Řekni:** „Nástroj `dig` (Domain Information Groper) je hlavní nástroj pro diagnostiku DNS. Umožňuje odeslat přesný dotaz: `dig seznam.cz` (výchozí A záznam), `dig @8.8.8.8 google.com MX` (dotaz na konkrétní DNS server Google na MX záznamy) a `dig -x 8.8.8.8` (reverzní dotaz pro zjištění jména z IP adresy).“

**Zapojení / ukázka:** Nechte účastníky spustit `dig ssps.cz` a najít sekci `ANSWER SECTION` s vrácenou IP adresou.

**Přechod:** „Jaké jednodušší a rychlejší alternativy k dig máme k dispozici?“

---

## 20. Rychlejší alternativy

**Řekni:** „Pro rychlé ověření bez podrobné diagnostické hlavičky můžeme použít: `host seznam.cz` (vypíše stručný souhrn IPv4, IPv6 a mailserverů) nebo `nslookup seznam.cz` (tradiční multiplatformní nástroj fungující stejně i ve Windows).“

**Zapojení / ukázka:** Porovnejte stručný výstup `host google.com` s podrobným výstupem `dig google.com`.

**Přechod:** „Pojďme si vše prakticky vyzkoušet v závěrečném cvičení.“

---

## 21. Praktické cvičení

**Řekni:** „Nyní si v samostatném cvičení vyzkoušíme kontrolu DHCP konfigurace, průzkum DNS záznamů pomocí dig a vytvoření vlastního lokálního hostitele v `/etc/hosts`.“

**Zapojení / ukázka:** Vyzvěte účastníky, aby si otevřeli terminál a připravili se na následující 3 úkoly.

**Přechod:** „Úkol 1: Kontrola DHCP konfigurace.“

---

## 22. 1. DHCP Kontrola

**Řekni:** „V prvním úkolu zjistěte svou aktuální IP adresu a rozhraní pomocí `ip a`, najděte výchozí bránu přes `ip route` a podívejte se do `/etc/resolv.conf`, jaké DNS servery vám DHCP přidělilo.“

**Zapojení / ukázka:** Příkazy k ověření: `ip a`, `ip r`, `cat /etc/resolv.conf`.

**Přechod:** „Úkol 2: Průzkum DNS záznamů.“

---

## 23. 2. DNS Průzkum

**Řekni:** „Ve druhém úkolu vyhledejte IPv4 adresu pro `ssps.cz` pomocí `dig`, zjistěte poštovní servery domény `google.com` dotazem na `MX` a proveďte reverzní překlad pro adresu `1.1.1.1` pomocí přepínače `-x`.“

**Zapojení / ukázka:** Příkazy: `dig ssps.cz`, `dig google.com MX`, `dig -x 1.1.1.1`.

**Přechod:** „Úkol 3: Vlastní lokální záznam v hosts.“

---

## 24. 3. Vlastní hostitel

**Řekni:** „Ve třetím úkolu upravte soubor `/etc/hosts` (pomocí `sudo nano /etc/hosts`) a přidejte do něj řádek: `127.0.0.1 moje.lokalka`. Následně vyzkoušejte `ping moje.lokalka` a ověřte, že počítač odpovídá sám sobě na localhostu.“

**Zapojení / ukázka:** Zkontrolujte se studenty úspěšný výstup pingu a poblahopřejte jim k dokončení dnešního síťového bloku.

