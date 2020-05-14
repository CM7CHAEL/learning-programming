--1.Query de la bd CASASHOW
USE CASASHOW
SELECT DISTINCT '{
    "tipDoc" : "' +RTRIM( LTRIM (isnull( 
      CASE   
         WHEN TipIde = 1 THEN 'DNI'  
         WHEN TipIde = 2 THEN 'CE'
         END, ''))) +'",
    "numDoc" : "' +RTRIM( LTRIM( replace (isnull( NumIde,''), char(9),''))) +'",
    "disRes" : "' +RTRIM( LTRIM( replace (isnull( UbiGeoPer,''), char(9),''))) +'",
    "apePat" : "' +RTRIM( LTRIM( replace (isnull( ApePat,''), char(9),''))) +'",
    "apeMat" : "' +RTRIM( LTRIM( replace (isnull( ApeMat,''), char(9),''))) +'",
    "nombres" : "' +RTRIM( LTRIM( replace (isnull( Nombres,''), char(9),''))) +'",
    "fecReg" : "' + 'ISODate('+ (RTRIM( LTRIM (isnull( CONVERT(varchar, FecReg, 127),'')))) + ')' +'",
    "event" : "CASASHOW",
    "email" : "' +RTRIM( LTRIM( replace (isnull( EmailPer,''), char(9),''))) +'",
    "phone" : "' +RTRIM( LTRIM( replace (isnull( CelPer,''), char(9),''))) +'",
    "terminos" : true
}' FROM Registro inner join (
   (select max(FecReg) as Fec,max(id) as Id
    from Registro where NumIde is not null group by numIde)
   ) as filtrado on filtrado.Id = Registro.Id

--2.Query de la bd 
USE COFIDE
SELECT DISTINCT '{
     "tipDoc" : "' +RTRIM( LTRIM (isnull( 
      CASE   
		WHEN TipIde = 1 THEN 'DNI'  
		WHEN TipIde = 2 THEN 'CE'
		END, ''))) +'",
    "numDoc" : "' +RTRIM( LTRIM( replace (isnull( NumIde,''), char(9),''))) +'",
    "disRes" : "' +RTRIM( LTRIM( replace (isnull( UbiGeoPer,''), char(9),''))) +'",
    "apePat" : "' +RTRIM( LTRIM( replace (isnull( ApePat,''), char(9),''))) +'",
    "apeMat" : "' +RTRIM( LTRIM( replace (isnull( ApeMat,''), char(9),''))) +'",
    "nombres" : "' +RTRIM( LTRIM( replace (isnull( Nombres,''), char(9),''))) +'",
    "fecReg" : "' + 'ISODate('+ (RTRIM( LTRIM (isnull( CONVERT(varchar, FecReg, 127),'')))) + ')' +'",
    "event" : "COFIDE",
    "email" : "' +RTRIM( LTRIM( replace (isnull( EmailPer,''), char(9),''))) +'",
    "phone" : "' +RTRIM( LTRIM( replace (isnull( CelPer,''), char(9),''))) +'",
    "terminos" : true
}' FROM Registro inner join (
   (select max(FecReg) as Fec,max(id) as Id
    from Registro where NumIde is not null group by numIde)
   ) as filtrado on filtrado.Id = Registro.Id

--3.Query de la bd EXPOAGUA
USE EXPOAGUA
SELECT DISTINCT  '{
    "tipDoc" : "' +RTRIM( LTRIM( replace (isnull( CodIde,''), char(9),''))) +'",
    "numDoc" : "' +RTRIM( LTRIM( replace (isnull( NumIde,''), char(9),''))) +'",
    "disRes" : "' +RTRIM( LTRIM( replace (isnull( UbiGeoPer,''), char(9),''))) +'",
    "apePat" : "' +RTRIM( LTRIM( replace (isnull( ApePat,''), char(9),''))) +'",
    "apeMat" : "' +RTRIM( LTRIM( replace (isnull( ApeMat,''), char(9),''))) +'",
	"sexo" : "' +RTRIM( LTRIM( replace (isnull( Sexo,''), char(9),''))) +'",
    "nombres" : "' +RTRIM( LTRIM( replace (isnull( Nombres,''), char(9),''))) +'",
	"fecNac" : "' + 'ISODate('+ (RTRIM( LTRIM (isnull( CONVERT(varchar, FecNac, 127),'')))) + ')' +'",
	"fecReg" : "' + 'ISODate('+ (RTRIM( LTRIM (isnull( CONVERT(varchar, filtrado.Fec, 127),'')))) + ')' +'",
    "event" : "EXPOAGUA",
    "email" : "' +RTRIM( LTRIM( replace (isnull( EmailPer,''), char(9),''))) +'",
    "phone" : "' +RTRIM( LTRIM( replace (isnull( CelPer,''), char(9),''))) +'",
    "terminos" : true
}' FROM Registro inner join (
   (select max(FecReg) as Fec,max(r.id) as Id
    from Registro r left JOIN  DETREGISTRO d on r.Id = d.Id where r.NumIde is not null group by numIde)
   ) as filtrado on filtrado.Id = Registro.Id

