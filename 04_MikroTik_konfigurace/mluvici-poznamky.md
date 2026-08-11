# Mluvené poznámky ke každému slajdu — Letní škola sítí: 4. MikroTik Konfigurace

Scénář je psaný pro úplné začátečníky. Není potřeba učit se ho doslova. Text po značce **Řekni** můžeš použít skoro jako hotovou formulaci, **Zapojení / ukázka** říká, co máš udělat s publikem, a **Přechod** ti pomůže plynule navázat.

U konfiguračních slajdů nečti příkazy jako text; ukaž postup živě ve WinBoxu na projektoru a vysvětli smysl jednotlivých parametrů.

## Doporučené tempo

- Slajdy 1–5: Úvod, zapojení a nástroje (WinBox vs CLI, zálohování), přibližně 15–20 minut.
- Slajdy 6–8: Fyzické zapojení, připojení přes WinBox a tovární vs. čisté nastavení, přibližně 15 minut.
- Slajdy 9–11: Konfigurace LAN (Bridge, IP adresa, DHCP server), přibližně 25 minut.
- Slajdy 12–16: Konfigurace WAN (DHCP client, Statická IP, PPPoE) a ověření pingu, přibližně 25 minut.
- Slajdy 17–18: NAT, Masquerade a Port Forwarding (DstNAT), přibližně 20 minut.
- Slajdy 19–22: Zabezpečení routeru (hesla, MAC server, firewall pravidla, vypnutí služeb), přibližně 30 minut.
- Slajdy 23–25: Nastavení Wi-Fi, ochrana klientů a blokování webů přes Web Proxy, přibližně 25 minut.
- Slajdy 26–27: Diagnostika a závěrečné shrnutí, přibližně 15 minut.

---

## 1. 4. MikroTik Konfigurace

**Řekni:** „Vítám vás u modulu věnovaného konfiguraci routerů MikroTik a operačnímu systému RouterOS. MikroTik je mezi síťaři extrémně oblíbený, protože nabízí profesionální funkce enterprise routerů za dostupnou cenu. Dnes si projdeme kompletní nastavení routeru od vybalení z krabice až po zabezpečení a publikování služeb.“

**Zapojení / ukázka:** Ukažte účastníkům fyzický router MikroTik (např. hAP ac2 nebo LDF) a ukažte jeho porty.

**Přechod:** „Pojďme si ukázat přehled témat, která dnes zvládneš.“

## 2. Co dnes probereme

**Řekni:** „Dnes si krok za krokem ukážeme fyzické zapojení, připojení přes WinBox, vytvoření lokální sítě (Bridge, IP, DHCP server), zprovoznění internetu (WAN), překlad adres NAT, předávání portů, nastavení hesla a firewallu, Wi-Fi a blokování webů.“

**Zapojení / ukázka:** Projděte odrážky na slajdu a zeptejte se zvednutím ruky: „Kdo z vás už někdy nastavoval domácí Wi-Fi router?“

**Přechod:** „Co všechno budeme k dnešní práci potřebovat?“

## 3. Co budeme potřebovat?

**Řekni:** „Každý z vás má na stole router MikroTik, napájecí adaptér, patch kabel a počítač s Ethernet rozhraním. Poskytneme vám internetový přívod do portu ether1 a stáhnete si grafický nástroj WinBox z oficiálních stránek `mikrotik.com/download`.“

**Zapojení / ukázka:** Zkontrolujte, že všichni mají na stole potřebný hardware a kabely.

**Přechod:** „Než klikneme na první tlačítko, ujasníme si 5 základních pojmů.“

## 4. Klíčové koncepty

**Řekni:** „Projdi základní pojmy: Default Config (tovární pravidla), Bridge (virtuální switch spájející fyzické porty do jedné LAN), DHCP Server (automatické přidělování IP), NAT / Masquerade (sdílení jedné veřejné IP více zařízeními) a Firewall (pravidla pro propouštění či blokování paketů).“

**Zapojení / ukázka:** Vysvětlete Bridge na příměru: „Bridge spojí fyzické konektory ether2 až ether5 tak, jako by to byla jedna společná zásuvka.“

**Přechod:** „RouterOS nabízí dvě hlavní metody konfigurace.“

## 5. WinBox vs. CLI & Zálohování

**Řekni:** „WinBox je samostatná grafická aplikace pro Windows/macOS/Linux, ve které vidíte všechna okna a statistiky v reálném čase. CLI je příkazový řádek přístupný přes SSH nebo terminál ve WinBoxu. Vše, co kliknete ve WinBoxu, má svůj přesný ekvivalent v příkazovém řádku. Po každém úspěšném kroku si uděláme zálohu skrze `Files` -> `Backup` nebo příkaz `/export file=...`.“

