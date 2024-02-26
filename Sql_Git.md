# Git&Sql Learning Tutorial

## BASİC EXAMPLE

### SELECT

* Veritabanındaki tablolardan kayıtları çeker.

>**Kullanım:** SELECT KOLON1, KOLON2, … FROM TABLOADI

```
SELECT * FROM STUDENT 
```

Eğer sadece belli kolonları istiyorsak;

```
SELECT STUDENTNO, STUDENTNAME FROM STUDENT
```



### UPDATE

* Bir tablodaki kaydın bir ya da daha fazla alanını günceller.

>**Kullanım:** UPDATE TABLOADI SET KOLON1 = DEĞER1, …

```
UPDATE STUDENT SET AGE=30
```



### INSERT

* Tabloya yeni kayıt ekler.


>**Kullanım:** INSERT INTO TABLOADI (KOLON1, KOLON2…) VALUES (VALUE1, VALUE2…)

```
INSERT INTO STUDENT (STUDENTNO, STUDENTNAME, SCHOOL, AGE) VALUES(1021, 'ŞEYMA YILMAZ', 'İTÜ', 25)
```



### DELETE

* Bir tablodan kayıt siler.

>**Kullanım:** DELETE FROM TABLOADI

```
DELET FROM STUDENT
```

DELETE komutuyla silme yapıldığında ve daha sonra tabloya değer eklendiğinde id(index) değeri kaldığı yerden devam eder.



### TRUNCATE

* Kayıt silmeye yarar. Fakat yeni kayıt eklendiğinde id(index) değeri baştan başlar.

>**Kullanım:** TRUNCATE TABLE TABLOADI

```
TRUNCATE TABLE STUDENT
```
Bu komuttan sonra tabloya iki değer ekledik ve elde ettiğimiz id’ler 1 den başlıyor.



### DISTINCT

* Tekrar eden satırları tekilleştirmek için kullanılır.

>**Kullanım:** SELECT DISTINCT KOLON1, KOLON2… FROM TABLOADI

```
SELECT DISTINCT STUDENTNAME FROM STUDENT
```

STUDENTNAME kolonunu seçtiğimizde DISTINCT komutunu kullandığımızdan dolayı aynı olan isimler gelmedi.