--4.Query de la bd MIVIVIENDA
USE MIVIVIENDA
SELECT DISTINCT '{
    "tipDoc" : "' +RTRIM( LTRIM (isnull( 
      CASE   
         WHEN TipIde = 1 THEN 'DNI'  
         WHEN TipIde = 2 THEN 'CE'
         END, ''))) +'",
    "numDoc" : "' +RTRIM( LTRIM( replace (isnull( NumIde,''), char(9),''))) +'",
    "disRes" : "' +RTRIM( LTRIM( replace (isnull( UbiGeoPer,''), char(9),''))) +'",
    "apePat" : "' +RTRIM( LTRIM( replace (isnull( ApePat,''), char(9),''))) +'",
    "apeMat" : "' +RTRIM( LTRIM( replace (isnull( ApeMat,''), char(9),''))) +'",
	"sexo" : "' +RTRIM( LTRIM( replace (isnull( Sexo,''), char(9),''))) +'",
    "nombres" : "' +RTRIM( LTRIM( replace (isnull( Nombres,''), char(9),''))) +'",
    "fecReg" : "' + 'ISODate('+ (RTRIM( LTRIM (isnull( CONVERT(varchar, FecReg, 127),'')))) + ')' +'",
    "event" : "MIVIVIENDA",
    "email" : "' +RTRIM( LTRIM( replace (isnull( EmailPer,''), char(9),''))) +'",
    "phone" : "' +RTRIM( LTRIM( replace (isnull( CelPer,''), char(9),''))) +'",
    "terminos" : true
}' FROM Registro inner join (
   (select max(FecReg) as Fec,max(id) as Id
    from Registro where NumIde is not null group by numIde)
   ) as filtrado on filtrado.Id = Registro.Id


--5.Query de la bd REGISTRFIP2016SEP
USE REGISTRFIP2016SEP
SELECT DISTINCT  '{
      "tipDoc" : "' +RTRIM( LTRIM( replace (isnull( CodIde,''), char(9),''))) +'",
    "numDoc" : "' +RTRIM( LTRIM( replace (isnull( NumIde,''), char(9),''))) +'",
    "disRes" : "' +RTRIM( LTRIM( replace (isnull( UbiGeoPer,''), char(9),''))) +'",
    "apePat" : "' +RTRIM( LTRIM( replace (isnull( ApePat,''), char(9),''))) +'",
    "apeMat" : "' +RTRIM( LTRIM( replace (isnull( ApeMat,''), char(9),''))) +'",
	"sexo" : "' +RTRIM( LTRIM( replace (isnull( Sexo,''), char(9),''))) +'",
    "nombres" : "' +RTRIM( LTRIM( replace (isnull( Nombres,''), char(9),''))) +'",
	"fecNac" : "' + 'ISODate('+ (RTRIM( LTRIM (isnull( CONVERT(varchar, FecNac, 127),'')))) + ')' +'",
	"fecReg" : "' + 'ISODate('+ (RTRIM( LTRIM (isnull( CONVERT(varchar, filtrado.Fec, 127),'')))) + ')' +'",
    "event" : "REGISTRFIP2016SEP",
    "email" : "' +RTRIM( LTRIM( replace (isnull( EmailPer,''), char(9),''))) +'",
    "phone" : "' +RTRIM( LTRIM( replace (isnull( CelPer,''), char(9),''))) +'",
    "terminos" : true
}' FROM Registro inner join (
   (select max(FecReg) as Fec,max(r.id) as Id
    from Registro r left JOIN  DETREGISTRO d on r.Id = d.Id where r.NumIde is not null group by numIde)
   ) as filtrado on filtrado.Id = Registro.Id


