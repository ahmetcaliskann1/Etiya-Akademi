
file= open("calisanList.txt","a")
file2 = open("calisanList.txt","r")
oku = file2.read()
try:
    calisanSayi = int(input("Çalışan sayısını giriniz : "))


    for i in range(calisanSayi):
        print(f"{i+1}. Çalışanın Adını Giriniz : ")
        calisanAd = input()
        print(f"{i+1}. Çalışanın SoyAdını Giriniz : ")
        calisanSoyad = str(input())
        print(f"{i+1}. Çalışanın Maaşını Giriniz : ")
        calisanMaas = float(input())
        calisanMaasConvert = str(calisanMaas)
        calisanBilgi = (calisanAd +" "+ calisanSoyad +" - " + calisanMaasConvert )
        file.writelines(f"\n{calisanBilgi}")

except:
    print("Hatalı giriş yaptınız.")

finally:
    print("Program kapatılıyor...")
    file.close()

print(oku)


