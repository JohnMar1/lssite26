# Mluvené poznámky ke každému slajdu — Letní škola sítí: 7. Cloudflare a publikování služeb

Scénář je psaný pro lektory i účastníky. Text po značce **Řekni** představuje hotovou formulaci výkladu, **Zapojení / ukázka** uvádí praktické akce v učebně a **Přechod** pomáhá plynule navázat na další téma.

---

## 1. Titulní slajd — Cloudflare a publikování služeb

**Řekni:** „Vítám vás u modulu 7. Cloudflare a publikování služeb. Dnes si ukážeme, jak vaše aplikace a servery publikovat do celého internetu pomocí vaší vlastní domény.“

**Zapojení / ukázka:** Zeptejte se účastníků: „Kdo z vás už někdy zkoušel dostat svoji webovou stránku nebo herní server na internet?“

**Přechod:** „Podívejme se na přehled témat, která si dnes probereme.“

---

## 2. Co dnes probereme

**Řekni:** „Projdeme si vše od základů: vysvětlíme si fungování domén a Cloudflare, představíme si nástroj Cloudflare Tunnel, nainstalujeme a přihlásíme `cloudflared`, vytvoříme tunel, nastavíme směrování a na závěr si vše otestujeme.“

**Zapojení / ukázka:** Projděte seznam na slajdu.

**Přechod:** „Začněme první kategorií: Vlastní doména a Cloudflare.“

---

## 3. Kategorie 1: Vlastní doména a Cloudflare

**Řekni:** „V první části si vysvětlíme, co je to doména a jaké výhody nám přináší služba Cloudflare.“

**Zapojení / ukázka:** Zobrazte dělící slajd kategorie 1.

**Přechod:** „Máme skvělou zprávu: každý z vás má vlastní doménu!“

---

## 4. Máme vlastní doménu!

**Řekni:** „Každý účastník Letní školy sítí od nás dostal vlastní doménu. Dnes ji použijeme k tomu, abyste mohli své projekty ukázat komukoliv na světě.“

**Zapojení / ukázka:** Sdělte účastníkům jejich přidělené názvy domén.

**Přechod:** „Vysvětleme si, co je to doména.“

---

## 5. Co je to doména (DNS)?

**Řekni:** „Doména je lidsky čitelná adresa webu, jako je například `mojedomena.cz`. Nahrazuje složité číselné IP adresy. Systém DNS funguje jako telefonní seznam internetu, který tyto názvy překládá.“

**Zapojení / ukázka:** Přirovnejte doménu ke jménu v kontaktech telefonu.

**Přechod:** „Co je to služba Cloudflare?“

---

## 6. Co je Cloudflare?

**Řekni:** „Cloudflare je celosvětová síť serverů. Poskytuje rychlé DNS překlady, chrání weby před útoky a automaticky dodává bezplatné bezpečnostní SSL certifikáty.“

**Zapojení / ukázka:** Vysvětlete, že Cloudflare stojí jako ochranný štít mezi návštěvníkem a vaším počítačem.

**Přechod:** „Jak se běžně publikují služby bez Cloudflare?“

---

## 7. Jak se běžně publikují služby?

**Řekni:** „Tradiční publikování vyžaduje mít od poskytovatele veřejnou IP adresu a ručně nastavit přesměrování portů na routeru.“

**Zapojení / ukázka:** Ukažte na tabuli schéma připojení přes veřejnou IP.

**Přechod:** „Proč je veřejná IP v praxi problém?“

---

## 8. Proč je veřejná IP problém?

**Řekni:** „Většina domácností i škol veřejnou IP adresu nemá nebo si za ni poskytovatelé účtují vysoké poplatky. Navíc přímé vystavení počítače do internetu přináší bezpečnostní rizika.“

**Zapojení / ukázka:** Zdůrazněte, že v učebně veřejné IP adresy na počítačích nemáme.

**Přechod:** „Přejděme do druhé kategorie: Princip Cloudflare Tunnel.“

---

## 9. Kategorie 2: Princip Cloudflare Tunnel

**Řekni:** „Ve druhé části si představíme technologii Cloudflare Tunnel.“

**Zapojení / ukázka:** Zobrazte dělící slajd kategorie 2.

**Přechod:** „Co je to Cloudflare Tunnel?“

---

## 10. Co je Cloudflare Tunnel?

**Řekni:** „Cloudflare Tunnel je bezpečný šifrovaný tunel spojený mezi vaším počítačem a servery Cloudflare. Umožňuje publikovat jakoukoliv službu zcela bez veřejné IP adresy.“