--6.Query de la bd REGISTROAGUA
USE REGISTROAGUA
SELECT DISTINCT '{
    "tipDoc" : "' +RTRIM( LTRIM (isnull( 
      CASE   
		WHEN TipIde = 1 THEN 'DNI'  
		WHEN TipIde = 2 THEN 'CE'
    END, ''))) +'",
    "numDoc" : "' +RTRIM( LTRIM( replace (isnull( NumIde,''), char(9),''))) +'",
    "disRes" : "' +RTRIM( LTRIM( replace (isnull( UbiGeoPer,''), char(9),''))) +'",
    "apePat" : "' +RTRIM( LTRIM( replace (isnull( ApePat,''), char(9),''))) +'",
    "apeMat" : "' +RTRIM( LTRIM( replace (isnull( ApeMat,''), char(9),''))) +'",
	"sexo" : "' +RTRIM( LTRIM( replace (isnull( Sexo,''), char(9),''))) +'",
    "nombres" : "' +RTRIM( LTRIM( replace (isnull( Nombres,''), char(9),''))) +'",
	"fecNac" : "' + 'ISODate('+ (RTRIM( LTRIM (isnull( CONVERT(varchar, FecNac, 127),'')))) + ')' +'",
	"fecReg" : "' + 'ISODate('+ (RTRIM( LTRIM (isnull( CONVERT(varchar, FecReg, 127),'')))) + ')' +'",
    "event" : "REGISTROAGUA",
    "email" : "' +RTRIM( LTRIM( replace (isnull( EmailPer,''), char(9),''))) +'",
    "phone" : "' +RTRIM( LTRIM( replace (isnull( CelPer,''), char(9),''))) +'",
    "terminos" : true
}' FROM Registro inner join (
   (select max(FecReg) as Fec,max(id) as Id
    from Registro where NumIde is not null group by numIde)
   ) as filtrado on filtrado.Id = Registro.Id

--7.Query de la bd REGISTROFIP error en el correo
USE REGISTROFIP
SELECT DISTINCT '{
    "tipDoc" : "' +RTRIM( LTRIM (isnull( 
      CASE   
		WHEN TipIde = 1 THEN 'DNI'  
		WHEN TipIde = 2 THEN 'CE'
    END, ''))) +'",
    "numDoc" : "' +RTRIM( LTRIM( replace (isnull( NumIde,''), char(9),''))) +'",
    "disRes" : "' +RTRIM( LTRIM( replace (isnull( UbiGeoPer,''), char(9),''))) +'",
    "apePat" : "' +RTRIM( LTRIM( replace (isnull( ApePat,''), char(9),''))) +'",
    "apeMat" : "' +RTRIM( LTRIM( replace (isnull( ApeMat,''), char(9),''))) +'",
	"sexo" : "' +RTRIM( LTRIM( replace (isnull( Sexo,''), char(9),''))) +'",
    "nombres" : "' +RTRIM( LTRIM( replace (isnull( Nombres,''), char(9),''))) +'",
	"fecNac" : "' + 'ISODate('+ (RTRIM( LTRIM (isnull( CONVERT(varchar, FecNac, 127),'')))) + ')' +'",
	"fecReg" : "' + 'ISODate('+ (RTRIM( LTRIM (isnull( CONVERT(varchar, FecReg, 127),'')))) + ')' +'",
    "event" : "REGISTROFIP",
    "email" : "' +RTRIM( LTRIM( replace (isnull( EmailPer,''), char(9),''))) +'",
    "phone" : "' +RTRIM( LTRIM( replace (isnull( CelPer,''), char(9),''))) +'",
    "terminos" : true
}' FROM Registro inner join (
   (select max(FecReg) as Fec,max(id) as Id
    from Registro where NumIde is not null group by numIde)
   ) as filtrado on filtrado.Id = Registro.Id