**Zapojení / ukázka:** Ukažte v příkazovém řádku příkaz `/export file=moje-zaloha`.

**Přechod:** „Pojďme zapojit kabely do správných konektorů.“

## 6. Krok 1: Fyzické zapojení

**Řekni:** „Pravidlo číslo 1 u MikroTiku: Port `ether1` je VŽDY vyhrazen pro WAN (přívod internetu z ISP modemu). Všechny ostatní porty (`ether2` až `ether5`) slouží pro lokální síť (LAN). Zapojte váš počítač do portu `ether2`.“

**Zapojení / ukázka:** Názorně předveďte zapojení kabelů na fyzickém routeru před kamerou nebo projektorem.

**Přechod:** „Nyní zapneme WinBox a vyhledáme náš router.“

## 7. Krok 2 & 3: Připojení přes WinBox

**Řekni:** „Otevřete aplikaci WinBox a přepněte se na záložku *Neighbors*. Zde probíhá vyhledávání pomocí MikroTik Neighbor Discovery protokolu. Uvidíte MAC adresu a IP adresu vašeho routeru. Dvakrát klikněte na MAC adresu (připojení přes MAC je spolehlivější, pokud router ještě nemá IP). Uživatelské jméno je `admin`, heslo nechte prázdné a klikněte na Connect.“

**Zapojení / ukázka:** Předveďte vyhledání a připojení k routeru na projektoru. Pomozte účastníkům, kterým se router neobjevil.

**Přechod:** „Po prvním přihlášení uvidíte okno s tovární konfigurací.“

## 8. Tovární nastavení vs. Čistý reset

**Řekni:** „Tovární nastavení (Default Configuration) obsahuje přednastavené IP adresy `192.168.88.1`, základní firewall a DHCP server. Pro začátečníky je bezpečnější ho ponechat a upravit. Pokud bychom chtěli stavět síť úplně od nuly, použijeme příkaz `/system reset-configuration no-defaults=yes`.“

**Zapojení / ukázka:** Ukažte tlačítko 'OK' pro zachování defaultní konfigurace.

**Přechod:** „Nyní si ukažme, jak ručně vytvořit lokální síť LAN.“

## 9. LAN Konfigurace: 1. Vytvoření Bridge

**Řekni:** „Prvním krokem konfigurace LAN je vytvoření rozhraní `bridge1` a přidání fyzických portů `ether2`, `ether3` atd. do tohoto bridge. Tím zajistíme, že počítače zapojené v libovolném z těchto portů budou ve stejné síti.“

**Zapojení / ukázka:** Ve WinBoxu otevřete menu *Bridge*, přidejte `bridge1` a na záložce *Ports* přidejte `ether2` a `ether3`.

**Přechod:** „Bridge máme připravený, ale chybí mu IP adresa.“

## 10. LAN Konfigurace: 2. Pridělení IP adresy

**Řekni:** „Aby router mohl komunikovat s klienty v LAN a sloužit jim jako výchozí brána, musíme rozhraní `bridge1` připsat IP adresu. Použijeme standardní adresu `192.168.88.1/24`. Prefix `/24` znamená masku `255.255.255.0`.“

**Zapojení / ukázka:** Ve WinBoxu otevřete *IP* -> *Addresses*, klikněte na `+`, zadejte `192.168.88.1/24` a zvolte rozhraní `bridge1`.

**Přechod:** „Jak zajistíme, aby připojená PC získala IP adresu automaticky?“

## 11. LAN Konfigurace: 3. DHCP Server

**Řekni:** „Místo ručního zadávání IP adres na počítačích spustíme na rozhraní `bridge1` DHCP server. RouterOS na to má skvělého průvodce `DHCP Setup`, který sám předvyplní rozsah adres (pool `192.168.88.2-192.168.88.254`), bránu i DNS.“

**Zapojení / ukázka:** Ve WinBoxu klikněte na *IP* -> *DHCP Server* -> *DHCP Setup*, vyberte `bridge1` a proklikejte tlačítkem *Next*.

**Přechod:** „LAN síť je hotová. Nyní musíme připojit router k internetu.“

## 12. Připojení k internetu (WAN)

**Řekni:** „Způsob připojení k internetu závisí na vašem poskytovateli (ISP). Máme 3 možnosti: DHCP klient (nejběžnější u kabelu/optiky), statická IP (u firemních přípojek) nebo PPPoE tunel (u DSL/optiky s přihlašovacím jménem).“

**Zapojení / ukázka:** Zeptej se: „Kdo ví, jaký typ připojení máte doma?“

