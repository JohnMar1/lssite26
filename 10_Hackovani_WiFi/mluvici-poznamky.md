# Mluvené poznámky ke každému slajdu - Letní škola sítí: 10. Hacking Wi-Fi a bezdrátové sítě

Scénář je psaný pro lektory vyučující testování bezpečnosti Wi-Fi v prostředí Kali Linux. Text po značce **Řekni** představuje výklad srozumitelným jazykem, **Zapojení / ukázka** uvádí praktické akce v učebně a **Přechod** pomáhá navázat na další slajd.

---

## 1. Titulní slajd - Hacking Wi-Fi & Bezdrátové sítě

**Řekni:** „Vítám vás u modulu 10: Hacking Wi-Fi a bezdrátové sítě. Dnes se naučíme, jak funguje bezpečnost bezdrátových sítí v praxi. V prostředí Kali Linux si krok za krokem vyzkoušíme odchytávání síťového provozu a zachycení přihlašovacího handshaku.“

**Zapojení / ukázka:** Ubezpečte studenty: „Vše budeme provádět v izolovaném učebním prostředí na vyhrazeném přístupovém bodu.“

**Přechod:** „Pojďme si ukázat hlavní body dnešní lekce.“

---

## 2. Co se dnes naučíme?

**Řekni:** „Dnes projdeme 5 praktických kroků: Vysvětlíme si fungování Wi-Fi, přepneme kartu do monitorovacího módu, prozkoumáme okolní vysílače přes `airodump-ng`, odchytíme WPA2 Handshake a vyzkoušíme si slovníkový útok v samostatném cvičení.“

**Zapojení / ukázka:** Projděte body agendy na slajdu.

**Přechod:** „Začneme první kategorií: Základy Wi-Fi a bezpečnostní protokoly.“

---

## 3. Kategorie 1: Základy Wi-Fi a bezpečnostní protokoly

**Řekni:** „V první části si vysvětlíme základní terminologii bezdrátových sítí a vývoj jejich šifrování.“

**Zapojení / ukázka:** Zobrazte dělící slajd kategorie 1.

**Přechod:** „Jak vlastně Wi-Fi data létají vzduchem?“

---

## 4. Jak funguje Wi-Fi (IEEE 802.11)?

**Řekni:** „Zatímco v kabelové síti data létají uvnitř kovu, Wi-Fi používá rádiové vlnění. Každá síť má své SSID (název), BSSID (fyzickou MAC adresu routeru) a běží na konkrétním kanálu (frekvenci). Protože je vzduch sdílené médium, kdokoliv s příslušnou kartou může tyto vlny zachytávat.“

**Zapojení / ukázka:** Přirovnejte Wireshark na kabelech a Wi-Fi kartu ke kusu drátu vs. rozhlasovému přijímači.

**Přechod:** „Jak se vyvíjelo zabezpečení Wi-Fi?“

---

## 5. Vývoj bezpečnosti Wi-Fi (WEP, WPA2, WPA3)

**Řekni:** „V minulosti se používalo šifrování WEP, které obsahovalo vážnou matematickou chybu a dnes ho lze prolomit za 10 sekund. Dnes drtivá většina sítí používá WPA2-PSK s 4-Way Handshakem. Nejnovější standard WPA3 nahrazuje PSK protokolem SAE, který chrání heslo i před offline slovníkovými útoky.“

**Zapojení / ukázka:** Zdůrazněte, že dnes budeme testovat nejrozšířenější standard WPA2.

**Přechod:** „Přejděme ke druhé kategorii: Příprava prostředí v Kali Linuxu.“

---

## 6. Kategorie 2: Příprava prostředí v Kali Linuxu

**Řekni:** „Ve druhé části si připravíme náš systém Kali Linux a síťovou kartu k odchytávání.“

**Zapojení / ukázka:** Zobrazte dělící slajd kategorie 2.

**Přechod:** „Co je to Aircrack-ng suite?“

---

## 7. Co je to Kali Linux a Aircrack-ng?

