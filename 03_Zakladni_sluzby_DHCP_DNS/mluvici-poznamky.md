# Mluvené poznámky ke každému slajdu — Letní škola sítí: 3. Základní služby DHCP a DNS

Scénář je psaný pro úplné začátečníky. Není potřeba učit se ho doslova. Text po značce **Řekni** můžeš použít skoro jako hotovou formulaci, **Zapojení / ukázka** říká, co máš udělat s publikem, a **Přechod** ti pomůže plynule navázat.

U DHCP proces DORA předveď dramatizovaným rozhovorem klienta a serveru.

## Doporučené tempo

- Slajdy 1–11: DHCP (princip DORA, lease, Linux konfigurace a obnovení), přibližně 45 minut.
- Slajdy 12–20: DNS (domény, hierarchie, A/AAAA/CNAME záznamy, dig a /etc/hosts), přibližně 45 minut.
- Slajdy 21–24: Praktické cvičení (kontrola DHCP a DNS v terminálu), přibližně 30 minut.

---

## 1. Základní služby

**Řekni:** „Vítám vás u bloku věnovanému dvěma absolutně klíčovým službám každé sítě: DHCP a DNS.“

**Zapojení / ukázka:** Zeptej se: „Co by se stalo, kdybyste museli nastavit IP adresu ručně na každém svém zařízení?“

**Přechod:** „Začneme službou DHCP.“

## 2. Co dnes probereme

**Řekni:** Vysvětli téma "Co dnes probereme". Projdi podrobnosti. DHCP:Jak počítač získá adresu Konfigurace klienta:Jak to vypadá v Linuxu DNS:Telefonní seznam internetu Záznamy a resolver:Kam se systém dívá Diagnostika:Když „nejde internet“

**Zapojení / ukázka:** Názorně ukaž v konzoli linuxové nástroje `dhclient`, `dig` nebo soubor `/etc/resolv.conf`.

**Přechod:** Přejdeme na další slajd.

## 3. DHCP

**Řekni:** „DHCP (Dynamic Host Configuration Protocol) automaticky přiděluje IP adresy, masky, brány a DNS servery zařízením, která se připojí k síti.“

**Zapojení / ukázka:** Vysvětli, že bez DHCP by v síti nastal chaos a konflikty IP adres.

**Přechod:** „Jak přesně probíhá vyjednání IP adresy? Pomocí procesu DORA.“

## 4. Proč DHCP?

**Řekni:** Vysvětli téma "Proč DHCP?". Projdi podrobnosti. Ruční nastavování IP adres je u stovek zařízení nemožné. Zabraňuje konfliktům (duplicitní IP adresy). Umožňuje centrální správu (změna DNS pro celou síť naráz).

**Zapojení / ukázka:** Názorně ukaž v konzoli linuxové nástroje `dhclient`, `dig` nebo soubor `/etc/resolv.conf`.

**Přechod:** Přejdeme na další slajd.

## 5. Jak to funguje? (DORA)

**Řekni:** „Proces DORA má 4 kroky: 1. Discover (klient křičí 'Je tu DHCP server?'), 2. Offer (server nabízí IP), 3. Request (klient žádá nabízenou IP), 4. Acknowledge (server potvrzuje a pronajímá IP).“

**Zapojení / ukázka:** Předveď dialog se kolegou lektorem (jeden je klient, druhý DHCP server).

**Přechod:** „IP adresa není přidělena navždy – funguje na principu pronájmu (Lease).“

## 6. DHCP Lease (Pronájem)

**Řekni:** Vysvětli téma "DHCP Lease (Pronájem)". Projdi podrobnosti. IP adresa není tvoje navždy. Lease Time:Doba, na kterou máš adresu půjčenou. V polovině doby se klient pokusí o obnovení (Renewal).

**Zapojení / ukázka:** Názorně ukaž v konzoli linuxové nástroje `dhclient`, `dig` nebo soubor `/etc/resolv.conf`.

**Přechod:** Přejdeme na další slajd.

## 7. Co všechno DHCP posílá?

**Řekni:** Vysvětli téma "Co všechno DHCP posílá?". Projdi podrobnosti. IP adresa a maska sítě Výchozí brána (Default Gateway) DNS servery Někdy i jméno počítače nebo časový server (NTP)

**Zapojení / ukázka:** Názorně ukaž v konzoli linuxové nástroje `dhclient`, `dig` nebo soubor `/etc/resolv.conf`.

**Přechod:** Přejdeme na další slajd.

## 8. DHCP na Linuxu

**Řekni:** Vysvětli téma "DHCP na Linuxu". Projdi podrobnosti. Klient a diagnostika

**Zapojení / ukázka:** Názorně ukaž v konzoli linuxové nástroje `dhclient`, `dig` nebo soubor `/etc/resolv.conf`.

**Přechod:** Přejdeme na další slajd.

## 9. Správci sítě

**Řekni:** Vysvětli téma "Správci sítě". Projdi podrobnosti. NetworkManager:Běžný na desktopech (příkaznmcli). systemd-networkd:Častý na serverech. dhclient:Klasický nízkoúrovňový nástroj.

**Zapojení / ukázka:** Názorně ukaž v konzoli linuxové nástroje `dhclient`, `dig` nebo soubor `/etc/resolv.conf`.

**Přechod:** Přejdeme na další slajd.

## 10. Jak získat novou adresu?

**Řekni:** Vysvětli téma "Jak získat novou adresu?". Projdi podrobnosti. 

**Zapojení / ukázka:** Názorně ukaž v konzoli linuxové nástroje `dhclient`, `dig` nebo soubor `/etc/resolv.conf`.

