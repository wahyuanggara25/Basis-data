USE akademik;\

SELECT nama,alamat FROM dosen 
UNION
SELECT nama, alamat FROM mhs;

SELECT nama FROM mhs WHERE alamat = "jl.nenas" 
IN (SELECT nama FROM dosen )

SELECT alamat FROM dosen
WHERE alamat
NOT IN (SELECT alamat FROM mhs )

SELECT alamat FROM mhs
WHERE alamat
NOT IN (SELECT alamat FROM dosen)

SELECT nama_mk FROM kuliah_s1 
WHERE nama_mk 
NOT IN (SELECT nama_mk FROM kuliah_d3)

SELECT nama_mk FROM kuliah_s1 
UNION ALL
SELECT nama_mk FROM kuliah_d3

SELECT nama_mk FROM kuliah_s1 
UNION 
SELECT nama_mk FROM kuliah_d3

SELECT nama_mk FROM kuliah_s1 
UNION 
SELECT nama_mk FROM kuliah_d3
ORDER BY nama_mk;