**Zapojení / ukázka:** Přirovnejte tunel k bezpečnému potrubí vedoucímu přímo z vašeho PC do internetu.

**Přechod:** „Jaká je hlavní výhoda tunelu?“

---

## 11. Hlavní výhoda tunelu

**Řekni:** „Hlavní výhodou je, že se nemusíte dotýkat žádných routerů ani řešit pravidla v síti. Vše funguje i na školní síti nebo na mobilním hotspotu.“

**Zapojení / ukázka:** Zdůrazněte, že nastavení zvládne každý bez přístupu k routeru.

**Přechod:** „Jak tunel funguje na pozadí?“

---

## 12. Jak tunel funguje?

**Řekni:** „Náš počítač naváže odchozí spojení na servery Cloudflare. Návštěvník se připojí na Cloudflare a ten přeposílá data přes náš vytvořený tunel k nám.“

**Zapojení / ukázka:** Ukažte rozbor odchozího a příchozího datového toku.

**Přechod:** „Jaké to má bezpečnostní přínosy?“

---

## 13. Bezpečnostní přínos

**Řekni:** „Protože spojení vychází z našeho počítače ven, všechny příchozí porty na našem PC zůstanou zavřené a útočníci nevidí naši skutečnou IP adresu.“

**Zapojení / ukázka:** Zdůrazněte vysoký stupeň zabezpečení.

**Přechod:** „Přejděme do třetí kategorie: Instalace a přihlášení cloudflared.“

---

## 14. Kategorie 3: Instalace a přihlášení cloudflared

**Řekni:** „Ve třetí části si nainstalujeme pomocný program `cloudflared`.“

**Zapojení / ukázka:** Zobrazte dělící slajd kategorie 3.

**Přechod:** „Co je to za program?“

---

## 15. Co je program `cloudflared`?

**Řekni:** „`cloudflared` je malý konzolový program pro Linux, který spravuje připojení nášho tunelu na pozadí.“

**Zapojení / ukázka:** Vysvětlete, že program poběží jako služba.

**Přechod:** „Nainstalujme si jej v Linuxu.“

---

## 16. Krok 1: Instalace `cloudflared`

**Řekni:** „Otevřete terminál a zadejte příkaz `sudo apt update && sudo apt install -y cloudflared`.“

**Zapojení / ukázka:** Předveďte instalaci na projektoru.

**Přechod:** „Jak ověříme správnost instalace?“

---

## 17. Krok 2: Ověření instalace

**Řekni:** „Nainstalování ověříme příkazem `cloudflared --version`. Měla by se zobrazit aktuální verze programu.“

**Zapojení / ukázka:** Zkontrolujte výstup v terminálu studentů.

**Přechod:** „Přihlasme se k nášmu Cloudflare účtu.“

---

## 18. Krok 3: Přihlášení k účtu

**Řekni:** „V terminálu zadejte příkaz `cloudflared tunnel login`. Tím propojíme náš počítač s účtem Cloudflare.“

**Zapojení / ukázka:** Ukažte vygenerovaný webový odkaz v terminálu.

**Přechod:** „Jak provedeme autorizaci domény?“

---

## 19. Krok 4: Autorizace domény

**Řekni:** „Klikněte na odkaz v terminálu, přihlaste se v prohlížeči a vyberte vaši přidělenou doménu. Potvrďte autorizaci.“

**Zapojení / ukázka:** Pomozte účastníkům s výběrem domény v prohlížeči.

**Přechod:** „Přejděme do čtvrté kategorie: Vytvoření a konfigurace tunelu.“

---

## 20. Kategorie 4: Vytvoření a konfigurace tunelu

**Řekni:** „Ve čtvrté části vytvoříme náš první tunel a nakonfigurujeme směrování.“

**Zapojení / ukázka:** Zobrazte dělící slajd kategorie 4.

**Přechod:** „Vytvořme tunel příkazem.“

---

## 21. Krok 5: Vytvoření tunelu

**Řekni:** „V terminálu zadejte příkaz `cloudflared tunnel create moje-lss`. Tím vytvoříte nový tunel.“

**Zapojení / ukázka:** Ukažte v terminálu vygenerované unikátní ID tunelu.

**Přechod:** „Co se na pozadí stalo?“

---

## 22. Co se stalo?

**Řekni:** „Vytvořilo se unikátní identifikační číslo tunelu a v domovské složce `~/.cloudflared/` se uložil bezpečnostní klíč.“

**Zapojení / ukázka:** Vysvětlete, že tento klíč slouží k ověření vašich práv.

**Přechod:** „Nyní propojíme doménu s tunelem.“

---

## 23. Krok 6: Propojení domény s tunelem

