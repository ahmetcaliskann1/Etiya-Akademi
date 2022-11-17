print("Vize notunuzu giriniz : ")
vize=input()
print("Final notunuzu giriniz : ")
final=input()
vizeTotal1=float(vize)
finalTotal2=float(final)

vizeTotal= 0.4*vizeTotal1
finalTotal= 0.6*finalTotal2

totalNote= vizeTotal+finalTotal

if totalNote<50:
    print(f"Kaldiniz FF Notunuz:{totalNote}")
elif totalNote>=50 and totalNote<=60 :
    print(f"Gectiniz DD Notunuz:{totalNote}")
elif totalNote>60 and totalNote<=70 :
    print(f"Gectiniz CC Notunuz:{totalNote}")
elif totalNote>70 and totalNote<=80 :
    print(f"Gectiniz BB Notunuz:{totalNote}")
elif totalNote>80 and totalNote<=100 :
    print(f"Gectiniz AA Notunuz:{totalNote}")

else:
    print("HATALI GİRİŞ YAPTINIZ")
