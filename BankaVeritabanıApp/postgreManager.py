import psycopg2
from connection import connection
from datetime import date

class PostgreManager:
    def __init__(self):
        self.connection = connection
        self.cursor = self.connection.cursor()

    
    def personelleriListele(self):
        sql = 'SELECT "Personel"."kisiId", "Kisi"."adi", "Kisi"."soyadi", "Departman"."departmanAdi" FROM "Personel" INNER JOIN "Kisi" ON "Personel"."kisiId" = "Kisi"."kisiId" INNER JOIN "Departman" ON "Personel"."departmanKodu" = "Departman"."departmanKodu"'
        self.cursor.execute(sql)
        sonuc = self.cursor.fetchall()
        return sonuc

    def musterileriListele(self):
        sql = 'SELECT "Musteri"."kisiId", "Kisi"."adi", "Kisi"."soyadi" FROM "Musteri" INNER JOIN "Kisi" ON "Musteri"."kisiId" = "Kisi"."kisiId"'
        self.cursor.execute(sql)
        sonuc = self.cursor.fetchall()
        return sonuc

    def hesapEkle(self, hesapNo, hesapTuruKodu, musteriId, personelId, icindekiPara):
        sql = 'INSERT INTO "AcilanHesap" ("hesapNo","hesapTuruKodu", "musteriId", "personelId", "icindekiPara") VALUES (%s, %s, %s, %s, %s)'
        values = (hesapNo, hesapTuruKodu, musteriId, personelId, icindekiPara,)
        self.cursor.execute(sql,values)
        self.connection.commit()
        print("Hesap açma işlemi başarılı")
        
    def hesapSil(self, hesapNo):
        sql = 'DELETE FROM "AcilanHesap" WHERE "hesapNo" = %s'
        values = (hesapNo,)
        self.cursor.execute(sql,values)
        self.connection.commit()
        print("Hesap silme işlemi başarılı")

    def hesabaParaYukleme(self,hesapNo,miktar):
        sql1 = 'SELECT "icindekiPara" FROM "AcilanHesap" WHERE "hesapNo" = %s'
        values1 = (hesapNo,)
        self.cursor.execute(sql1,values1)
        icindekiPara = self.cursor.fetchone()
        sayi = icindekiPara[0]
        sayi += int(miktar)
        sql = 'UPDATE "AcilanHesap" SET "icindekiPara" = %s WHERE "hesapNo" = %s '
        values = (sayi, hesapNo,)
        self.cursor.execute(sql,values)
        self.connection.commit()
        print("Para yükleme işlemi başarılı")

    def hesaptanParaGonder(self,hesapNo,miktar):
        sql1 = 'SELECT "icindekiPara" FROM "AcilanHesap" WHERE "hesapNo" = %s'
        values1 = (hesapNo,)
        self.cursor.execute(sql1,values1)
        icindekiPara = self.cursor.fetchone()
        sayi = icindekiPara[0]
        sayi -= int(miktar)
        if sayi < 0 :
            raise Exception("Bakiyeniz yeterli değil")
        sql = 'UPDATE "AcilanHesap" SET "icindekiPara" = %s WHERE "hesapNo" = %s '
        values = (sayi, hesapNo,)
        self.cursor.execute(sql,values)
        self.connection.commit()
        print("Para gönderme işlemi başarılı")