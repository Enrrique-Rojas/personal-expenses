# DECISIONS.md

## Justificación de tecnologías elegidas

### Flutter
Framework principal para desarrollo multiplataforma (Android, iOS, Web, Desktop). Permite una experiencia de usuario consistente, desarrollo ágil y escalable.

### Sqflite
Almacenamiento local basado en SQLite. Permite persistencia offline y sincronización posterior con servicios remotos.

### Firebase (Firestore y Auth)
Autenticación segura y base de datos en la nube. Escalable, fácil de integrar y permite sincronización de datos y usuarios.

### Dio
Cliente HTTP flexible para comunicación con APIs externas y servicios como Firebase. Permite manejo avanzado de errores e interceptores.

### Freezed
Generación de modelos y estados inmutables. Mejora la mantenibilidad y reduce errores en el manejo de datos.

### Riverpod/StateNotifier
Gestión de estado reactiva, escalable y fácil de testear. Permite desacoplar lógica y UI.

### Estructura Modular
División en capas (domain, infrastructure, presentation) siguiendo arquitectura limpia. Facilita mantenimiento y escalabilidad.

### Justificación General
Las tecnologías seleccionadas permiten un desarrollo rápido, seguro y escalable, con soporte multiplataforma, persistencia local y remota, y una arquitectura clara. Se priorizó facilidad de integración, comunidad activa y soporte a largo plazo.

Si se requiere ampliar la justificación o agregar nuevas decisiones, actualizar este archivo.
