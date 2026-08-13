# Mluvené poznámky ke každému slajdu — Letní škola sítí: 7. Cloudflare, EmailProfi a publikování služeb

Scénář je psaný pro lektory i účastníky. Text po značce **Řekni** představuje hotovou formulaci výkladu, **Zapojení / ukázka** uvádí praktické akce v učebně a **Přechod** pomáhá plynule navázat na další téma.

---

## 1. Titulní slajd — Cloudflare, EmailProfi a publikování služeb

**Řekni:** „Vítám vás u modulu 7: Cloudflare, EmailProfi a publikování služeb. Dnes si ukážeme, jak plně ovládnout vaši novou doménu, jak si na ní zprovoznit profesionální e-mail na Seznamu zdarma a jak bezpečně publikovat vlastní webové i jiné servery do internetu pomocí Cloudflare Tunnel jako systémové služby.“

**Zapojení / ukázka:** Zeptejte se v třídě: „Kdo z vás už někdy spravoval DNS záznamy nebo chtěl vlastní e-mailovou schránku typu `jmeno@mojedomena.cz`?“

**Přechod:** „Pojďme si projít stručný přehled témat, kterým se dnes budeme věnovat.“

---

## 2. Co dnes probereme

**Řekni:** „Dnes si projdeme 5 hlavních bloků: Prozkoumáme rozhraní Cloudflaru a správy DNS, zprovozníme e-mail na vlastní doméně přes EmailProfi od Seznamu, nainstalujeme si konektor `cloudflared` jako systémovou službu přes `systemctl` a pak si ukážeme, jak všechny subdomény a aplikace přidávat přímo pohodlně z webového prohlížeče.“

**Zapojení / ukázka:** Projděte body agendy na slajdu.

**Přechod:** „Začněme první kategorií: Správa domény v Cloudflare dashboardu.“

---

## 3. Kategorie 1: Cloudflare Dashboard a nastavení domény

**Řekni:** „V první části se podíváme na rozhraní Cloudflare, vysvětlíme si základní druhy DNS záznamů a klíčový rozdíl mezi proxovaným provozem a přímým směrováním.“

**Zapojení / ukázka:** Zobrazte dělící slajd kategorie 1.

**Přechod:** „Každý z vás už má doménu přidanou v Cloudflaru.“

---

## 4. Máme vlastní doménu v Cloudflaru!

**Řekni:** „Všichni účastníci Letní školy sítí od nás obdrželi svou vlastní doménu. Vaše domény mají jako autoritativní jmenné servery nastavený Cloudflare, takže veškerá konfigurační magie se odehrává na jednom přehledném místě.“

**Zapojení / ukázka:** Vyberte jednoho studenta a ukažte přihlášení do rozhraní Cloudflare na jeho doméně na projektoru.

**Přechod:** „Ukažme si základní záložky v rozhraní Cloudflare.“

---

## 5. Přehled Cloudflare rozhraní

**Řekni:** „V Cloudflare dashboardu najdete několik zásadních sekcí: V záložce DNS spravujeme doménové záznamy, v SSL/TLS nastavujeme šifrování webu, v Security řídíme firewallové ochrany a v záložce Zero Trust spravujeme naše tunely.“

**Zapojení / ukázka:** Klikněte v prohlížeči na jednotlivé položky v levém menu Cloudflaru a ukažte jejich umístění.

**Přechod:** „Pojďme si zopakovat hlavní typy DNS záznamů.“

---

## 6. Správa DNS záznamů

**Řekni:** „V DNS se nejčastěji setkáte se čtyřmi typy záznamů: A záznam přikládá doménu k IPv4 adrese, CNAME slouží jako odkaz neboli alias na jiný doménový název, MX určí poštovní servery a TXT slouží pro uložení ověřovacích textů, SPF a DKIM klíčů.“

**Zapojení / ukázka:** Přironejte CNAME k přesměrování a TXT ke zprávě pro ověření totožnosti.

**Přechod:** „Nyní si vysvětlíme extrémně důležitý koncept Cloudflaru: Oranžový a Šedý obláček.“

---

## 7. Oranžový vs. Šedý obláček

**Řekni:** „Oranžový obláček znamená 'Proxied'. Provoz z internetu jde nejprve na servery Cloudflaru, které ho zabezpečí, zašifrují a ochrání před DDoS útoky. To je skvělé pro webové aplikace na HTTP a HTTPS. Šedý obláček znamená 'DNS Only'. Cloudflare vrátí přímo vaši skutečnou IP adresu bez proxyování. Šedý obláček je nutný pro e-maily (MX) a pro nespecifické ne-webové protokoly.“

