# Objetivo
El objetivo de esta prueba técnica es evaluar tus habilidades en Dart, incluida la lectura de
una API externa, la creación de modelos de datos y la manipulación de estos datos para
imprimirlos en la consola.

# Requerimientos
1. Consumo de la API Fake Store:
* Utiliza Dart para realizar solicitudes a al menos tres endpoints diferentes de la
API Fake Store para obtener datos ficticios de una tienda en línea.
2. Creación de Modelos de Datos:
* Crea modelos de datos en Dart para representar la información obtenida de la
API.
* Debes incluir al menos un modelo para representar los datos principales
obtenidos de cada endpoint, manejar inmutabilidad en los modelos.
3. Control de Errores con Either:
* Implementa un control de errores utilizando el tipo Either de la biblioteca
dartz.
* Maneja los posibles errores que puedan ocurrir al realizar las solicitudes a la
API.
4. Impresión en Consola:
* Utiliza Dart para procesar los datos obtenidos de la API y mostrarlos de manera
legible en la consola.
* Asegúrate de incluir información relevante de los modelos de datos, como el
título, descripción, precio, etc


# Arquitectura del Proyecto

Este proyecto está diseñado siguiendo los principios de Clean Architecture y buenas prácticas de desarrollo en Flutter.
El objetivo principal es garantizar un código escalable, mantenible y de alta calidad, que permita evolucionar fácilmente con nuevas funcionalidades y modelos de negocio.


## Objetivos tecnicos del Proyecto
* Implementar una arquitectura clara que separe responsabilidades por capas (core, data, domain, presentation).
* Garantizar un manejo consistente de errores y logs en toda la aplicación.
* Facilitar la extensión y mantenimiento mediante uso de barrel files y convenciones estandarizadas.
* Soportar variaciones en los modelos que provienen de diferentes endpoints, asegurando la correcta transformación con mappers.
* Cumplir con un desarrollo ordenado, profesional y adaptable para un crecimiento futuro del producto.

## Estructura del Proyecto

La organización del código está dividida en cuatro capas principales:

```
lib/
├── core/          → Configuración central, constantes, logger, red, manejo de errores.
├── data/          → Modelos, mappers, datasources y repositorios concretos.
├── domain/        → Entidades, repositorios abstractos y casos de uso.
├── presentation/  → Páginas, widgets y gestión de estado.

```

### Core

Contiene la infraestructura básica y transversal de la aplicación:
* config/ → Archivos de configuración y variables de entorno.
* constants/ → Definición de constantes globales y errores por defecto.
* error/ → Manejo centralizado de excepciones y fallos.
* logger/ → Sistema de logging personalizado con soporte a distintos niveles (info, warning, error, success, debug).
* network/ → Cliente HTTP, configuración de Dio, manejo de cabeceras y requests.


### Data

Responsable de obtener datos desde fuentes externas y transformarlos para el dominio:
* datasources/ → Implementaciones de acceso remoto (API REST, etc.).
* models/ → Representaciones de los datos en crudo tal como vienen de la fuente.
* mappers/ → Transformación de modelos (Model) a entidades (Entity) del dominio.
* repositories/ → Implementaciones concretas de los repositorios definidos en domain/.

Uso de barrel files (*.dart con el mismo nombre de la carpeta) para exportar agrupadamente.


### Domain

Define la lógica del negocio independiente de frameworks o detalles técnicos:
* entities/ → Modelos de negocio puros, sin dependencias de infraestructura.
* repositories/ → Contratos abstractos que deben implementar los repositorios concretos en data/.
* usecases/ → Casos de uso que representan acciones específicas del negocio (ej. GetCartsUsecase, CreateProductUsecase).


### Presentation

Capa de interfaz de usuario y gestión del estado:
* page/ → Páginas principales de la aplicación.
* widgets/ → Componentes visuales reutilizables (ej. LoaderScreen, SyncButton).
* state/ → Gestión del estado mediante notifiers y providers, organizados por dominio (cart, product, user).


### Vista global

