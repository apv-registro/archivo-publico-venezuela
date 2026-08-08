# SOP-01: documentación de eventos, actos y responsabilidad

Versión 2.0 — obligatoria para todo expediente nuevo o revisado.

## 1. Finalidad

El archivo preserva actos de órganos públicos venezolanos, permite reconstruir episodios complejos y vincula instituciones y personas únicamente con actuaciones demostrables. La unidad probatoria es el acto; el evento es la relación razonada entre varios actos.

## 2. Unidades

### Evento

Episodio delimitado por objeto y periodo. Contiene una descripción, una conclusión apoyada exclusivamente en actos publicados, una lista abierta de actos y los vacíos que impiden cerrar el expediente.

### Acto

Decisión, acción, omisión o comunicación atribuible a un órgano y delimitable por fecha, objeto y efecto. Conductas distintas conservan expedientes distintos, aunque compartan autores o contexto.

### Institución

Órgano con competencia sobre el acto. Su ficha registra la base de competencia, estructura funcional, titulares durante el periodo y actos asociados. La competencia institucional no demuestra por sí sola la intervención individual.

### Persona

Solo se incorpora al índice de responsables cuando una fuente la conecta con una acción concreta. La persona afectada puede mencionarse para explicar el efecto del acto, pero no se incluye en la sección de responsables ni se indexa como tal.

## 3. Clases de evidencia publicable

| Clase | Descripción | Uso |
|---|---|---|
| A | Registro emitido por el órgano autor: sentencia, resolución, acta, gaceta, oficio, comunicado, base o audiovisual oficial | Prueba principal del acto |
| B | Registro directo de una parte o participante: solicitud, denuncia contemporánea, constancia o comunicación propia | Prueba de lo que esa parte hizo, recibió o declaró |
| C | Copia contemporánea íntegra de un acto público cuyo original no está disponible | Prueba del contenido visible, con procedencia y limitación expresas |
| D | Norma o registro oficial de competencia, nombramiento y estructura | Contraste normativo e identificación institucional |
| E | Decisión oficial de otro Estado u organismo que atribuye nominalmente una conducta | Corroboración atribuida; no sustituye el registro venezolano del acto |

Prensa, informes de observación, análisis académicos y comentarios sirven para descubrir o contrastar fuentes durante la investigación. No aparecen como documentos preservados de un acto ni sustituyen una fuente de clases A-E.

## 4. Puerta de preservación

Un documento solo aparece bajo **Evidencia preservada** cuando el repositorio contiene:

1. copia local inmutable;
2. nombre e identificador estables;
3. URL o procedencia de adquisición;
4. fecha y hora de captura en UTC;
5. formato y tamaño;
6. SHA-256 calculado sobre el archivo servido; y
7. clase de evidencia y relación exacta con el acto.

La URL original acompaña la procedencia, pero nunca es el único acceso. Una captura nueva no reemplaza la anterior: recibe una entrada nueva en el manifiesto.

## 5. Flujo obligatorio

1. **Delimitar el evento.** Definir objeto, periodo, instituciones y conclusión a examinar.
2. **Inventariar actos.** Separar cada decisión, acción, omisión o comunicación.
3. **Definir el registro esperado.** Antes de buscar, nombrar qué resolución, sentencia, acta, registro técnico o publicación debería existir.
4. **Buscar por capas.** Órgano autor, gacetas y repositorios estatales; copias contemporáneas; archivos web; registros directos de participantes.
5. **Preservar.** Aplicar la puerta de preservación y añadir el archivo al manifiesto.
6. **Extraer afirmaciones atómicas.** Cada proposición lleva documento y localizador: página, artículo, párrafo, minuto o campo.
7. **Contrastar con la norma.** Tabla obligatoria: requisito, fuente, conducta observada y discrepancia.
8. **Reconstruir competencia.** Identificar órgano, unidad funcional y titulares del periodo mediante documentos de clase D.
9. **Atribuir responsabilidad.** Aplicar los niveles del apartado 6.
10. **Redactar el acto.** Exponer conducta, evidencia, efecto, discrepancia, responsables y vacíos.
11. **Actualizar el evento.** La conclusión se deriva solo de los actos publicados.
12. **Validar.** Hashes, enlaces locales, metadatos, citas, JSON, lenguaje público y coherencia entre índice, evento y actos.

## 6. Niveles de responsabilidad

| Nivel | Requisito | Formulación permitida |
|---|---|---|
| Acción directa | Firma, voz, voto nominal, orden, presentación o ejecución visible | “firmó”, “anunció”, “presentó”, “ordenó” |
| Autoría colegiada | Documento del órgano colegiado más firma, voto o identificación de integrantes decisores | “participó en la decisión colegiada” |
| Autoridad y supervisión | Cargo y competencia funcional acreditados durante el periodo, sin prueba del acto individual | “era autoridad responsable del área”; no “decidió” |
| Responsabilidad institucional | El acto u omisión corresponde al órgano, pero el ejecutor individual no está identificado | Se atribuye al órgano y se declara la autoría individual no determinada |

No basta la presencia en una lista de cargos. No se convierten afectados, víctimas, candidatos o solicitantes en responsables.

## 7. Protocolo para documentos ausentes

Una ausencia se publica únicamente con cuatro datos:

- documento esperado;
- órgano que debía producirlo o custodiarlo;
- evidencia de su existencia o del deber de producirlo; y
- repositorios consultados y fecha de la última comprobación.

La página del acto describe el vacío y su consecuencia probatoria. Las instrucciones editoriales, el historial de decisiones y las fuentes secundarias de búsqueda permanecen fuera de la página pública del expediente.

## 8. Redacción pública

Cada frase de una página de evento o acto debe referirse al evento, al acto, a una fuente, a una norma, a una atribución o a un vacío probatorio. Se excluyen:

- respuestas al feedback editorial;
- explicaciones sobre fuentes descartadas;
- advertencias genéricas o fórmulas defensivas;
- instrucciones internas de investigación; y
- nombres de afectados bajo encabezados de responsabilidad.

Las calificaciones como fraude, ilegitimidad o inconstitucionalidad deben definir el criterio aplicado y exponer las premisas documentales. Cuando la intención no esté demostrada, se describe la conducta verificable y se limita la conclusión al defecto probado.

## 9. Control de calidad

Antes de publicar se comprueba que:

- cada archivo público está en el manifiesto y su hash coincide;
- ninguna evidencia depende de un enlace externo;
- cada cifra agregada puede recalcularse o se identifica como afirmación de su emisor;
- las reproducciones no oficiales están rotuladas como tales;
- las autoridades de una institución tienen fuente y periodo;
- cada persona indexada tiene acción, nivel de atribución y evidencia;
- los vacíos no se presentan como hechos demostrados;
- no hay prensa ni observadores en “Evidencia preservada”; y
- el expediente puede leerse sin conocer el proceso editorial.

## 10. Correcciones

Las correcciones conservan el historial de Git. El cambio identifica fecha, registro afectado, evidencia nueva y motivo. Un archivo preservado nunca se modifica bajo el mismo identificador.