**Zapojení / ukázka:** Ukažte přepínač Proxy Status v rozhraní Cloudflare DNS.

**Přechod:** „Podívejme se na nastavení SSL/TLS a bezpečnostních prvků.“

---

## 8. SSL/TLS a bezpečnostní prvky

**Řekni:** „Cloudflare vám zdarma poskytuje SSL certifikát. V záložce Edge Certificates zapneme funkce 'Always Use HTTPS' a 'Automatic HTTPS Rewrites', díky čemž se každý návštěvník automaticky přesměruje na bezpečný šifrovaný protokol.“

**Zapojení / ukázka:** Ukažte zapnutí přepínače 'Always Use HTTPS'.

**Přechod:** „Přejděme do druhé kategorie: E-mail na vlastní doméně přes EmailProfi od Seznamu.“

---

## 9. Kategorie 2: E-mail na vlastní doméně přes EmailProfi od Seznamu

**Řekni:** „Ve druhé části si založíme a nakonfigurujeme plnohodnotnou e-mailovou schránku na vlastní doméně s využitím služby EmailProfi od české společnosti Seznam.cz.“

**Zapojení / ukázka:** Zobrazte dělící slajd kategorie 2.

**Přechod:** „Co je to vlastně EmailProfi?“

---

## 10. Co je EmailProfi od Seznam.cz?

**Řekni:** „EmailProfi je bezplatná služba od Seznamu, která vám umožní používat doménu (např. `mojedomena.cz`) pro odesílání a příjem e-mailů. Můžete tak mít e-mail `jan@mojedomena.cz` a přihlašovat se k němu přes klasické webové rozhraní Seznamu nebo mobilní aplikaci.“

**Zapojení / ukázka:** Zobrazte úvodní stránku `emailprofi.seznam.cz`.

**Přechod:** „Jak začít s registrací domény na Seznamu?“

---

## 11. Krok 1: Registrace na EmailProfi

**Řekni:** „Jděte na `emailprofi.seznam.cz`, přihlaste se svým běžným účtem na Seznamu a klikněte na tlačítko 'Přidat doménu'. Zadejte vaši doménu a Seznam vám zobrazí unikátní ověřovací kód.“

**Zapojení / ukázka:** Předveďte vkládání domény do administrace EmailProfi.

**Přechod:** „Jak dokážeme Seznamu, že doména patří právě nám?“

---

## 12. Krok 2: Ověření domény v Cloudflare DNS

**Řekni:** „V Cloudflaru v sekci DNS přidejte nový `TXT` záznam. Jako název zadejte `@` (což představuje kořen domény) a do obsahu vložte vygenerovaný řetězec `seznam-site-verification=...`. Jakmile záznam uložíte, na Seznamu klikněte na 'Ověřit doménu'.“

**Zapojení / ukázka:** Ukažte v Cloudflaru přidání TXT záznamu a následné kliknutí na tlačítko ověření v administraci Seznamu.

**Přechod:** „Doménu máme ověřenou. Jak zajistíme příjem příchozích e-mailů?“

---

## 13. Krok 3: Nastavení MX záznamů pro příjem pošty

**Řekni:** „Aby příchozí e-maily dorazily na Seznam, musíme v Cloudflare DNS vytvořit 2 poštovní MX záznamy: První směřuje na `mx1.seznam.cz` s prioritou 10, druhý na `mx2.seznam.cz` s prioritou 20. Nezapomeňte: MX záznamy MUSÍ mít šedý obláček (DNS Only)!“

**Zapojení / ukázka:** Předveďte vytvoření obou MX záznamů a zdůrazněte nastavení přepínače na Šedý obláček.

**Přechod:** „E-maily již přijímat umíme. Jak zajistíme, aby námi odeslané e-maily nekončily v nevyžádané poště (spamu)?“

---

## 14. Krok 4: Nastavení SPF a DKIM záznamů

**Řekni:** „Pro vysokou doručitelnost musíme nastavit bezpečnostní standardy SPF a DKIM. Přidáme TXT záznam pro SPF s hodnotou `v=spf1 include:spf.seznam.cz ~all` a dále vložíme DKIM TXT záznam, jehož klíč nám vygeneruje administrace EmailProfi.“

**Zapojení / ukázka:** Ukažte vytvoření SPF TXT záznamu a vysvětlete význam `include:spf.seznam.cz`.

**Přechod:** „Znovu zdůrazněme, proč je u e-mailů vyžadován Šedý obláček.“

---

## 15. Proč musí mít e-mail Šedý obláček?