```
.
├── core
│   ├── config
│   │   ├── app_config.dart
│   │   ├── config.dart
│   │   └── env_config.dart
│   ├── core.dart
│   ├── costants
│   │   ├── costants.dart
│   │   └── defautl_error.dart
│   ├── error
│   │   ├── error.dart
│   │   ├── exceptions.dart
│   │   └── failure.dart
│   ├── logger
│   │   ├── app_logger.dart
│   │   └── logger.dart
│   └── network
│       ├── dio_client.dart
│       ├── http_client.dart
│       ├── http_headers.dart
│       └── network.dart
├── data
│   ├── data.dart
│   ├── datasources
│   │   ├── cart_remote_datasource.dart
│   │   ├── datasources.dart
│   │   ├── products_remote_datasource.dart
│   │   └── user_remote_datasource.dart
│   ├── mappers
│   │   ├── cart
│   │   │   ├── cart.dart
│   │   │   ├── cart_mapper.dart
│   │   │   └── cart_product_mapper.dart
│   │   ├── mappers.dart
│   │   ├── product
│   │   │   ├── product.dart
│   │   │   ├── product_mapper.dart
│   │   │   └── rating_mapper.dart
│   │   └── user
│   │       ├── address_mapper.dart
│   │       ├── geolocation_mapper.dart
│   │       ├── name_mapper.dart
│   │       ├── user.dart
│   │       └── user_mapper.dart
│   ├── models
│   │   ├── cart
│   │   │   ├── cart.dart
│   │   │   ├── cart_model.dart
│   │   │   └── cart_product_model.dart
│   │   ├── models.dart
│   │   ├── product
│   │   │   ├── product.dart
│   │   │   ├── product_model.dart
│   │   │   └── rating_model.dart
│   │   └── user
│   │       ├── address_model.dart
│   │       ├── geolocation_model.dart
│   │       ├── name_model.dart
│   │       ├── user.dart
│   │       └── user_model.dart
│   └── repositories
│       ├── carts_repository_impl.dart
│       ├── products_repository_impl.dart
│       ├── repositories.dart
│       └── users_repository_impl.dart
├── domain
│   ├── domain.dart
│   ├── entities
│   │   ├── cart_entities
│   │   │   ├── cart.dart
│   │   │   ├── cart_entities.dart
│   │   │   └── cart_product.dart
│   │   ├── entities.dart
│   │   ├── product_entities
│   │   │   ├── product.dart
│   │   │   ├── product_entities.dart
│   │   │   └── rating.dart
│   │   └── user_entities
│   │       ├── address.dart
│   │       ├── geolocation.dart
│   │       ├── name.dart
│   │       ├── user.dart
│   │       └── user_entities.dart
│   ├── repositories
│   │   ├── cart_repository.dart
│   │   ├── products_repository.dart
│   │   ├── repositories.dart
│   │   └── user_repository.dart
│   └── usecases
│       ├── cart
│       │   ├── cart.dart
│       │   └── get_carts_usecase.dart
│       ├── product
│       │   ├── create_product_usecase.dart
│       │   ├── get_product_by_id_usecase.dart
│       │   ├── get_products_usecase.dart
│       │   └── product.dart
│       ├── usecases.dart
│       └── user
│           ├── get_users_usecase.dart
│           └── user.dart
├── lib.dart
├── main.dart
└── presentation
    ├── page
    │   ├── home_page.dart
    │   └── page.dart
    ├── presentation.dart
    ├── state
    │   ├── notifier
    │   │   ├── carts_notifier.dart
    │   │   ├── global_notifier.dart
    │   │   ├── notifier.dart
    │   │   ├── products_notifier.dart
    │   │   └── users_notifier.dart
    │   ├── provider
    │   │   ├── cart
    │   │   │   ├── cart.dart
    │   │   │   ├── cart_remote_data_source_provider.dart
    │   │   │   ├── cart_repository_provider.dart
    │   │   │   └── cart_usecase_provider.dart
    │   │   ├── product
    │   │   │   ├── product.dart
    │   │   │   ├── product_remote_data_source_provider.dart
    │   │   │   ├── product_repository_provider.dart
    │   │   │   └── products_usecase_provider.dart
    │   │   ├── provider.dart
    │   │   └── user
    │   │       ├── user.dart
    │   │       ├── user_remote_data_source_provider.dart
    │   │       ├── user_repository_provider.dart
    │   │       └── user_usecase_provider.dart
    │   └── state.dart
    └── widgets
        ├── content_screen.dart
        ├── loader_screen.dart
        ├── sync_button.dart
        └── widgets.dart
```

## Instalación y Ejecución

### 1. Clonar el repositorio

```
git clone https://github.com/RutaPragma/reading_api_data.git
cd reading_api_data
```
### 2. Instalar dependencias
```
dart pub get 
```

### 3. Configurar variables de entorno
  Crear el archivo `.env` en la raiz del proyecto, clonar el contenido del archivo `.env.template` en el archivo `.env`. 


### 4. Correr el proycto
```
flutter run
```

## Nota
Aunque el objetivo del proyecto es mostrar el consumo del api desde consola, se creo UI para ejecutar de manera controlada el consumo de los diferentes endpoints