**Řekni:** „Kali Linux je operační systém vyvinutý pro bezpečnostní auditory. Jeho klíčovou součástí pro Wi-Fi je balík `Aircrack-ng`, který obsahuje nástroje pro přepínání karty (`airmon-ng`), skenování (`airodump-ng`), deautentizaci (`aireplay-ng`) i louskání hesel (`aircrack-ng`).“

**Zapojení / ukázka:** Nechte studenty otevřít terminál v jejich systému Kali Linux.

**Přechod:** „Proč musíme přepnout Wi-Fi kartu do speciálního módu?“

---

## 8. Módy Wi-Fi karty (Managed vs Monitor)

**Řekni:** „Běžně karta běží v Managed módu - přijímá jen pakety určené pro váš počítač a ostatní zahazuje. Pro pentesting ji musíme přepnout do Monitor módu, ve kterém odchytává absolutně veškeré pakety, které létají ve vzduchu na daném kanálu.“

**Zapojení / ukázka:** Ukažte na slajdu rozdíl mezi filtrovaným a nefiltrovaným příjmem.

**Přechod:** „Jak zjistíme název naší Wi-Fi karty?“

---

## 9. Krok 1: Kontrola rozhraní (iwconfig)

**Řekni:** „Příkaz `iwconfig` je jako `ifconfig`, ale zobrazuje podrobnosti o bezdrátových kartách. Vypíše nám rozhraní jako `wlan0` nebo `wlan0mon` a ověříme, že karta podporuje Mode:Managed nebo Monitor.“

**Zapojení / ukázka:** Spusťte `iwconfig` v terminálu na projektoru.

**Přechod:** „Před spuštěním monitor módu musíme ukončit rušivé procesy.“

---

## 10. Krok 2: Ukončení rušivých procesů (airmon-ng check kill)

**Řekni:** „Síťoví správci v Linuxu (NetworkManager) se snaží kartu neustále připojovat k Wi-Fi. Příkaz `sudo airmon-ng check kill` vyhledá a ukončí všechny procesy, které by nám při odchytávání překážely.“

**Zapojení / ukázka:** Spusťte příkaz a ukažte seznam ukončených služeb v terminálu.

**Přechod:** „Nyní můžeme bezpečně zapnout Monitor mód.“

---

## 11. Krok 3: Spuštění Monitor módu (airmon-ng start wlan0)

**Řekni:** „Příkazem `sudo airmon-ng start wlan0` vytvoříme nové monitorovací rozhraní, které se typicky pojmenuje `wlan0mon`. Ověříme si ho opakováním příkazu `iwconfig`.“

**Zapojení / ukázka:** Ukažte nově vzniklé rozhraní `wlan0mon` se zobrazeným Mode:Monitor.

**Přechod:** „Karta je připravena! Přejděme ke třetí kategorii: Skenování sítí.“

---

## 12. Kategorie 3: Skenování a zacílení pomocí airodump-ng

**Řekni:** „Ve třetí části prozkoumáme okolní vysílače a zacílíme na naši testovací síť.“

**Zapojení / ukázka:** Zobrazte dělící slajd kategorie 3.

**Přechod:** „Jak spustíme skenování všech kanálů?“

---

## 13. Krok 4: Skenování okolí (airodump-ng wlan0mon)

**Řekni:** „Příkaz `sudo airodump-ng wlan0mon` zařídí, že karta začne rychle přepínat kanály 1 až 13 a vypisovat všechny zachycené Wi-Fi sítě v dosahu a zařízení, která k nim patří.“

**Zapojení / ukázka:** Nechte skener běžet a ukažte studentům živě naskakující Wi-Fi sítě na projektoru.

**Přechod:** „Jak se orientovat v tabulce výstupu?“

---

## 14. Jak číst výstup airodump-ng?

**Řekni:** „V tabulce sledeme: BSSID (MAC routeru), PWR (sílu signálu), CH (kanál), ENC/CIPHER (šifrování WPA2 CCMP) a ESSID (název sítě). V dolní části vidíme tabulku STATION, kde jsou MAC adresy telefonů a notebooků připojených k dané síti.“