**Přechod:** „Podíváme se na nejčastější variantu – DHCP client.“

## 13. WAN Option A: DHCP Client

**Řekni:** „Pokud vám ISP přiděluje adresu automaticky, stačí na vnější rozhraní `ether1` přidat DHCP klienta. Router si sám vyžádá veřejnou IP adresu, výchozí bránu i DNS servery od poskytovatele. Stav musí přejít do režimu `bound`.“

**Zapojení / ukázka:** Ve WinBoxu otevřete *IP* -> *DHCP Client*, přidejte `+` pro rozhraní `ether1` a sledujte získanou IP adresu.

**Přechod:** „Co když vám poskytovatel dal papír se statickými údaji?“

## 14. WAN Option B: Statická IP adresa

**Řekni:** „Pokud máte statickou IP adresu, musíte nastavit 3 věci: 1. Ručně přidat adresu na `ether1`, 2. Přidat výchozí cestu v *IP -> Routes* s adresou brány, 3. Nastavit IP adresy DNS resolverů v *IP -> DNS*.“

**Zapojení / ukázka:** Ukažte v CLI zápis `/ip route add gateway=1.2.3.1`.

**Přechod:** „A třetí možností je PPPoE přihlášení.“

## 15. WAN Option C: PPPoE Připojení

**Řekni:** „U PPPoE spojení vytváříme virtuální rozhraní v menu *PPP*. Zadáte jméno a heslo od ISP a zaškrtnete *Add Default Route* a *Use Peer DNS*. Důležité: Vaším novým internetovým rozhraním se od této chvíle stává `pppoe-out1`!“

**Zapojení / ukázka:** Ukažte okně PPP vytvoření *PPPoE Client*.

**Přechod:** „Jak ověříme, že je router skutečně připojený k internetu?“

## 16. Ověření konektivity z routeru

**Řekni:** „Konektivitu ověříme z terminálu routeru dvěma pingly: Nejdříve `/ping 8.8.8.8` (testuje čistou IP konektivitu). Pokud prochází, zkusíme `/ping google.com` (testuje funkčnost DNS překladu). Pokud oba piny odpovídají, router je online!“

**Zapojení / ukázka:** Spusťte v terminálu WinBoxu příkaz `/ping google.com` a ukažte čas odezvy v ms.

**Přechod:** „Router je online, ale počítače v LAN zatím na internet nemohou. Proč? Chybí NAT.“

## 17. NAT & Masquerade

**Řekni:** „Soukromé adresy `192.168.88.x` nemohou cestovat do veřejného internetu. Musíme zapnout NAT (Masquerade / maškarádu), která přepíše zdrojovou adresu odcházejících paketů na veřejnou IP rozhraní `ether1`.“

**Zapojení / ukázka:** Ve WinBoxu otevřete *IP* -> *Firewall* -> záložka *NAT*, přidejte pravidlo: Chain `srcnat`, Out-Interface `ether1`, Action `masquerade`.

**Přechod:** „Co když chceme zpřístupnit server z LAN do internetu?“

## 18. Port Forwarding (Destination NAT)

**Řekni:** „Pokud provozujete v LAN např. Minecraft server nebo RDP, použijeme Destination NAT (DstNAT). Příchozí provoz na veřejný port routeru (např. 3389) přesměrujeme na konkrétní lokální IP adresu klienta v LAN.“

**Zapojení / ukázka:** Ukažte nastavení DstNAT pravidla ve Firewallu.

**Přechod:** „Nyní je síť funkční. Je čas router důkladně zabezpečit.“

## 19. Zabezpečení 1: Změna hesla a uživatelů

**Řekni:** „Nezabezpečený router bez hesla je obrovské riziko. Prvním krokem je nastavení silného hesla pro uživatele `admin`. Doplňkovým osvědčeným postupem je vytvořit nového uživatele se silným heslem a výchozí účet `admin` zcela smazat.“

**Zapojení / ukázka:** V menu *System* -> *Users* přidejte nového uživatele v skupině `full`, přihlašte se pod ním a smažte účet `admin`.

**Přechod:** „Omezíme také přístup ke správa routeru po vrstvě L2 (MAC adresa).“

## 20. Zabezpečení 2: MAC Přístup & Neighbor Discovery

**Řekni:** „Ve výchozím stavu odpovídá MAC WinBox i Neighbor Discovery na všech portech včetně internetového WAN portu. Vytvoříme seznam rozhraní `LAN` obsahující `bridge1` a v *Tools -> MAC Server* povolíme spravování routeru POUZE z tohoto seznamu LAN.“

