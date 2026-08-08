# SOP-01: documentación de eventos, actos e intervención individual

Versión 1.0 - obligatorio para todo registro nuevo o revisado.

## 1. Objeto

Este procedimiento establece cómo identificar, investigar, preservar y publicar:

1. un **evento**, entendido como un episodio público delimitado que requiere una explicación conjunta;
2. los **actos** concretos que lo componen; y
3. las **personas e instituciones** cuya intervención en cada acto puede demostrarse.

El archivo documenta evidencia y relaciones verificables. No sustituye a un tribunal ni decide consecuencias jurídicas o financieras.

## 2. Unidad de trabajo

### Evento

Un evento agrupa actos relacionados por objeto y contexto. Su página debe contener:

- descripción neutral del episodio;
- alcance temporal y material;
- pregunta que resuelve el expediente;
- conclusión y grado de soporte;
- lista ilimitada de actos, sin categorías cronológicas obligatorias;
- explicación de cómo los actos sostienen la conclusión;
- fuentes normativas y referencias externas;
- vacíos pendientes.

### Acto

Un acto es una acción, decisión, omisión o comunicación atribuible a un órgano público y delimitable por fecha, objeto y efecto. Cada acto tiene expediente propio y ampliable. Dos conductas distintas no se fusionan solo porque participen las mismas personas.

### Persona

Una persona se vincula al acto, nunca al evento en abstracto. El registro debe precisar el verbo probado: firmó, votó, ordenó, leyó, decidió, ejecutó, certificó, publicó, omitió una obligación individualizada o aportó material.

## 3. Jerarquía de fuentes

1. **Registro oficial primario**: sentencia, resolución, acta, gaceta, comunicado, oficio, registro audiovisual oficial, base de datos o publicación del órgano autor.
2. **Copia contemporánea verificable**: reproducción íntegra realizada por otro archivo o medio cuando el original oficial desapareció. Debe conservarse la procedencia y explicarse por qué se considera fiel.
3. **Norma aplicable**: Constitución, ley, reglamento, resolución o manual vigente para la actuación.
4. **Corroboración independiente**: observadores, organismos internacionales, estudios académicos, prensa o análisis técnicos identificados.

Las fuentes de nivel 4 pueden apoyar una interpretación o acreditar que un documento fue visto, pero no sustituyen el registro oficial cuando se atribuye un acto a una persona concreta.

## 4. Flujo obligatorio

### Paso 1 - Delimitar el evento

Redactar en una frase qué ocurrió y qué cuestión documental se examina. Fijar fecha inicial, fecha final provisional, instituciones y exclusiones de alcance.

### Paso 2 - Inventariar actos candidatos

Crear una fila por cada decisión, acción, omisión o comunicación. No imponer un número mínimo ni máximo. Separar, por ejemplo, la emisión de un resultado, su proclamación, la falta de publicación y su posterior validación judicial.

### Paso 3 - Abrir un expediente por acto

Asignar identificador estable. Registrar:

- emisor y fecha;
- acción exacta;
- objeto y efecto;
- registro oficial esperado;
- registro localizado y estado: preservado, localizado, parcial o no localizado;
- normas aplicables;
- cronología;
- personas y función probada;
- contradicciones;
- referencias externas;
- preguntas abiertas.

### Paso 4 - Adquirir y preservar

Conservar el archivo original sin editar. Para páginas o publicaciones audiovisuales, registrar URL, fecha y hora UTC, plataforma, título, autor institucional, formato y, cuando sea viable, captura WARC o copia del archivo servido.

Calcular SHA-256 inmediatamente. Nunca reemplazar un archivo conservado bajo el mismo identificador. Una nueva descarga constituye otra captura.

El diseño sigue principios de integridad de NIST, procedencia de W3C PROV, empaquetado BagIt y conservación web WARC. El piloto usa archivos y manifiestos simples; BagIt/WARC se incorporarán cuando exista automatización estable.

### Paso 5 - Extraer afirmaciones atómicas

Cada afirmación debe expresar una sola proposición y citar ubicación exacta. Separar:

- contenido visible del documento;
- inferencia obtenida al combinar documentos;
- evaluación jurídica o técnica;
- afirmación de un tercero.

No escribir “fraudulento”, “ilegal”, “inconstitucional” o equivalente sin exponer las premisas documentales y la norma o método usados.

### Paso 6 - Comparar acto y norma

Construir una tabla de cuatro columnas: requisito, fuente normativa, conducta observada y discrepancia. Verificar vigencia, numeración y texto de cada artículo. Una cita incorrecta del propio órgano se registra literalmente y se contrasta con la norma.

### Paso 7 - Atribuir personas

Se requiere al menos una fuente que conecte persona y acción. Registrar por separado:

- **autoría directa**: firma, voto nominal, declaración o ejecución visible;
- **autoridad decisoria**: competencia individual y evidencia de que decidió;
- **participación colegiada**: integración del órgano más prueba de voto, firma o adhesión;
- **inferencia explícita**: combinación de dos o más documentos; debe etiquetarse como inferencia;
- **cargo solamente**: no basta para atribuir el acto.

Una lista de autoridades al pie de un comunicado permite afirmar que fueron identificadas por el documento, pero no presumir cómo votó cada una.

### Paso 8 - Formular la conclusión del acto

La conclusión debe responder: qué hizo el órgano, qué evidencia lo demuestra, qué requisito incumplió o qué contradicción presenta, qué personas están vinculadas y qué sigue sin conocerse.

### Paso 9 - Formular la conclusión del evento

La conclusión del evento debe poder reconstruirse exclusivamente desde los actos publicados. Las referencias externas se presentan después y no pueden ser la premisa oculta de la conclusión.

### Paso 10 - Revisión antes de publicar

Comprobar:

- que todos los enlaces internos funcionan;
- que cada archivo preservado coincide con su hash;
- que cada cita señala página, párrafo, artículo, minuto o registro;
- que no hay personas vinculadas solo por cargo;
- que hechos, inferencias y referencias externas están diferenciados;
- que los vacíos están declarados;
- que el evento puede entenderse sin consultar una fuente externa.

## 5. Estructura de conservación

```text
events/       expediente y lista de actos
acts/         un registro estructurado por acto
entities/     identidad estable y participaciones enlazadas
documents/    registros oficiales venezolanos preservados
references/   metadatos y enlaces de fuentes externas, sin mezclarlas con documentos oficiales
schemas/      reglas de validación
site/         versión pública
```

## 6. Correcciones y versiones

Las correcciones no borran el historial. El expediente debe indicar la fecha, el campo afectado, el motivo, la evidencia nueva y el cambio realizado. Si se cuestiona la identidad o integridad de un documento, el dato afectado se marca como disputado hasta resolverlo.

## 7. Regla de suficiencia

Un acto puede publicarse incompleto si el vacío es relevante y está identificado, pero no puede presentarse como concluido. Una persona no se publica como interviniente hasta superar el umbral de atribución del paso 7.