**Přechod:** Přejdeme na další slajd.

## 11. Kde hledat chybu?

**Řekni:** Vysvětli téma "Kde hledat chybu?". Projdi podrobnosti. 

**Zapojení / ukázka:** Názorně ukaž v konzoli linuxové nástroje `dhclient`, `dig` nebo soubor `/etc/resolv.conf`.

**Přechod:** Přejdeme na další slajd.

## 12. DNS

**Řekni:** „Nyní přecházíme k DNS (Domain Name System). Lidé si pamatují názvy jako `ssps.cz`, ale počítače rozumí pouze IP adresám. DNS funguje jako telefonní seznam internetu.“

**Zapojení / ukázka:** Zeptej se: „Kdo z vás si pamatuje IP adresu Google z hlavy?“

**Přechod:** „Podíváme se na hierarchii DNS stromu.“

## 13. K čemu to je?

**Řekni:** Vysvětli téma "K čemu to je?". Projdi podrobnosti. Lidé si pamatujígoogle.com, počítače potřebují142.250.184.206. DNS funguje jako distribuovaná databáze, která tento překlad zajišťuje.

**Zapojení / ukázka:** Názorně ukaž v konzoli linuxové nástroje `dhclient`, `dig` nebo soubor `/etc/resolv.conf`.

**Přechod:** Přejdeme na další slajd.

## 14. Hierarchie DNS

**Řekni:** Vysvětli téma "Hierarchie DNS". Projdi podrobnosti. Tečka na konci značí absolutní kořen, i když ji běžně nepíšeme.

**Zapojení / ukázka:** Názorně ukaž v konzoli linuxové nástroje `dhclient`, `dig` nebo soubor `/etc/resolv.conf`.

**Přechod:** Přejdeme na další slajd.

## 15. Typy záznamů

**Řekni:** „DNS používá různé typy záznamů: A (IPv4 adresa), AAAA (IPv6 adresa), CNAME (alias), MX (mail server), TXT (textové informace a verifikace).“

**Zapojení / ukázka:** Ukaž DNS dotaz pomocí příkazu `dig ssps.cz A`.

**Přechod:** „Kde Linux uchovává nastavení DNS resolveru?“

## 16. DNS v Linuxu

**Řekni:** Vysvětli téma "DNS v Linuxu". Projdi podrobnosti. Resolver — jak se systém ptá

**Zapojení / ukázka:** Názorně ukaž v konzoli linuxové nástroje `dhclient`, `dig` nebo soubor `/etc/resolv.conf`.

**Přechod:** Přejdeme na další slajd.

## 17. /etc/resolv.conf

**Řekni:** „V Linuxu konfiguraci DNS resolveru najdete v souboru `/etc/resolv.conf`, kde jsou zapsányIP adresy nameserverů (např. `nameserver 1.1.1.1`).“

**Zapojení / ukázka:** Nechte účastníky otevřít soubor `cat /etc/resolv.conf`.

**Přechod:** „A jak funguje lokální překlad přednostně před DNS?“

## 18. /etc/hosts

**Řekni:** „Soubor `/etc/hosts` umožňuje ručně spárovat IP adresu s doménou pouze na daném počítači bez ohledu na DNS server.“

**Zapojení / ukázka:** Vyzkoušejte přidat testovací zápis `127.0.0.1 mujtest.local`.

**Přechod:** „Pustíme se do závěrečného praktického cvičení.“

## 19. Diagnostika: dig

**Řekni:** Vysvětli téma "Diagnostika: dig". Projdi podrobnosti. 

**Zapojení / ukázka:** Názorně ukaž v konzoli linuxové nástroje `dhclient`, `dig` nebo soubor `/etc/resolv.conf`.

**Přechod:** Přejdeme na další slajd.

## 20. Rychlejší alternativy

**Řekni:** Vysvětli téma "Rychlejší alternativy". Projdi podrobnosti. 

**Zapojení / ukázka:** Názorně ukaž v konzoli linuxové nástroje `dhclient`, `dig` nebo soubor `/etc/resolv.conf`.

**Přechod:** Přejdeme na další slajd.

## 21. Praktické cvičení

**Řekni:** Vysvětli téma "Praktické cvičení". Projdi podrobnosti. 

**Zapojení / ukázka:** Názorně ukaž v konzoli linuxové nástroje `dhclient`, `dig` nebo soubor `/etc/resolv.conf`.

**Přechod:** Přejdeme na další slajd.

## 22. 1. DHCP Kontrola

**Řekni:** Vysvětli téma "1. DHCP Kontrola". Projdi podrobnosti. 

**Zapojení / ukázka:** Názorně ukaž v konzoli linuxové nástroje `dhclient`, `dig` nebo soubor `/etc/resolv.conf`.

**Přechod:** Přejdeme na další slajd.

## 23. 2. DNS Průzkum

**Řekni:** Vysvětli téma "2. DNS Průzkum". Projdi podrobnosti. 

**Zapojení / ukázka:** Názorně ukaž v konzoli linuxové nástroje `dhclient`, `dig` nebo soubor `/etc/resolv.conf`.

**Přechod:** Přejdeme na další slajd.

## 24. 3. Vlastní hostitel

**Řekni:** Vysvětli téma "3. Vlastní hostitel". Projdi podrobnosti. Uprav/etc/hoststak, aby adresamoje.lokalkavedla na127.0.0.1. Ověř pomocíping moje.lokalka.

**Zapojení / ukázka:** Názorně ukaž v konzoli linuxové nástroje `dhclient`, `dig` nebo soubor `/etc/resolv.conf`.

**Přechod:** Přejdeme na další slajd.
