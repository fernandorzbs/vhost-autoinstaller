# vHost automático para linux

Lineas de comando pre definidas para ahorrar tiempo a la hora de crear un virtual host en ubuntu con apache.
### Requerimientos:

- Git.
- PHP >= 7.4
- Apache2
- Ubuntu >= 18.0


## Instalación
En su terminal ejecute estos comandos:

```bash
$ git clone https://github.com/fernandorzbs/vhost-autoinstaller && cd vhost-autoinstaller
$ sudo bash init-vhost.sh
```
Luego nos solicitará el nombre del proyecto a crear por ejemplo "holamundo" el script genera dominios .home automáticamente

```bash
$ Nombre del proyecto a crear: holamundo
```
Con eso sería todo, al final nos arroja la URL que creamos como:

```bash
LINK: http://holamundo.home
```
## Licencia
[MIT](https://choosealicense.com/licenses/mit/)