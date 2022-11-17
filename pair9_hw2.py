print("Not hesaplayacağınız ders sayısını giriniz.")
dersSayisi=int(input())
a=0
b=0
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
        a=a+1
    else :
        b=b+1

print(f"Kalınan ders sayısı:{a}")
print(f"Geçilen ders sayısı:{b}")
