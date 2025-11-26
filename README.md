## Opis projekta
FoodIQ je pametna aplikacija, ki omogoča uporabnikom skeniranje izdelkov z mobilnim telefonom in takojšen prikaz hranilnih vrednosti (kalorije, beljakovine, maščobe, ogljikovi hidrati). Uporabnik lahko vodi svojo domačo shrambo, preverja sestavo izdelkov in spremlja svoj prehranski vnos.

---

## 📊 Diagram primerov uporabe

<img width="762" height="672" alt="TIDSLukaKitanovskiVaja0 drawio" src="https://github.com/user-attachments/assets/429fea3d-39fb-42f9-9768-89f2aaedb64f" />

**Opis funkcionalnosti:**
- Registracija in prijava uporabnikov
- Skeniranje črtne kode izdelkov
- Prikaz nutricijskih informacij
- Shranjevanje priljubljenih izdelkov
- Upravljanje z obroki in načrti prehrane
- Predlaganje receptov na osnovi shranjenih izdelkov

---

## 🗃️ Shema podatkovne baze

### ER Diagram
<img width="624" height="572" alt="er_diagram" src="https://github.com/user-attachments/assets/6ce86143-57cf-4826-8256-7a05c4ed3e86" />

### Opis podatkovne strukture
- **Uporabnik** - shranjevanje podatkov o uporabnikih
- **Produkt** - informacije o živilskih izdelkih z barkodom
- **Obrok** - načrti obrokov po dnevih in vrstah
- **ObrokProdukt** - povezava izdelkov z obroki
- **Recept** - shranjevanje receptov in njihovih hranilnih vrednosti
- **NajljubšiIzdelki** - priljubljeni izdelki uporabnikov

---

## 📱 Zaslonske slike aplikacije

<div align="center">

### Glavni ekrani aplikacije FoodIQ

<table style="margin: 0 auto;">
  <tr>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/756f872b-4a7b-41cc-8b9a-2ab5a79167f2" width="180">
      <br>
      <sub><b>Prijava</b></sub>
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/5ae14641-2255-465b-b639-b5759edda3a6" width="180">
      <br>
      <sub><b>Skeniranje</b></sub>
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/b8fd523f-05d0-4ba5-ba7e-ed463880cac0" width="180">
      <br>
      <sub><b>Produkt</b></sub>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/e6d1b14c-082a-425f-bf02-53a9827c7726" width="180">
      <br>
      <sub><b>Izdelki</b></sub>
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/c37df1d6-8941-4685-809e-f299f7a932a0" width="180">
      <br>
      <sub><b>Recepti</b></sub>
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/29856af2-0f14-4c30-a358-bb5f6ef21165" width="180">
      <br>
      <sub><b>Profil</b></sub>
    </td>
  </tr>
</table>

</div>

## 🛠️ Uporabljene tehnologije

- **Flutter** - Razvoj mobilne aplikacije
- **Dart** - Programski jezik
- **Android Studio** - Razvojno okolje