**Zapojení / ukázka:** Ukažte nastavení v *Tools* -> *MAC Server* a *IP* -> *Neighbor Discovery*.

**Přechod:** „Nyní nastavíme bezpečnostní pravidla firewallu pro samotný router.“

## 21. Zabezpečení 3: Pravidla Firewallu (Input Chain)

**Řekni:** „V *IP -> Firewall -> Filter Rules* nastavíme pravidla pro `input` chain: 1. Povolit navázaná spojení (established/related), 2. Zahodit neplatné pakety (invalid), 3. Povolit ICMP ping a správcovské porty z WAN (pokud je potřebujete), 4. Zablokovat veškerý ostatní příchozí provoz z WAN rozhraní `ether1`.“

**Zapojení / ukázka:** Vysvětlete logiku vyhodnocování pravidel shora dolů (od prvního k poslednímu).

**Přechod:** „Vypneme také služby, které aktivně nepoužíváme.“

## 22. Zabezpečení 4: Vypnutí služeb & SSH Crypto

**Řekni:** „V menu *IP -> Services* vypneme nešifrované a nepoužívané služby jako Telnet, FTP, WWW a API. U SSH změníme výchozí port 22 na jiný (např. 2200) a zapneme silné šifrování `/ip ssh set strong-crypto=yes`.“

**Zapojení / ukázka:** Ve WinBoxu otevřete *IP* -> *Services* a zakážte červeným křížkem nepotřebné služby.

**Přechod:** „Přejdeme k nastavení bezdrátové Wi-Fi sítě.“

## 23. Nastavení Wi-Fi (Wireless)

**Řekni:** „U Wi-Fi routerů nejdříve vytvoříme bezpečnostní profil s heslem WPA2-PSK v *Wireless -> Security Profiles*. Poté zapneme rozhraní `wlan1`, nastavíme SSID název sítě a nakonec přidáme `wlan1` do našeho `bridge1`, aby Wi-Fi klienti získali IP z našeho DHCP serveru.“

**Zapojení / ukázka:** Předveďte nastavení SSID a hesla Wi-Fi ve WinBoxu.

**Přechod:** „Zabezpečíme provoz samotných klientů v LAN.“

## 24. Ochrana klientů v LAN (Forward Chain)

**Řekni:** „Ve `forward` chainu firewallu nastavíme FastTrack pravidlo. FastTrack obchází podrobnou kontrolu u již schválených datových toků a dramaticky snižuje zátěž procesoru routeru při stahování. Na závěr přidáme pravidlo blokující nevyžádaná nová spojení z WAN do LAN.“

**Zapojení / ukázka:** Ukažte FastTrack pravidlo a sledování čítače přenesených bajtů ve WinBoxu.

**Přechod:** „Bonusová funkce: Blokování nevhodných webů přes Web Proxy.“

## 25. Blokování nežádoucích webů (Web Proxy)

**Řekni:** „Pokud chceme v síti zablokovat určité domény (např. sociální sítě během výuky), přesměrujeme v NATu port 80 (HTTP) na interní Web Proxy (port 8080) a v *IP -> Web Proxy -> Access* přidáme domény k zablokování zprávou `action=deny`.“

**Zapojení / ukázka:** Předveďte zablokování testovací domény a ukažte chybovou stránku v prohlížeči.

**Přechod:** „Co dělat, když něco nefunguje? Diagnostické nástroje.“

## 26. Diagnostika & Řešení problémů

**Řekni:** „Pokud nefunguje internet, postupujte systematicky: 1. Fyzická vrstva (svítí dioda na portu?), 2. IP vrstva (má PC adresu z DHCP?), 3. Ping na bránu `192.168.88.1`, 4. Ping na IP `8.8.8.8`, 5. Ping na doménu `google.com`. V RouterOS máte k dispozici nástroje `Ping`, `Traceroute` a žitý monitoring provozu `Torch`.“

**Zapojení / ukázka:** Spusťte nástroj *Torch* na rozhraní `ether1` a ukažte reálný datový tok v síti.

**Přechod:** „Tímto jsme zvládli kompletní konfiguraci MikroTik routeru!“

## 27. Skvělá práce!

**Řekni:** „Gratuluji! Úspěšně jste konfigurovali RouterOS, postavili LAN i Wi-Fi síť, připojili router k internetu a zabezpečili ho firewallem. Nyní si můžete vyzkoušet samostatné cvičení nebo rychlostní testy.“

**Zapojení / ukázka:** Otevřete prostor pro dotazy účastníků a individuální pomoc s konfigurací.

**Přechod:** „V dalším modulu se podíváme na Docker a kontejnerizaci.“
