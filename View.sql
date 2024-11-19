USE akademik;

CREATE VIEW usia AS 
SELECT nama,tgl_lahir, ROUND(DATEDIFF(NOW(), tgl_lahir)/365,0)
  AS  umur FROM mhs
  
  SELECT* FROM usia
  
