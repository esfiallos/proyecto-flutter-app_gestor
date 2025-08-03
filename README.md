# Miki App — Gestor de Negocio

**Miki App** es una aplicación móvil desarrollada en Flutter pensada para pequeños negocios que necesitan gestionar de forma sencilla y eficiente sus **entradas y salidas de productos, dinero o servicios**. Diseñada para llevar un control práctico desde el teléfono, esta app busca optimizar los flujos diarios de cualquier emprendimiento.

---

## Características principales

- 📥 Registro de entradas (productos, ingresos, etc.)
- 📤 Registro de salidas (ventas, egresos, etc.)
- 📊 Visualización de historial de movimientos
- 🔎 Búsqueda rápida de registros
- 💾 Almacenamiento local (sin conexión a internet)
- 🧱 Estructura modular y mantenible en Flutter

---

## Tecnologías utilizadas

- **Flutter** (SDK de desarrollo multiplataforma)
- **Dart** (Lenguaje de programación)
- **GetX** (para manejo de estado y navegación)
- **Sqflite** (base de datos local en SQLite)
- **Path Provider** (para rutas del sistema)

---

## Estructura del proyecto

/lib
│
# Lógica y manejo de 
controllers/ # Para consultas en base de datos
models/ # Modelos de datos: Entrada, Salida, etc.
screens/ # Interfaces principales de la app
db/ # Configuración y acceso a SQLite
main.dart # Punto de entrada de la aplicación


## Cómo ejecutar el proyecto

1. Clona el repositorio:
2. Entra al directorio del proyecto:
     cd proyecto-flutter-app_gestor
3. Instala las dependencias:
   flutter pub get
4. Ejecuta el proyecto
   flutter run


## Contribuciones
Si quieres colaborar, mejorar la app o sugerir algo:

1. Haz un fork del proyecto
2. Crea una nueva rama (git checkout -b feature-nueva)
3. Haz tus cambios
4. Crea un pull request




For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