**Zapojení / ukázka:** Vysvětlete studentům, jak najít BSSID a kanál naší učební Wi-Fi.

**Přechod:** „Když známe BSSID a kanál, zacílíme naši kartu výhradně na tuto síť.“

---

## 15. Krok 5: Zacílení na konkrétní síť

**Řekni:** „Příkazem `sudo airodump-ng -c 6 --bssid AA:BB:CC:DD:EE:FF -w vysledek wlan0mon` uzamkneme kartu na kanál 6 a ukládáme veškerý provoz dané sítě do souboru `vysledek-01.cap`. Přepínač `-c` specifikuje kanál, `--bssid` nastavuje MAC adresu routeru a `-w` definuje jméno výstupního souboru.“

**Zapojení / ukázka:** Zkontrolujte, že se v terminálu zobrazují pakety pouze pro vybrané BSSID.

**Přechod:** „Nyní potřebujeme zachytit WPA2 Handshake v kategorii 4.“

---

## 16. Kategorie 4: Deautentizační útok a zachycení WPA2 Handshaku

**Řekni:** „Ve čtvrté části si vysvětlíme 4-Way Handshake a provedeme deautentizační útok k jeho zachycení.“

**Zapojení / ukázka:** Zobrazte dělící slajd kategorie 4.

**Přechod:** „Co je to WPA2 Handshake?“

---

## 17. Co je to WPA2 4-Way Handshake?

**Řekni:** „Při přihlášení klienta k Wi-Fi si router a klient vymění 4 pakety podání ruky. V těchto paketách je obsažen kryptografický důkaz znalosti hesla. Pokud tyto pakety odchytíme, můžeme z nich heslo zkoušet louskat doma bez připojení k síti.“

**Zapojení / ukázka:** Zdůrazněte, že Handshake probíhá pouze při novém přihlášení zařízení.

**Přechod:** „Jak vynutíme, aby se klient přihlásil znovu?“

---

## 18. Jak vynutit přihlášení? (Deautentizace)

**Řekni:** „Protože řídící rámce v 802.11 nejsou v WPA2 šifrované, můžeme jako útočník odeslat speciální deautentizační paket jménem routeru. Klient se na vteřinu odpojí a jeho zařízení se ihned automaticky zkusí přihlásit zpět - tím vygeneruje nový 4-Way Handshake!“

**Zapojení / ukázka:** Přirovnejte deautentizaci k náhlému krátkému vypadnutí signálu.

**Přechod:** „Jaký příkaz použijeme pro odeslání deautentizace?“

---

## 19. Krok 6: Spuštění útok aireplay-ng

**Řekni:** „V druhém okně terminálu spustíme `sudo aireplay-ng --deauth 10 -a <BSSID> -c <MAC_KLIENTA> wlan0mon`. Přepínač `--deauth` určí počet paketů, `-a` nastaví MAC adresu routeru a `-c` určí MAC adresu odpojovaného klienta ze sloupce STATION.“

**Zapojení / ukázka:** Spusťte příkaz na projektoru a sledujte reakci v prvním okně s `airodump-ng`.

**Přechod:** „Jak poznáme, že jsme Handshake úspěšně zachytili?“

---

## 20. Krok 7: Kontrola zachyceného Handshaku

**Řekni:** „V prvním okně s `airodump-ng` se vpravo nahoře objeví zelená zpráva: `[ WPA handshake: AA:BB:CC:DD:EE:FF ]`. To znamená, že požadované 4 pakety jsou bezpečně uložené v našem souboru `vysledek-01.cap`.“

**Zapojení / ukázka:** Zvýrazněte tuto zprávu v okně na projektoru.

**Přechod:** „Máme odchycený Handshake! Přejděme k louskání hesla v kategorii 5.“

---

## 21. Kategorie 5: Prolamování hesla (Offline Slovníkový Útok)

