haber = "Haberiniz Olsun" #string
vade = 12  #int
faizOrani = 1.47 #float

print(haber)
print(type(vade))
print(type(faizOrani))
print(type(haber))


mesaj = "Hoşgeldin"
musteriAdi = "Ahmet"
musteriSoyadi = "Çalişkan"

print(f"{mesaj} {musteriAdi} {musteriSoyadi}!")
print(mesaj+" "+musteriAdi+" "+musteriSoyadi+ "!")

sayi1 = 10
sayi2 = 20
toplam = sayi1+sayi2
print(sayi1+sayi2)
print(toplam)

dolarDun = 7.65
dolarBugun = 7.55

if dolarDun>dolarBugun:
    print("Azalış Oku")

if dolarBugun>dolarDun:
    print("Azalış Oku")

if dolarDun==dolarBugun:
    print("Eşittir Oku")
