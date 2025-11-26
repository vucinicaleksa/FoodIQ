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
      <img src="https://github.com/user-attachments/assets/62d7006d-12b9-49fb-9b84-c64371bd5f84" width="160" style="border-radius: 12px; border: 2px solid #f0f0f0;">
      <br>
      <sub><b>Prijava</b></sub>
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/e04f2254-57d1-4ce7-9a4b-f69262278aab" width="160" style="border-radius: 12px; border: 2px solid #f0f0f0;">
      <br>
      <sub><b>Skeniranje</b></sub>
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/669a951f-a306-4187-81d7-d088e0d27dc5" width="160" style="border-radius: 12px; border: 2px solid #f0f0f0;">
      <br>
      <sub><b>Produkt</b></sub>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/01b0e6f6-144b-4503-be83-c425d2181599" width="160" style="border-radius: 12px; border: 2px solid #f0f0f0;">
      <br>
      <sub><b>Izdelki</b></sub>
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/8ce5e94a-5e60-44f2-8f40-e3ef67167f2c" width="160" style="border-radius: 12px; border: 2px solid #f0f0f0;">
      <br>
      <sub><b>Recepti</b></sub>
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/1f919a13-bf35-46d7-8071-5378799a36d1" width="160" style="border-radius: 12px; border: 2px solid #f0f0f0;">
      <br>
      <sub><b>Profil</b></sub>
    </td>
  </tr>
</table>

</div>
 🛠️ Uporabljene tehnologije

- **Flutter** - Razvoj mobilne aplikacije
- **Dart** - Programski jezik
- **Android Studio** - Razvojno okolje
