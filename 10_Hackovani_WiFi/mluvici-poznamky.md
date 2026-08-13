# Mluvené poznámky ke každému slajdu — Letní škola sítí: 10. Hacking Wi-Fi a bezdrátové sítě

Scénář je psaný pro lektory vyučující testování bezpečnosti Wi-Fi v prostředí Kali Linux. Text po značce **Řekni** představuje výklad srozumitelným jazykem, **Zapojení / ukázka** uvádí praktické akce v učebně a **Přechod** pomáhá navázat na další slajd.

---

## 1. Titulní slajd — Hacking Wi-Fi & Bezdrátové sítě

**Řekni:** „Vítám vás u modulu 10: Hacking Wi-Fi a bezdrátové sítě. Dnes se naučíme, jak funguje bezpečnost bezdrátových sítí v praxi. V prostředí Kali Linux si krok za krokem vyzkoušíme odchytávání síťového provozu a zachycení přihlašovacího handshaku.“

**Zapojení / ukázka:** Ubezpečte studenty: „Vše budeme provádět v izolovaném učebním prostředí na vyhrazeném přístupovém bodu.“

**Přechod:** „Pojďme si ukázat hlavní body dnešní lekce.“

---

## 2. Co se dnes naučíme?

**Řekni:** „Dnes projdeme 5 praktických kroků: Vysvětlíme si fungování Wi-Fi, přepneme kartu do monitorovacího módu, prozkoumáme okolní vysílače přes `airodump-ng`, odchytíme WPA2 Handshake a vyzkoušíme si slovníkový útok.“

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

**Řekni:** „Běžně karta běží v Managed módu – přijímá jen pakety určené pro váš počítač a ostatní zahazuje. Pro pentesting ji musíme přepnout do Monitor módu, ve kterém odchytává absolutně veškeré pakety, které létají ve vzduchu na daném kanálu.“

**Zapojení / ukázka:** Ukažte na slajdu rozdíl mezi filtrovaným a nefiltrovaným příjmem.

**Přechod:** „Jak zjistíme název naší Wi-Fi karty?“

---

## 9. Krok 1: Kontrola rozhraní (iwconfig)

**Řekni:** „Příkaz `iwconfig` je jako `ifconfig`, ale zobrazuje podrobnosti o bezdrátových kartách. Vypíše nám rozhraní jako `wlan0` a ověříme, že karta podporuje Mode:Managed nebo Monitor.“

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

**Řekni:** „Příkazem `sudo airodump-ng -c 6 --bssid AA:BB:CC:DD:EE:FF -w vysledek wlan0mon` uzamkneme kartu na kanál 6 a ukládáme veškerý provoz dané sítě do souboru `vysledek-01.cap`.“

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

**Řekni:** „Protože řídící rámce v 802.11 nejsou v WPA2 šifrované, můžeme jako útočník odeslat speciální deautentizační paket jménem routeru. Klient se na vteřinu odpojí a jeho zařízení se ihned automaticky zkusí přihlásit zpět – tím vygeneruje nový 4-Way Handshake!“

**Zapojení / ukázka:** Přirovnejte deautentizaci k náhlému krátkému vypadnutí signálu.

**Přechod:** „Jaký příkaz použijeme pro odeslání deautentizace?“

---

## 19. Krok 6: Spuštění útok aireplay-ng

**Řekni:** „V druhém okně terminálu spustíme `sudo aireplay-ng --deauth 10 -a <BSSID> -c <MAC_KLIENTA> wlan0mon`. Příkaz pošle 10 deautentizačních paketů a klienta na okamžik odpojí.“

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

**Řekni:** „Spustíme `aircrack-ng -w /usr/share/wordlists/rockyou.txt vysledek-01.cap`. Slovník `rockyou.txt` v Kali Linuxu obsahuje přes 14 milionů reálných hesel. Nástroj začne zkoušet tisíce hesel za sekundu.“

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

**Přechod:** „Přejděme k závěrečné kategorii: Ochrana, etika a cvičení.“

---

## 26. Kategorie 6: Ochrana, etické pravidla a cvičení

**Řekni:** „V poslední části si probereme, jak se před těmito útoky bránit, etické hranice a vyzkoušíte si praktické cvičení.“

**Zapojení / ukázka:** Zobrazte dělící slajd kategorie 6.

**Přechod:** „Jak zabezpečit vlastní Wi-Fi síť?“

---

## 27. Jak zabezpečit vlastní Wi-Fi?

**Řekni:** „Ochrana před slovníkovým útokem je jednoduchá: používejte silné heslo o délce alespoň 15 znaků (např. přístupové fráze z více slov). Přepněte na WPA3 nebo WPA2-AES a bezpodmínečně vypněte zastaralou funkci WPS.“

**Zapojení / ukázka:** Zdůrazněte, že heslo typu `Admin123` podlehne během sekundy, zatímco 15místné náhodné heslo je nezlomitelné.

**Přechod:** „Zopakujme si bezpečnostní a etická pravidla.“

---

## 28. Zlatá pravidla bezpečnosti a etiky

**Řekni:** „Testování Wi-Fi provádíme výhradně na svých vlastních zařízeních nebo s písemným souhlasem vlastníka. Testovat cizí Wi-Fi v sousedství nebo ve škole je protiprávní. V učebně se zaměříme výhradně na naši vyhrazenou testovací Wi-Fi.“

**Zapojení / ukázka:** Ubezpečte se, že všichni studenti rozumí etickým hranicím.

**Přechod:** „Nyní je čas na vaše praktické cvičení v Kali Linuxu!“

---

## 29. Dnešní praktické cvičení v Kali Linuxu

**Řekni:** „Otevřete si Kali Linux, přepněte kartu do monitor módu, najděte naši testovací síť přes `airodump-ng`, odchytněte WPA2 Handshake a pomocí `aircrack-ng` a slovníku `rockyou.txt` odhalte heslo!“

**Zapojení / ukázka:** Obcházejte učebnu, pomáhejte studentům s příkazy a řešte případné problémy s kartami.

**Přechod:** „Pojďme si na závěr shrnout to nejdůležitější.“

---

## 30. Co si z dneška odnést

**Řekni:** „Dnes jsme zvládli: `airmon-ng` přepíná kartu do Monitor módu, `airodump-ng` skenuje sítě a ukládá handshaky, `aireplay-ng` vyvolá přihlášení klienta deautentizací a `aircrack-ng` louská hesla offline. Základem bezpečnosti Wi-Fi je dlouhé a silné heslo!“

**Zapojení / ukázka:** Poděkujte všem za pozornost a odpovězte na případné dotazy studentů.