--8.Query de la bd REGISTROFIP2
USE REGISTROFIP2
SELECT DISTINCT '{
    "tipDoc" : "' +RTRIM( LTRIM (isnull( 
      CASE   
		WHEN TipIde = 1 THEN 'DNI'  
		WHEN TipIde = 2 THEN 'CE'
	END, ''))) +'",
   "numDoc" : "' +RTRIM( LTRIM( replace (isnull( NumIde,''), char(9),''))) +'",
    "disRes" : "' +RTRIM( LTRIM( replace (isnull( UbiGeoPer,''), char(9),''))) +'",
    "apePat" : "' +RTRIM( LTRIM( replace (isnull( ApePat,''), char(9),''))) +'",
    "apeMat" : "' +RTRIM( LTRIM( replace (isnull( ApeMat,''), char(9),''))) +'",
	"sexo" : "' +RTRIM( LTRIM( replace (isnull( Sexo,''), char(9),''))) +'",
    "nombres" : "' +RTRIM( LTRIM( replace (isnull( Nombres,''), char(9),''))) +'",
	"fecNac" : "' + 'ISODate('+ (RTRIM( LTRIM (isnull( CONVERT(varchar, FecNac, 127),'')))) + ')' +'",
	"fecReg" : "' + 'ISODate('+ (RTRIM( LTRIM (isnull( CONVERT(varchar, FecReg, 127),'')))) + ')' +'",
    "event" : "REGISTROFIP2",
    "email" : "' +RTRIM( LTRIM( replace (isnull( EmailPer,''), char(9),''))) +'",
    "phone" : "' +RTRIM( LTRIM( replace (isnull( CelPer,''), char(9),''))) +'",
    "terminos" : true
}' FROM Registro inner join (
   (select max(FecReg) as Fec,max(id) as Id
    from Registro where NumIde is not null group by numIde)
   ) as filtrado on filtrado.Id = Registro.Id

--9.Query de la bd REGISTROFMV
USE REGISTROFMV
SELECT DISTINCT '{
     "tipDoc" : "' +RTRIM( LTRIM (isnull( 
      CASE   
		WHEN TipIde = 1 THEN 'DNI'  
		WHEN TipIde = 2 THEN 'CE'
	END, ''))) +'",
    "numDoc" : "' +RTRIM( LTRIM( replace (isnull( NumIde,''), char(9),''))) +'",
    "disRes" : "' +RTRIM( LTRIM( replace (isnull( UbiGeoPer,''), char(9),''))) +'",
    "apePat" : "' +RTRIM( LTRIM( replace (isnull( ApePat,''), char(9),''))) +'",
    "apeMat" : "' +RTRIM( LTRIM( replace (isnull( ApeMat,''), char(9),''))) +'",
	"sexo" : "' +RTRIM( LTRIM( replace (isnull( Sexo,''), char(9),''))) +'",
    "nombres" : "' +RTRIM( LTRIM( replace (isnull( Nombres,''), char(9),''))) +'",
	"fecNac" : "' + 'ISODate('+ (RTRIM( LTRIM (isnull( CONVERT(varchar, FecNac, 127),'')))) + ')' +'",
	"fecReg" : "' + 'ISODate('+ (RTRIM( LTRIM (isnull( CONVERT(varchar, FecReg, 127),'')))) + ')' +'",
    "event" : "REGISTROFMV",
    "email" : "' +RTRIM( LTRIM( replace (isnull( EmailPer,''), char(9),''))) +'",
    "phone" : "' +RTRIM( LTRIM( replace (isnull( CelPer,''), char(9),''))) +'",
    "terminos" : true
}' FROM Registro inner join (
   (select max(FecReg) as Fec,max(id) as Id
    from Registro where NumIde is not null group by numIde)
   ) as filtrado on filtrado.Id = Registro.Id