**Řekni:** „Zadejte příkaz `cloudflared tunnel route dns moje-lss web.mojedomena.cz`. Název `mojedomena.cz` nahraďte vaší doménou.“

**Zapojení / ukázka:** Předveďte příkaz na projektoru.

**Přechod:** „Co tento příkaz vytvořil?“

---

## 24. Co je to CNAME záznam?

**Řekni:** „Příkaz automaticky vytvořil CNAME záznam v DNS. Ten říká: Kdo hledá adresu `web.mojedomena.cz`, bude přesměrován na náš tunel.“

**Zapojení / ukázka:** Přirovnejte CNAME k ukazateli na rozcestí.

**Přechod:** „Nyní vytvoříme konfigurační soubor.“

---

## 25. Krok 7: Vytvoření konfigurace

**Řekni:** „V terminálu otevřeme editor nano zadáním `nano ~/.cloudflared/config.yml`.“

**Zapojení / ukázka:** Zkontrolujte otevření editoru nano.

**Přechod:** „Podívejme se na obsah konfiguračního souboru.“

---

## 26. Ukázka `config.yml`

**Řekni:** „Do souboru vložíme ID nášho tunelu, cestu ke klíči a pravidlo směrování: požadavky na adresu `web.mojedomena.cz` pošleme na lokální port 80.“

**Zapojení / ukázka:** Vysvětlete sekci `ingress` v konfiguraci.

**Přechod:** „Přejděme do páté kategorie: Spuštění a testování služby.“

---

## 27. Kategorie 5: Spuštění a testování služby

**Řekni:** „V páté části tunel spustíme a otestujeme připojení.“

**Zapojení / ukázka:** Zobrazte dělící slajd kategorie 5.

**Přechod:** „Spusťme tunel příkazem.“

---

## 28. Krok 8: Spuštění tunelu

**Řekni:** „V terminálu zadejte příkaz `cloudflared tunnel run moje-lss`. Tunel naváže spojení a začne předávat provoz.“

**Zapojení / ukázka:** Ukažte v terminálu výpis o úspěšném připojení k Cloudflare serverům.

**Přechod:** „Pojďme službu otestovat v prohlížeči.“

---

## 29. Testování v prohlížeči

**Řekni:** „Otevřete webový prohlížeč a zadejte adresu `https://web.mojedomena.cz`. Uvidíte vaši stránku běžet přímo z vašeho počítače!“

**Zapojení / ukázka:** Předveďte načtení stránky z mobilního telefonu nebo jiného PC.

**Přechod:** „Všimli jste si zabezpečení HTTPS?“

---

## 30. Automatický SSL certifikát

**Řekni:** „Cloudflare automaticky zabezpečil komunikaci šifrováním HTTPS. Vedle adresy vidíte zelený zámek, bez jakéhokoliv ručního nastavování certifikátů.“

**Zapojení / ukázka:** Ukažte detail certifikátu v prohlížeči.

**Přechod:** „Jak zabezpečíme náš počítač firewallem?“

---

## 31. Zabezpečení firewallem UFW

**Řekni:** „Zapneme lokální firewall příkazem `sudo ufw enable` a zablokujeme příchozí spojení `sudo ufw default deny incoming`. Tunel bude dál fungovat, protože používá odchozí spojení.“

**Zapojení / ukázka:** Předveďte zapnutí UFW firewallu.

**Přechod:** „Přejděme do šesté kategorie: Samostatné cvičení a shrnutí.“

---

## 32. Kategorie 6: Samostatné cvičení a shrnutí

**Řekni:** „V závěrečné části si vše vyzkoušíte samostatně.“

**Zapojení / ukázka:** Zobrazte dělící slajd kategorie 6.

**Přechod:** „Zadejme si samostatný úkol.“

---

## 33. Samostatné cvičení

**Řekni:** „Nyní nainstalujte `cloudflared`, přihlaste se k vašemu účtu, vytvořte tunel `moje-lss`, nasměrujte vaši doménu a vyzkoušejte přístup z mobilního telefonu.“

**Zapojení / ukázka:** Obcházejte učebnu a pomáhejte účastníkům s konfigurací tunelů.

**Přechod:** „Pojďme si modul zrekapitulovat.“

---

## 34. Shrnutí modulu

**Řekni:** „Dnes jsme se naučili publikovat vlastní služby do celého internetu na vlastní doméně bez veřejné IP adresy pomocí Cloudflare Tunnel. Vaše projekty jsou nyní bezpečně dostupné komukoliv na světě!“

**Zapojení / ukázka:** Otevřete prostor pro případné dotazy účastníků.
