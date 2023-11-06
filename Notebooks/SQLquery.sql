
-- QUERIES EN SQL

-- Query 1: ¿En qué mes es más posible que residentes en España acudan a eventos? 

SELECT residentes.mes, COUNT(*) AS cantidad
FROM residentes
LEFT JOIN eventos ON residentes.eventos_id = eventos.eventos_id
GROUP BY residentes.mes
ORDER BY cantidad DESC
LIMIT 1;


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