--10.Query de la bd REGISTROFMV2015V2
USE REGISTROFMV2015V2
SELECT DISTINCT '{
     "tipDoc" : "' +RTRIM( LTRIM (isnull( 
      CASE   
		WHEN TipIde = 1 THEN 'DNI'  
		WHEN TipIde = 2 THEN 'CE'
	END, ''))) +'",
     "numDoc" : "' +RTRIM( LTRIM( replace (isnull( NumIde,''), char(9),''))) +'",
    "disRes" : "' +RTRIM( LTRIM( replace (isnull( UbiGeoPer,''), char(9),''))) +'",
    "apePat" : "' +RTRIM( LTRIM( replace (isnull( ApePat,''), char(9),''))) +'",
    "apeMat" : "' +RTRIM( LTRIM( replace (isnull( ApeMat,''), char(9),''))) +'",
	"sexo" : "' +RTRIM( LTRIM( replace (isnull( Sexo,''), char(9),''))) +'",
    "nombres" : "' +RTRIM( LTRIM( replace (isnull( Nombres,''), char(9),''))) +'",
	"fecNac" : "' + 'ISODate('+ (RTRIM( LTRIM (isnull( CONVERT(varchar, FecNac, 127),'')))) + ')' +'",
	"fecReg" : "' + 'ISODate('+ (RTRIM( LTRIM (isnull( CONVERT(varchar, FecReg, 127),'')))) + ')' +'",
    "event" : "REGISTROFMV2015V2",
    "email" : "' +RTRIM( LTRIM( replace (isnull( EmailPer,''), char(9),''))) +'",
    "phone" : "' +RTRIM( LTRIM( replace (isnull( CelPer,''), char(9),''))) +'",
    "terminos" : true
}' FROM Registro inner join (
   (select max(FecReg) as Fec,max(id) as Id
    from Registro where NumIde is not null group by numIde)
   ) as filtrado on filtrado.Id = Registro.Id

--11.Query de la bd REGISTROFMV2015V3 error en el correo
USE REGISTROFMV2015V3
SELECT DISTINCT '{
     "tipDoc" : "' +RTRIM( LTRIM (isnull( 
      CASE   
		WHEN TipIde = 1 THEN 'DNI'  
		WHEN TipIde = 2 THEN 'CE'
	END, ''))) +'",
     "numDoc" : "' +RTRIM( LTRIM( replace (isnull( NumIde,''), char(9),''))) +'",
    "disRes" : "' +RTRIM( LTRIM( replace (isnull( UbiGeoPer,''), char(9),''))) +'",
    "apePat" : "' +RTRIM( LTRIM( replace (isnull( ApePat,''), char(9),''))) +'",
    "apeMat" : "' +RTRIM( LTRIM( replace (isnull( ApeMat,''), char(9),''))) +'",
	"sexo" : "' +RTRIM( LTRIM( replace (isnull( Sexo,''), char(9),''))) +'",
    "nombres" : "' +RTRIM( LTRIM( replace (isnull( Nombres,''), char(9),''))) +'",
	"fecNac" : "' + 'ISODate('+ (RTRIM( LTRIM( replace (isnull( CONVERT(varchar, FecNac, 127),''), char(9),'')))) + ')' +'",
	"fecReg" : "' + 'ISODate('+ (RTRIM( LTRIM( replace (isnull( CONVERT(varchar, filtrado.Fec, 127),''), char(9),'')))) + ')' +'",
    "event" : "REGISTROFMV2015V3",
    "email" : "' +RTRIM( LTRIM( replace (isnull( EmailPer,''), char(9),''))) +'",
    "phone" : "' +RTRIM( LTRIM( replace (isnull( CelPer,''), char(9),''))) +'",
    "terminos" : true
}' FROM Registro inner join (
   (select max(FecReg) as Fec,max(id) as Id
    from Registro where NumIde is not null group by numIde)
   ) as filtrado on filtrado.Id = Registro.Id

--12.Query de la bd REGISTROFMV2016OCT
USE REGISTROFMV2016OCT
SELECT DISTINCT  '{
	"tipDoc" : "' +RTRIM( LTRIM( replace (isnull( CodIde,''), char(9),''))) +'",
	"numDoc" : "' +RTRIM( LTRIM( replace (isnull( NumIde,''), char(9),''))) +'",
    "disRes" : "' +RTRIM( LTRIM( replace (isnull( UbiGeoPer,''), char(9),''))) +'",
    "apePat" : "' +RTRIM( LTRIM( replace (isnull( ApePat,''), char(9),''))) +'",
    "apeMat" : "' +RTRIM( LTRIM( replace (isnull( ApeMat,''), char(9),''))) +'",
	"sexo" : "' +RTRIM( LTRIM( replace (isnull( Sexo,''), char(9),''))) +'",
    "nombres" : "' +RTRIM( LTRIM( replace (isnull( Nombres,''), char(9),''))) +'",
	"fecNac" : "' + 'ISODate('+ (RTRIM( LTRIM( replace (isnull( CONVERT(varchar, FecNac, 127),''), char(9),'')))) + ')' +'",
	"fecReg" : "' + 'ISODate('+ (RTRIM( LTRIM( replace (isnull( CONVERT(varchar, filtrado.Fec, 127),''), char(9),'')))) + ')' +'",
    "event" : "REGISTROFMV2016OCT",
    "email" : "' +RTRIM( LTRIM( replace (isnull( EmailPer,''), char(9),''))) +'",
    "phone" : "' +RTRIM( LTRIM( replace (isnull( CelPer,''), char(9),''))) +'",
    "terminos" : true
}' FROM Registro inner join (
   (select max(FecReg) as Fec,max(r.id) as Id
    from Registro r left JOIN  DETREGISTRO d on r.Id = d.Id where r.NumIde is not null group by numIde)
   ) as filtrado on filtrado.Id = Registro.Id

