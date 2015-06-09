# epers-optimizacion-performance
> Implementación del TP de performance en SQL. Estrategias de Persistencia - LDS - UNQ

## Optimizaciones llevadas a cabo

**Generales:** hice lazy a la mayoría de las colecciones, encargándome de en las queries fetchear las que sé que voy a necesitar.

**ListadoPagosPorDepto:** se estaban trayendo todos los salarios y títulos, cuando sólo se usaba el último de cada uno de ellos. Lo que hice fue limitar los salarios a aquellos donde `to = '9999-01-01'`, forma en que está modelada la idea de "el último".

**ListadoMaximosSalarios:** este listado tenía 2 problemas: resolvía el `LIMIT` y el `ORDER BY` en Java, trayendo todo desde SQL. Para lo primero simplemente agregué un `setMaxResults(11)` a la Query y para lo segundo, además de agregar la cláusula correspondiente, intenté crear un índice por el amount del salario.... pero desistí después de 20 minutos de correr el `CREATE INDEX`.
