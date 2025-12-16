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

<table style="margin: 0 auto; border-collapse: collapse;">
  <tr>
    <td align="center" style="padding: 10px;">
      <img src="https://github.com/user-attachments/assets/1ee8ac62-9328-42d2-ba04-9c64d9ade11f" width="160" style="border-radius: 12px; border: 2px solid #e0e0e0; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
      <br>
      <sub><b>Prijava</b></sub>
    </td>
    <td align="center" style="padding: 10px;">
      <img src="https://github.com/user-attachments/assets/6df1c514-55e5-4d0c-808a-628d22f39a99" width="160" style="border-radius: 12px; border: 2px solid #e0e0e0; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
      <br>
      <sub><b>Skeniranje</b></sub>
    </td>
    <td align="center" style="padding: 10px;">
      <img src="https://github.com/user-attachments/assets/635486a2-6dfe-414e-8b8b-7c15137c2d41" width="160" style="border-radius: 12px; border: 2px solid #e0e0e0; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
      <br>
      <sub><b>Produkt</b></sub>
    </td>
  </tr>
  <tr>
    <td align="center" style="padding: 10px;">
      <img src="https://github.com/user-attachments/assets/1ef7cd6f-d6c8-486a-ade7-f2b69bf8d49c" width="160" style="border-radius: 12px; border: 2px solid #e0e0e0; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
      <br>
      <sub><b>Izdelki</b></sub>
    </td>
    <td align="center" style="padding: 10px;">
      <img src="https://github.com/user-attachments/assets/52b1aa86-f526-403c-a281-82e43b2407a6" width="160" style="border-radius: 12px; border: 2px solid #e0e0e0; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
      <br>
      <sub><b>Recepti</b></sub>
    </td>
    <td align="center" style="padding: 10px;">
      <img src="https://github.com/user-attachments/assets/5256efeb-5096-45dd-befa-1f8c7ee8206f" width="160" style="border-radius: 12px; border: 2px solid #e0e0e0; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
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