--13.Query de la bd REGISTROFMV2016SETIEMBRE
USE REGISTROFMV2016SETIEMBRE
SELECT DISTINCT  '{
    "tipDoc" : "' +RTRIM( LTRIM( replace (isnull( CodIde,''), char(9),''))) +'",
	 "numDoc" : "' +RTRIM( LTRIM( replace (isnull( NumIde,''), char(9),''))) +'",
    "disRes" : "' +RTRIM( LTRIM( replace (isnull( UbiGeoPer,''), char(9),''))) +'",
    "apePat" : "' +RTRIM( LTRIM( replace (isnull( ApePat,''), char(9),''))) +'",
    "apeMat" : "' +RTRIM( LTRIM( replace (isnull( ApeMat,''), char(9),''))) +'",
	"sexo" : "' +RTRIM( LTRIM( replace (isnull( Sexo,''), char(9),''))) +'",
    "nombres" : "' +RTRIM( LTRIM( replace (isnull( Nombres,''), char(9),''))) +'",
	"fecNac" : "' + 'ISODate('+ (RTRIM( LTRIM (isnull( CONVERT(varchar, FecNac, 127),'')))) + ')' +'",
	"fecReg" : "' + 'ISODate('+ (RTRIM( LTRIM (isnull( CONVERT(varchar, filtrado.Fec, 127),'')))) + ')' +'",
    "event" : "REGISTROFMV2016SETIEMBRE",
    "email" : "' +RTRIM( LTRIM( replace (isnull( EmailPer,''), char(9),''))) +'",
    "phone" : "' +RTRIM( LTRIM( replace (isnull( CelPer,''), char(9),''))) +'",
    "terminos" : true
}' FROM Registro inner join (
   (select max(FecReg) as Fec,max(r.id) as Id
    from Registro r left JOIN  DETREGISTRO d on r.Id = d.Id where r.NumIde is not null group by numIde)
   ) as filtrado on filtrado.Id = Registro.Id

--14.Query de la bd REGISTROFMV20161
USE REGISTROFMV20161
SELECT DISTINCT  '{
   "tipDoc" : "' +RTRIM( LTRIM( replace (isnull( CodIde,''), char(9),''))) +'",
	 "numDoc" : "' +RTRIM( LTRIM( replace (isnull( NumIde,''), char(9),''))) +'",
    "disRes" : "' +RTRIM( LTRIM( replace (isnull( UbiGeoPer,''), char(9),''))) +'",
    "apePat" : "' +RTRIM( LTRIM( replace (isnull( ApePat,''), char(9),''))) +'",
    "apeMat" : "' +RTRIM( LTRIM( replace (isnull( ApeMat,''), char(9),''))) +'",
	"sexo" : "' +RTRIM( LTRIM( replace (isnull( Sexo,''), char(9),''))) +'",
    "nombres" : "' +RTRIM( LTRIM( replace (isnull( Nombres,''), char(9),''))) +'",
	"fecNac" : "' + 'ISODate('+ (RTRIM( LTRIM (isnull( CONVERT(varchar, FecNac, 127),'')))) + ')' +'",
	"fecReg" : "' + 'ISODate('+ (RTRIM( LTRIM (isnull( CONVERT(varchar, filtrado.Fec, 127),'')))) + ')' +'",
    "event" : "REGISTROFMV20161",
    "email" : "' +RTRIM( LTRIM( replace (isnull( EmailPer,''), char(9),''))) +'",
    "phone" : "' +RTRIM( LTRIM( replace (isnull( CelPer,''), char(9),''))) +'",
    "terminos" : true
}' FROM Registro inner join (
   (select max(FecReg) as Fec,max(r.id) as Id
    from Registro r left JOIN  DETREGISTRO d on r.Id = d.Id where r.NumIde is not null group by numIde)
   ) as filtrado on filtrado.Id = Registro.Id

