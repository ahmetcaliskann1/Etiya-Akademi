
#!karar blokları
#!döngüler

print("2. gün başlangıç")

#!userInput = input()

#!print(f"Girilen değer : {userInput}")

#!type conversation
numberStr = "10"
print(type(numberStr))
number = int(numberStr)
print(type(number))

userInput = input()
lessonNote = float(userInput)
print(f"Ders notunuz : {lessonNote}")

#!n adet continuationa bagli karar bloklari
if lessonNote > 50:
    print("Geçtiniz")
elif lessonNote == 50:
    print("Sinirda Geçtiniz")
elif lessonNote ==49:
    print("Sinirda Kaldiniz")
else:
    print("Kaldiniz")


#!Kullanicidan vize ve final notlari alacak
#!vize %40 final %60 etkili olacak
#!vize ve final notlari 50.5 gibi ondalikli sayilar olabilir.
#!uygulama ortalamayı hesaplayacak ve ortalamaya göre
#!0-49 FF
#!50-60 DD
#!60-70 CC
#!70-80 BB
#!80-100 AA
#!not D ve not harfini kullaniciya gösterecek program

#!döngüler


#! 1. kullanıcı gireceği ders sayısını belirtecek

lessonCount = int(input("Kaç adet ders notu gireceksiniz? :"))

passedExams = 0
failedExams = 0

for i in range(lessonCount):
    
    lessonExam1 = float(input(f"{i+1}.ders için vize notunuzu giriniz : "))
    lessonExam2 = float(input(f"{i+1}.ders için final notunuzu giriniz : "))
    totalExamNote = (lessonExam1*0.4) +(lessonExam2*0.6)
    if totalExamNote>=50:
        passedExams += 1
    else:
       failedExams += 1
print(f"{passedExams}adet dersten geçtiniz. {failedExams} adet dersten kaldınız")