**Řekni:** „Cloudflare v bezplatné verzi vykonává proxy pouze pro protokoly HTTP a HTTPS na portech 80 a 443. E-mailová pošta komunikuje přes protokoly SMTP na portech 25/587 a IMAP na portu 993. Pokud byste zapnuli oranžový obláček u poštovních záznamů, Cloudflare by tyto ne-webové porty zablokoval a pošta by nefungovala.“

**Zapojení / ukázka:** Zobrazte schéma toku poštovních dat přímo mezi servery Seznamu a klientem.

**Přechod:** „Přejděme do třetí kategorie: Cloudflare Tunnel jako systemctl služba.“

---

## 16. Kategorie 3: Cloudflare Tunnel jako systemctl služba

**Řekni:** „Ve třetí části si představíme moderní způsob práce s Cloudflare Tunnel. Už nebudeme nic manuálně konfigurovat v terminálu, ale spravujeme tunel jako pozadní daemon přes `systemctl`.“

**Zapojení / ukázka:** Zobrazte dělící slajd kategorie 3.

**Přechod:** „V čem spočívá nový způsob správy tunelů?“

---

## 17. Nový způsob správy Cloudflare Tunnel

**Řekni:** „Dříve bylo potřeba se v příkazové řádce přihlašovat přes `cloudflared tunnel login`, ručně tvořit soubory `config.yml` a spouštět tunel ručně. Dnes vše definujeme pohodlně z webu Cloudflare Zero Trust a na serveru pouze nainstalujeme systémovou službu konektoru.“

**Zapojení / ukázka:** Porovnejte starý manuální přístup s novým cloudově spravovaným přístupem.

**Přechod:** „Jak založíme tunel ve webovém rozhraní Cloudflare?“

---

## 18. Krok 1: Vytvoření tunelu ve webovém rozhraní

**Řekni:** „V Cloudflare dashboardu vlevo otevřete **Zero Trust**. Přejděte do **Networks** &rarr; **Tunnels** a klikněte na tlačítko **Add a tunnel**. Vyberte možnost **Cloudflared**, pojmenujte tunel například `moje-lss-server` a uložte.“

**Zapojení / ukázka:** Klikněte na vytvoření nového tunelu v Zero Trust rozhraní na projektoru.

**Přechod:** „Co nám Cloudflare nabídne v dalším kroku?“

---

## 19. Krok 2: Instalace `cloudflared` jako systemd služba

**Řekni:** „Webové rozhraní vám přímo vygeneruje unikátní instalátorský příkaz pro váš systém. Zvolíme možnost Debian/Ubuntu a zkopírujeme příkaz vyžadující rootovská práva: `sudo cloudflared service install <token>`. Ten v terminálu jednoduše spustíme.“

**Zapojení / ukázka:** Ukažte vygenerovaný dlouhý příkaz s tokenem a vložte jej do Linuxového terminálu.

**Přechod:** „Jak si ověříme, že služba na serveru správně běží?“

---

## 20. Krok 3: Kontrola běhu služby v Linuxu

**Řekni:** „Po dokončení instalace zadáme v terminálu příkaz `sudo systemctl status cloudflared`. Měli byste vidět zelený stav `active (running)`. Služba je zaregistrována v systému a spustí se automaticky i při restartu počítače.“

**Zapojení / ukázka:** Spusťte příkaz `sudo systemctl status cloudflared` v terminálu a ukažte studentům výpis stavu.

**Přechod:** „Proč je systémová služba přes `systemctl` nesrovnatelně lepší než ruční spouštění?“

---

## 21. Výhody instalace přes `systemctl`

**Řekni:** „Hlavní výhodou je bezúdržbovost a spolehlivost. Služba běží zcela na pozadí, nepotřebujete mít otevřený terminál a v případě výpadku napájení nebo sítě se tunel po opětovném náběhu serveru automaticky sám obnoví.“

**Zapojení / ukázka:** Zdůrazněte studentům, že takto se spravují produkční servery v praxi.

**Přechod:** „Přejděme do čtvrté kategorie: Přidávání služeb a subdomén přes web.“

---

## 22. Kategorie 4: Přidávání služeb a subdomén přes web

**Řekni:** „Ve čtvrté části si ukážeme, jak v rozhraní Cloudflaru přidávat nové subdomény a mapovat je na lokální porty bez jediného zásahu do terminálu serveru.“

**Zapojení / ukázka:** Zobrazte dělící slajd kategorie 4.

**Přechod:** „Kde v prohlížeči nastavíme novou subdoménu?“

---

## 23. Nastavení Public Hostname v prohlížeči

**Řekni:** „V nastavení našeho tunelu v záložce **Public Hostname** klikneme na tlačítko **Add a public hostname**. Zadáme název subdomény (např. `web`), vybereme naši doménu ze seznamu a v sekci Service zvolíme protokol `HTTP` a adresu `localhost:80`.“

