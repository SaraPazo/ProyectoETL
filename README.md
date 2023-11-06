# ProyectoETL

![Imagen](https://github.com/SaraPazo/ProyectoETL/blob/main/Imagen/imagenpor.png)


### INDICE
1. Descripción
2. Fuentes de extracción
3. Objetivo
4. Contenido
5. Limpieza de datos
5. Creación de la base de datos

    a. En SQL

    b. En Mongo

6. BONUS QUERIES



### 1. DESCRIPCIÓN

En este proyecto no se nos muestran ni se nos proporcionan datos, lo que significa que tendremos que elaborar un proceso completo de ETL (Extract, Transform y Load).

Aunque no se nos proporcionan datos, si se nos dan una serie de normas o **restricciones** en cuanto a cómo llevar a cabo el proceso:
- Etapas del proceso de datos: adquisición, discusión, análisis y presentación de informes.
- Debemos extraer datos de 3 fuentes diferentes.
- Debemos usar 2 herramientas diferentes (scraping, .csv, API,...).


### 2. FUENTES DE EXTRACCIÓN

Como era mandato del ejercicio, realizamos una búsqueda de las 3 páginas web que necesitábamos.


1. En base al objetivo de estudio, inicio la búsqueda de datos en la URL de la página web de entradas.com, web de venta de entradas a eventos, conciertos, musicales, exposiciones, y otros. 

    Esta primera extracción la llevo a cabo a través de scraping utilizando el método de *selenium*. 

    URL: https://www.entradas.com/city/madrid-370/conciertos-y-festivales-85/

2. Para ampliar la búsqueda, obtengo información sobre la ocupación turística en la Comunidad de Madrid, a través de la página del INE. Esta nos aportará información sobre los viajeros y pernoctantes, según fecha, y según sean residentes en España o residentes en el Extranjero. 

    Esta segunda extracción se realiza a través de la importación de un archivo .csv. 

    Este archivo no estaba ya hecho, sino que yo misma, a  través de la página, he seleccionado de una tabla los elementos necesarios. 

    URL: https://www.ine.es/jaxiT3/Datos.htm?t=2074

3. Por último, me baso en la asistencia a eventos en la Comunidad de Madrid, obteniendo los datos de la página web del 'Ministerio del Gobierno de España', concretamemte en el apartado de 'Cultura y deporte'. Esta me mostrará el la recurrencia a eventos de forma porcentual. 
    
    Esta tercera extracción se realiza a través de la importación de un archivo .csv.

    URL: https://estadisticas.mecd.gob.es/CulturaJaxiPx/Tabla.htm?path=/t9/p9/a1a2021-2022/c05//l0/&file=05081.px&type=pcaxis&L=0



### 3. OBJETIVO
Tomando ideas de tres fuentes de datos distintas. Estas tres fuentes se relacionan por ocurrir en la Comunidad de Madrid, de tal forma que con estas podríamos realizar un estudio eficiente, y sacar finalmente las conclusiones apropiadas. 

La idea es comenzar a establecer objetivos para mi proyecto final, como puede ser:
- Estudiar cómo depende y cómo afectan los eventos (en este caso conciertos y festivales) a la llegada de turistas (españoles o extranjeros), podría ser una idea. 

Sin embargo, antes de centrarme en las conclusiones y estudio definitivo, este proyecto se basa en tener una primera toma de contacto con las ETL (Extract, Transform y Load).



### 4. CONTENIDO
- Data: 
    - CollectedOnline: los .csv que hemos encontrado, previo a su limpieza.
    - Datos_Clean: Mis archivos .csv limpios. 

- Imagen: carpeta con las imágenes utilizadas en el archivo Léame.

- Notebooks (Jupyter y SQL): 
    - **Entradas_main.ipynb**: jupyter notebook con la limpieza de datos del scrapeo de la página entradas.com y preparación de la data para el posterior análisis.

    -  **asist_concert.ipynb**:jupyter notebook con la limpieza de datos de la asistencia a conciertos, en la Comunidad de Madrid, y preparación de la data para el posterior análisis.

    -  **Viajeros.ipynb**:jupyter notebook con la limpieza de datos de la afluencia de personas, viajeros, en la Comunidad de Madrid, y preparación de la data para el posterior análisis.

    - **Mongo.ipynb**: Jupyter notebook con la importación de los .csv a Mongo. Creación de la base de datos en Mongo.

    - **SQLsend.ipynb**: jupyter notebook con todas las tablas limpias y en las que he añadido los 'id' de cada una de las tablas, en preparación para el análisis posterior.

    - **SQLdone.sql**: Esquema creado en SQL sobre las tablas importadas desde pandas. 

    - **SQLquery.sql**: Como *BONUS QUERIES con SQL* he probado mi diagrama en SQL con unas queries que hacen relaciones muy sencillas. 



### 5. LIMPIEZA DE DATOS

- La tranformación y limpieza de datos se explica más detalladamente en cada uno de los Jupyter Notebooks.

**a. Scraping**

Primero se realiza la llamada/ transformación de cada uno de los elementos que serán necesarios para generar la tabla de esta primera URL.

A la vez que vamos haciendo el scraping, se realiza una limpieza lo más detallada posible para que  la creación posterior de la base de datos sea más útil.

Una vez tenemos nuestros datos, pasamos el DataFrame generado a .csv y tendremos nuestro *'eventos.csv'* limpio. 

**b. Archivos.csv**

Transformamos y limpiamos cada uno de los archivos importados .csv importados, que convertiremos a DataFrame. 

Una vez tenemos nuestros datos, pasamos el DataFrame generado a .csv y tendremos nuestros archivos ya limpios: *'asistencia.csv'* , *'residentes.csv'* y *'no_residentes.csv'*.



### 6. CREACION DE LA BASE DE DATOS

**a. En SQL:**

Posteriormente se crea la base de datos. 
En el archivo 'SQLdone.sql' se muestra cómo se han generado las conexiones y algunas de las columnas que faltaban en mis tablas. 

Mi base de datos final: 

![Imagen](https://github.com/SaraPazo/ProyectoETL/blob/main/Imagen/DiagramSQL.png)


**b. En Mongo:**

A pesar de haber creado la base de datos en SQL, las conexiones parecían no funcionar (pendiente de perfeccionar para el próximo proyecto). 

Por ello, he decidido exportar los .csv también a Mongo para saber que estará correcto.



### 7. BONUS QUERIES con SQL

- Algunas queries que si me funcionaron con SQL:

-- Query 1: ¿Cuáles son los 5 meses en los que es más posible que residentes en España acudan a eventos? 

```
SELECT residentes.mes, COUNT(*) AS cantidad
FROM residentes
LEFT JOIN eventos ON residentes.eventos_id = eventos.eventos_id
GROUP BY residentes.mes
ORDER BY cantidad DESC
LIMIT 5;
```

![Query1](https://github.com/SaraPazo/ProyectoETL/blob/main/Imagen/Query1.png)

-- Query 2: ¿En qué mes del año hay más cantidad de eventos disponibles?

```
SELECT eventos.mes, COUNT(*) AS cantidad
FROM eventos
GROUP BY eventos.mes
ORDER BY cantidad DESC
LIMIT 1;
```

![Query2](https://github.com/SaraPazo/ProyectoETL/blob/main/Imagen/Query2.png)


-- Query 3: ¿Qué meses del año hay más cantidad de eventos disponibles? Dámelos por orden descendente.

```
SELECT eventos.mes, COUNT(*) AS `cantidad`
FROM eventos
GROUP BY eventos.mes
ORDER BY `cantidad` DESC;
```

![Query3](https://github.com/SaraPazo/ProyectoETL/blob/main/Imagen/Query3.png)
