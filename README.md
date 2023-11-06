# ProyectoETL

![Imagen](https://github.com/SaraPazo/ProjectETL/tree/main/Imagen/imagenpor.png)


### INDICE
1. Descripción
2. Contenido
3. Organización de los datos
4. Limpieza de datos
5. Creación de las bases de datos
6. BONUS QUERIES



### 1. DESCRIPCIÓN

En este proyecto no se nos muestran ni se nos proporcionan datos, lo que significa que tendremos que elaborar un proceso completo de ETL (Extract, Transform y Load).

Aunque no se nos proporcionan datos, si se nos dan una serie de normas o restricciones en cuanto a cómo llevar a cabo el proceso:
- Etapas del proceso de datos: adquisición, discusión, análisis y presentación de informes.
- Debemos extraer datos de 3 fuentes diferentes.
- Debemos usar 2 herramientas diferentes (scraping, .csv, API,...).



### 2. CONTENIDO
- Imagen: carpeta con las imágenes utilizadas en el archivo Léame.
- Data: 
    - CollectedOnline: los .csv que hemos encontrado, previo a su limpieza.
    - Datos_Clean: Mis archivos .csv limpios. 

- src: 
    - **Entradas_main.ipynb**: jupyter notebook con la limpieza de datos del scrapeo de la página entradas.com y preparación de la data para el posterior análisis.
    -  **asist_concert.ipynb**:jupyter notebook con la limpieza de datos de la asistencia a conciertos, en la Comunidad de Madrid, y preparación de la data para el posterior análisis.
    -  **Viajeros.ipynb**:jupyter notebook con la limpieza de datos de la afluencia de personas, viajeros, en la Comunidad de Madrid, y preparación de la data para el posterior análisis.
    - **SQLsend.ipynb**: jupyter notebook con todas las tablas limpias y en las que he añadido los 'id' de cada una de las tablas, en preparación para el análisis posterior.


    - **SQL.ipynb**: ---->> pendiente de eliminar.










### 6. BONUS QUERIES

-- Query 1: ¿Cuáles son los 5 meses en los que es más posible que residentes en España acudan a eventos? 

SELECT residentes.mes, COUNT(*) AS cantidad
FROM residentes
LEFT JOIN eventos ON residentes.eventos_id = eventos.eventos_id
GROUP BY residentes.mes
ORDER BY cantidad DESC
LIMIT 5;

![Query1]()


-- Query 2: ¿En qué mes del año hay más cantidad de eventos disponibles?

SELECT eventos.mes, COUNT(*) AS cantidad
FROM eventos
GROUP BY eventos.mes
ORDER BY cantidad DESC
LIMIT 1;



-- Query 3: ¿Qué meses del año hay más cantidad de eventos disponibles? Dámelos por orden descendente.
SELECT eventos.mes, COUNT(*) AS `cantidad`
FROM eventos
GROUP BY eventos.mes
ORDER BY `cantidad` DESC;