**Řekni:** „V páté části si ukážeme, jak ze zachyceného handshaku odhalit původní heslo.“

**Zapojení / ukázka:** Zobrazte dělící slajd kategorie 5.

**Přechod:** „Jak funguje offline slovníkový útok?“

---

## 22. Jak funguje louskání (Cracking)?

**Řekni:** „Z odchyceného handshaku nelze heslo přímo přečíst. Útok probíhá tak, že bereme slova ze slovníku hesel, počítáme z nich klíč a ověřujeme, zda odpovídá odchycenému handshaku. Útok probíhá zcela na našem počítači (offline), takže síť o ničem neví.“

**Zapojení / ukázka:** Vysvětlete, že rychlost závisí na výkonu našeho počítače a kvalitě slovníku.

**Přechod:** „Spusťme louskání v nástroji `aircrack-ng`.“

---

## 23. Krok 8: Prolomení pomocí aircrack-ng

**Řekni:** „Spustíme `aircrack-ng -w /usr/share/wordlists/rockyou.txt vysledek-01.cap`. Přepínač `-w` odkazuje na slovník hesel `rockyou.txt`, který obsahuje přes 14 milionů reálných hesel. Následuje název souboru s handshakem.“

**Zapojení / ukázka:** Ukažte běh příkazu a ukazatel rychlosti zkoušení hesel (k/s).

**Přechod:** „Co uvidíme, když bylo heslo úspěšně nalezeno?“

---

## 24. Co když heslo najdeme?

**Řekni:** „Pokud se heslo nacházelo ve slovníku, `aircrack-ng` zastaví práci a vytiskne zelenou zprávu `KEY FOUND! [ slunicko123 ]`. Pokud heslo ve slovníku nebylo, musíme použít větší slovník nebo pravidla.“

**Zapojení / ukázka:** Ukažte úspěšně nalezené heslo na projektoru.

**Přechod:** „Jak tento proces zrychlit z tisíců hesel na miliony za sekundu?“

---

## 25. Extrémní zrychlení přes Grafickou kartu (Hashcat)

**Řekni:** „Zatímco procesor zvládne jednotky tisíc hesel za sekundu, grafická karta (GPU) zvládne díky tisícům jader stihnout půl milionu hesel za sekundu. Nástrojem `hcxpcapngtool` převedeme `.cap` na formát `.hc22000` a spustíme extrémně rychlý `hashcat`.“

**Zapojení / ukázka:** Porovnejte rychlost CPU vs GPU na slajdu.

**Přechod:** „Přejděme k samostatnému praktickému cvičení v kategorii 6.“

---

## 26. Kategorie 6: Samostatné praktické cvičení

**Řekni:** „V této části maji studenti k dispozici samostatnou prezentaci `commands.html`, kde je každý příkaz na vlastním slajdu včetně tabulky s přesným vysvětlením všech přepínačů a hodnot.“

**Zapojení / ukázka:** Otevřete prezentaci `commands.html` na projektoru a procházejte ji se studenty.

**Přechod:** „Podívejme se na zabezpečení vlastní Wi-Fi.“

---

## 27. Jak zabezpečit vlastní Wi-Fi?

**Řekni:** „Abyste vy sami nenaletěli na tento útok, používejte silná a dlouhá hesla (15+ znaků), zapněte WPA3 nebo WPA2-AES a vypněte funkci WPS.“

**Zapojení / ukázka:** Zopakujte pravidla pro bezpečná hesla.

**Přechod:** „Pojďme si na závěr shrnout to nejdůležitější.“

---

## 28. Co si z dneška odnést

**Řekni:** „Dnes jste si prakticky vyzkoušeli celý postup: odchytávání v monitor módu, zacílení v `airodump-ng`, deautentizaci v `aireplay-ng` a louskání handshaku v `aircrack-ng`. Děkuji za pozornost!“

**Zapojení / ukázka:** Poděkujte všem za pozornost a odpovězte na dotazy.
