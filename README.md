# Ejecucion de laboratorio de seguridad informatica con GitHub Codespaces

Esta guia explica como ejecutar las practicas del repositorio `learn-labs-tech/si-labs-practices` usando GitHub Codespaces. El entorno prepara una estacion Ubuntu para trabajo de consola y practicas controladas de seguridad informatica.

> Repositorio: <https://github.com/learn-labs-tech/si-labs-practices.git>

## 1. Objetivo del laboratorio

Al finalizar, el estudiante podra:

- Abrir un entorno de GitHub Codespaces.
- Crear un fork del repositorio en su propia cuenta de GitHub.
- Abrir un Codespace desde su fork.
- Construir y levantar los contenedores del laboratorio.
- Entrar a la estacion de trabajo `workstation` como usuario `analyst`.
- Ejecutar practicas de shell Linux, permisos de archivos y lectura de logs.
- Recolectar evidencias para entregar la practica.

## 2. Requisitos previos

Antes de iniciar, asegurese de tener:

- Una cuenta activa de GitHub.
- Acceso a GitHub Codespaces.
- Navegador web actualizado.
- Conocimientos basicos de terminal: copiar, pegar y ejecutar comandos.

No necesita instalar Docker, Linux ni Visual Studio Code en su computador. Codespaces ejecuta el entorno en la nube y ya incluye Docker y Git.

## 3. Crear un fork del repositorio

Cada estudiante debe trabajar desde una copia propia del repositorio. Para eso, primero debe crear un **fork** en su cuenta de GitHub.

1. Ingrese al repositorio original:

   <https://github.com/learn-labs-tech/si-labs-practices>

2. Inicie sesion en GitHub con su cuenta personal o institucional.

3. En la parte superior derecha, haga clic en **Fork**.

4. En la pantalla de creacion del fork:

   - En **Owner**, seleccione su usuario de GitHub.
   - En **Repository name**, deje el nombre `si-labs-practices`.
   - Puede dejar marcada la opcion **Copy the main branch only**.

5. Haga clic en **Create fork**.

6. Espere a que GitHub cree la copia.

Al finalizar, la direccion del repositorio debe tener su usuario de GitHub. Por ejemplo:

```text
https://github.com/USUARIO/si-labs-practices
```

Use siempre su fork para abrir Codespaces y realizar las practicas. No trabaje directamente sobre el repositorio original.

## 4. Abrir el fork en Codespaces

1. Ingrese a su fork:

   ```text
   https://github.com/USUARIO/si-labs-practices
   ```

   Reemplace `USUARIO` por su usuario de GitHub.

2. Haga clic en el boton **Code**.

3. Abra la pestana **Codespaces**.

4. Haga clic en **Create codespace on main**.

5. Espere a que se abra el entorno. La primera carga puede tardar algunos minutos.

Cuando Codespaces termine de cargar, vera una interfaz similar a Visual Studio Code en el navegador, con un explorador de archivos a la izquierda y una terminal en la parte inferior.

## 5. Verificar el repositorio del laboratorio

Verifique que el repositorio se clono correctamente:

```bash
pwd
ls
```

Debe ver archivos y carpetas como:

```text
docker-compose.yml
01-linux-shell/
02-linux-filesystem-permissions/
03-server-logs/
workstation/
nginx/
```

Si necesita confirmar la direccion remota del repositorio, ejecute:

```bash
git remote -v
```

La URL debe apuntar a su fork:

```text
https://github.com/USUARIO/si-labs-practices
```

## 6. Construir e iniciar el laboratorio

Ejecute:

```bash
docker compose up -d --build
```

Este comando construye la imagen de la estacion de trabajo y levanta los servicios definidos en `docker-compose.yml`.

Servicio principal:

| Servicio | Uso | Puerto |
| --- | --- | --- |
| `workstation` | Contenedor Ubuntu para comandos Linux, permisos y logs | `8081` |

Verifique que los contenedores esten activos:

```bash
docker compose ps
```

## 7. Entrar a la estacion de trabajo

Para ingresar al contenedor principal:

```bash
docker compose exec workstation bash
```

Luego cambie al usuario de laboratorio:

```bash
su - analyst
```

Si solicita contrasena, use:

```text
cyberops
```

Tambien puede verificar el usuario actual:

```bash
whoami
pwd
```

La salida esperada es:

```text
analyst
/home/analyst
```

## 8. Reiniciar o detener el laboratorio

Para detener los contenedores sin borrar los datos persistentes:

```bash
docker compose down
```

Para reiniciar desde cero y borrar volumenes:

```bash
docker compose down -v
docker compose up -d --build
```

Use `docker compose down -v` solo cuando quiera limpiar el entorno completamente.

## 9. Solucion de problemas frecuentes

### El comando `docker compose up -d --build` tarda mucho

La primera ejecucion descarga imagenes y construye el entorno. Espere a que termine. Si falla por red, vuelva a ejecutar el mismo comando.

### No puedo entrar como `analyst`

Ejecute primero:

```bash
docker compose exec workstation bash
```

Luego:

```bash
su - analyst
```

Contrasena, si la pide:

```text
cyberops
```

### Los cambios del laboratorio quedaron mezclados

Puede limpiar el entorno con:

```bash
docker compose down -v
docker compose up -d --build
```

## 10. Reglas de uso seguro

Este laboratorio es un entorno educativo y controlado. No use las herramientas, comandos o tecnicas practicadas contra sistemas externos, redes publicas, cuentas de terceros o servicios sin autorizacion explicita.

Trabaje solo dentro de:

- El Codespace creado desde este repositorio.
- Los contenedores del laboratorio.
