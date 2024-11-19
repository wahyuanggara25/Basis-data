CREATE DATABASE keluarga

USE keluarga

CREATE VIEW data_keluarga AS SELECT nama_keluarga, hubungan, 
ROUND(DATEDIFF(NOW(),tgl_lahir)/365,0) AS umur FROM keluarga ORDER BY umur 
DESC

SELECT*FROM data_keluarga