print("Not hesaplayacağınız ders sayısını giriniz.")
dersSayisi=int(input())
a=0
b=0

gecilenDersler =[]
kalinanDersler =[]

for x in range(0,dersSayisi):

    print(f"{x+1}.Vize notunuzu giriniz : ")
    vize=input()
    print(f"{x+1}.Final notunuzu giriniz : ")
    final=input()
    vizeTotal1=float(vize)

    finalTotal2=float(final)

    vizeTotal= 0.4*vizeTotal1
    finalTotal= 0.6*finalTotal2

    totalNote= vizeTotal+finalTotal

    if totalNote<50:
        kalinanDersler.append(totalNote)
        a=a+1
    else :
        gecilenDersler.append(totalNote)
        b=b+1

print(f"Kalınan ders sayısı:{a}")
print(f"Geçilen ders sayısı:{b}")
print(f"Kalınan dersler:{kalinanDersler}")
print(f"Geçilen dersler:{gecilenDersler}")