--15.Query de la bd REGISTROV3
USE REGISTROV3
SELECT DISTINCT  '{
    "tipDoc" : "' +RTRIM( LTRIM( replace (isnull( CodIde,''), char(9),''))) +'",
	 "numDoc" : "' +RTRIM( LTRIM( replace (isnull( NumIde,''), char(9),''))) +'",
    "disRes" : "' +RTRIM( LTRIM( replace (isnull( UbiGeoPer,''), char(9),''))) +'",
    "apePat" : "' +RTRIM( LTRIM( replace (isnull( ApePat,''), char(9),''))) +'",
    "apeMat" : "' +RTRIM( LTRIM( replace (isnull( ApeMat,''), char(9),''))) +'",
	"sexo" : "' +RTRIM( LTRIM( replace (isnull( Sexo,''), char(9),''))) +'",
    "nombres" : "' +RTRIM( LTRIM( replace (isnull( Nombres,''), char(9),''))) +'",
	"fecNac" : "' + 'ISODate('+ (RTRIM( LTRIM (isnull( CONVERT(varchar, FecNac, 127),'')))) + ')' +'",
	"fecReg" : "' + 'ISODate('+ (RTRIM( LTRIM (isnull( CONVERT(varchar, filtrado.Fec, 127),'')))) + ')' +'",
    "event" : "REGISTROV3",
   "email" : "' +RTRIM( LTRIM( replace (isnull( EmailPer,''), char(9),''))) +'",
    "phone" : "' +RTRIM( LTRIM( replace (isnull( CelPer,''), char(9),''))) +'",
    "terminos" : true
}' FROM Registro inner join (
   (select max(FecReg) as Fec,max(r.id) as Id
    from Registro r left JOIN  DETREGISTRO d on r.Id = d.Id where r.NumIde is not null group by numIde)
   ) as filtrado on filtrado.Id = Registro.Id 

--16.Query de la bd SENCICO
USE SENCICO
SELECT DISTINCT  '{
    "tipDoc" : "' +RTRIM( LTRIM( replace (isnull( CodIde,''), char(9),''))) +'",
	 "numDoc" : "' +RTRIM( LTRIM( replace (isnull( NumIde,''), char(9),''))) +'",
    "disRes" : "' +RTRIM( LTRIM( replace (isnull( UbiGeoPer,''), char(9),''))) +'",
    "apePat" : "' +RTRIM( LTRIM( replace (isnull( ApePat,''), char(9),''))) +'",
    "apeMat" : "' +RTRIM( LTRIM( replace (isnull( ApeMat,''), char(9),''))) +'",
	"sexo" : "' +RTRIM( LTRIM( replace (isnull( Sexo,''), char(9),''))) +'",
    "nombres" : "' +RTRIM( LTRIM( replace (isnull( Nombres,''), char(9),''))) +'",
	"fecNac" : "' + 'ISODate('+ (RTRIM( LTRIM (isnull( CONVERT(varchar, FecNac, 127),'')))) + ')' +'",
	"fecReg" : "' + 'ISODate('+ (RTRIM( LTRIM (isnull( CONVERT(varchar, filtrado.Fec, 127),'')))) + ')' +'",
    "event" : "SENCICO",
   "email" : "' +RTRIM( LTRIM( replace (isnull( EmailPer,''), char(9),''))) +'",
    "phone" : "' +RTRIM( LTRIM( replace (isnull( CelPer,''), char(9),''))) +'",
    "terminos" : true
}' FROM Registro inner join (
   (select max(FecReg) as Fec,max(r.id) as Id
    from Registro r left JOIN  DETREGISTRO d on r.Id = d.Id where r.NumIde is not null group by numIde)
   ) as filtrado on filtrado.Id = Registro.Id
