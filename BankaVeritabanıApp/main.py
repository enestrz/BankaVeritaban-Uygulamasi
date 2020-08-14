from postgreManager import PostgreManager

pg = PostgreManager()

def personelListele():
    sonuc = pg.personelleriListele()
    for id, adi, soyadi, departman in sonuc:
        print("id:"+str(id)+" - "+adi+" "+soyadi+" - " + departman )

def musteriListele():
    sonuc = pg.musterileriListele()
    for id, adi, soyadi in sonuc:
        print("id:"+str(id)+" - "+adi+" "+soyadi )

def hesapAc():
    hesapNo = input("Hesap Numarasını Giriniz: ")
    hesapTuruKodu = input("Hesap Türünü Giriniz: (Vadeli için 1 , vadesiz için 2)")
    musteriId = input("Müşteri Numarasını Giriniz: ")
    personelId = input("Personel Numarasını Giriniz: ")
    icindekiPara = input("Para giriniz: (Eğer Yoksa 0 Yazın) ")
    pg.hesapEkle(hesapNo, hesapTuruKodu, musteriId, personelId, icindekiPara)

def hesapSil():
    hesapNo = input("Silinecek hesap numarasını giriniz: ")
    pg.hesapSil(hesapNo)    

def hesabaParaEkle():
    hesapNo = input("Para eklenecek hesap numarası: ")
    miktar = input("Eklenecek para miktarı: ")
    pg.hesabaParaYukleme(hesapNo,miktar)

def hesaptanParaGonder():
    hesapNo = input("Para çekilecek hesap numarası: ")
    miktar = input("Gönderilecek para miktarı: ")
    pg.hesaptanParaGonder(hesapNo,miktar)

while True:
    print("1. Personelleri Listele\n2. Müşterileri Listele\n3. Hesap Ekle\n4. Hesap Sil\n5. Hesapa Para Yükle\n6. Hesaptan Para Gönder\n6.Çıkış (E/Ç)")
    islem = input("Seçim: ")

    if islem == "1":
        personelListele()
        input("Geri dönmek için herhangi bir tuşa basın: ")

    elif islem == "2":
        musteriListele()
        input("Geri dönmek için herhangi bir tuşa basın: ")
        
    elif islem == "3":
        hesapAc()
        input("Geri dönmek için herhangi bir tuşa basın: ")

    elif islem == "4":
        hesapSil()
        input("Geri dönmek için herhangi bir tuşa basın: ")

    elif islem == "5":
        hesabaParaEkle()
        input("Geri dönmek için herhangi bir tuşa basın: ")

    elif islem == "6":
        hesaptanParaGonder()
        
    elif islem == "E" or islem == "Ç" or islem == "e" or islem == "ç":
        print("Çıkış yapıldı.")
        break
    else:
        print("Yanlış bir seçim yaptınız lütfen baştan seçin!") 