**Zapojení / ukázka:** Vyplňte formulář Public Hostname na projektoru a klikněte na **Save hostname**.

**Přechod:** „Jak tento proces funguje na pozadí?“

---

## 24. Jak Cloudflare publikuje webovou aplikaci?

**Řekni:** „Po uložení formuláře Cloudflare automaticky vytvoří CNAME záznam v DNS. Když libovolný uživatel z celého světa otevře `https://web.mojedomena.cz`, požadavek dorazí do síťových uzlů Cloudflare a odtud bezpečně propadne skrz náš nainstalovaný `cloudflared` daemon až na lokální port 80.“

**Zapojení / ukázka:** Otevřete vytvořenou adresu v prohlížeči a ukažte načtení lokálního webu.

**Přechod:** „Lze takto publikovat i jiné aplikace než standardní HTTP servery?“

---

## 25. Publikování dalších typů služeb

**Řekni:** „Určitě ano! Můžete publikovat Docker kontejnery běžící na libovolném portu (např. `http://localhost:8080`), zabezpečené lokální HTTPS weby, ale i ne-webové protokoly jako TCP pro herní servery (např. Minecraft na portu 25565) nebo dokonce vzdálenou správu SSH.“

**Zapojení / ukázka:** Ukažte rozevírací nabídku typů služeb (Type: HTTP, HTTPS, TCP, SSH).

**Přechod:** „Co se stane s SSL certifikátem pro nové subdomény?“

---

## 26. Automatický SSL certifikát z cloudu

**Řekni:** „Každá subdoména publikovaná přes Cloudflare Tunnel získá okamžitě plně důvěryhodný SSL/TLS certifikát. V prohlížeči se zobrazí zelený zámeček, aniž byste museli cokoliv instalovat nebo generovat v Linuxu.“

**Zapojení / ukázka:** Klikněte v prohlížeči na ikonu zámečku vedle URL a ukažte podrobnosti vydaného SSL certifikátu od Cloudflare.

**Přechod:** „Jak zabezpečit náš server pomocí lokálního firewallu UFW?“

---

## 27. Zabezpečení lokálního systému (Firewall UFW)

**Řekni:** „Protože Cloudflare Tunnel vytváří šifrované spojení směrem ven ze serveru, nepotřebujeme mít na serveru otevřené žádné příchozí porty. Můžeme zapnout firewall `sudo ufw enable` a zakázat všechny příchozí požadavky `sudo ufw default deny incoming`. Náš server zůstane pro útočníky zvenčí zcela neviditelný, ale služby přes tunel budou perfektně fungovat!“

**Zapojení / ukázka:** Předveďte zapnutí firewallu UFW v terminálu.

**Přechod:** „Přejděme do páté kategorie: Samostatné cvičení a shrnutí.“

---

## 28. Kategorie 5: Samostatné cvičení a shrnutí

**Řekni:** „V závěrečné části si všechny probírané kroky sami prakticky vyzkoušíte na vašich počítačích.“

**Zapojení / ukázka:** Zobrazte dělící slajd kategorie 5.

**Přechod:** „Zadejme si úkoly pro cvičení.“

---

## 29. Zadání samostatného cvičení

**Řekni:** „Váš úkol má 4 hlavní kroky: 1. Zaregistrujte doménu na EmailProfi od Seznamu a nastavte DNS záznamy. 2. Vytvořte tunel v Cloudflare Zero Trust a nainstalujte jej jako `systemctl` službu. 3. Ověřte příkazem `systemctl status cloudflared`, že služba běží. 4. Přidejte z webu Public Hostname a vyzkoušejte načtení vaší stránky z mobilního telefonu přes HTTPS.“

**Zapojení / ukázka:** Obcházejte studenty v učebně, pomáhejte s nastavováním DNS a kontrolou stavu služby `cloudflared`.

**Přechod:** „Pojďme si na závěr celou lekci zrekapitulovat.“

---

## 30. Shrnutí modulu

**Řekni:** „Dnes jsme probrali kompletní ekosystém správy domény: Umíme konfigurovat Cloudflare DNS a víme, kdy použít Šedý a Oranžový obláček. Provozujeme vlastní e-maily na Seznamu bez poplatků. Naše servery pohání Cloudflare Tunnel běžící jako spolehlivá systémová služba přes `systemctl` a nové služby publikujeme bezpečně a pohodlně přes webový dashboard. Skvělá práce!“

**Zapojení / ukázka:** Dejte účastníkům prostor pro dotazy a diskuzi.
