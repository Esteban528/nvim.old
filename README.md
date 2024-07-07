# estebandev NeoVim

## Instalación Automática (Borrará una configuración anterior)
```cd ~/.config && rm nvim -rf && rm -rf ~/.local/share/nvim && git clone git@github.com:Esteban528/nvim.git && cd nvim && nvim -c 'MasonInstall lua-language-server' init.lua```

Espere que descargue

## Como se ve:
![nvim](../images/img1)
![nvim](../images/img2)

## Comandos
- Abrir la barra de archivos y directorios: `Space+D`
- Guardar: `Ctrl+S`
- Ejecutar archivo Lua: `Space+R`
- Cerrar archivo: `Ctrl+Shift+W`
- Formatear con LSP: `Ctrl+Shift+I`
- Insertar punto y coma al final de la línea: `Space+;`

### Plugins
- Alternar NvimTree: `Space+D`
- Moverse a la ventana izquierda: `Ctrl+H`
- Moverse a la ventana derecha: `Ctrl+L`
- Moverse a la ventana inferior: `Ctrl+J`
- Moverse a la ventana superior: `Ctrl+K`

### Tabbar
- Mover al buffer anterior: `Alt+Shift+Tab`
- Mover al siguiente buffer: `Alt+Tab`
- Reordenar al buffer anterior: `Alt+<`
- Reordenar al siguiente buffer: `Alt+>`
- Ir al buffer en la posición 1: `Alt+1`
- Ir al buffer en la posición 2: `Alt+2`
- Ir al buffer en la posición 3: `Alt+3`
- Ir al buffer en la posición 4: `Alt+4`
- Ir al buffer en la posición 5: `Alt+5`
- Ir al buffer en la posición 6: `Alt+6`
- Ir al buffer en la posición 7: `Alt+7`
- Ir al buffer en la posición 8: `Alt+8`
- Ir al buffer en la posición 9: `Alt+9`
- Ir al último buffer: `Alt+0`
- Fijar/desfijar buffer: `Alt+P`
- Cerrar buffer: `Ctrl+W`
- Cerrar todos los buffers excepto el actual o los fijados: `Alt+Shift+W`
- Seleccionar buffer: `Ctrl+P`
- Ordenar buffers por número: `Space+BB`
- Ordenar buffers por directorio: `Space+BD`
- Ordenar buffers por lenguaje: `Space+BL`
- Ordenar buffers por número de ventana: `Space+BW`

### Telescope
- Buscar archivos: `Ctrl+P`
- Buscar texto en vivo: `Ctrl+Shift+P`
- Buscar buffers: `Space+FB`
- Buscar etiquetas de ayuda: `Space+FH`

### Snippets
- Expandir o saltar en el snippet: `Ctrl+K` (modo inserción y selección)
- Saltar hacia atrás en el snippet: `Ctrl+J` (modo inserción y selección)
- Seleccionar dentro de una lista de opciones en el snippet: `Ctrl+L` (modo inserción)

### LSP Config
- Abrir ventana flotante de diagnósticos: `Space+E`
- Ir al diagnóstico anterior: `[D`
- Ir al siguiente diagnóstico: `]D`
- Establecer lista de localizaciones de diagnósticos: `Space+Q`

#### Mappings específicos del buffer (tras adjuntar el LSP)
- Ir a la declaración: `gD`
- Ir a la definición: `gd`
- Mostrar ayuda flotante: `K`
- Ir a la implementación: `gi`
- Mostrar ayuda de firma: `Ctrl+K`
- Añadir carpeta al espacio de trabajo: `Space+WA`
- Eliminar carpeta del espacio de trabajo: `Space+WR`
- Listar carpetas del espacio de trabajo: `Space+WL`
- Ir a la definición de tipo: `Space+D`
- Renombrar: `Space+RN`
- Acción de código: `Space+CA` (modo normal y visual)
- Buscar referencias: `gr`
- Formatear buffer: `Ctrl+Shift+F`

### Comment.nvim
- Alternar comentario de línea: `gcc`
- Alternar comentario de bloque: `gbc`
- Comentar línea en modo operador (NORMAL y VISUAL): `gc`
- Comentar bloque en modo operador (NORMAL y VISUAL): `gb`
- Añadir comentario en la línea anterior: `gcO`
- Añadir comentario en la línea siguiente: `gco`
- Añadir comentario al final de la línea: `gcA`


### nvim-cmp
- Desplazar la documentación hacia arriba: `Ctrl+B`
- Desplazar la documentación hacia abajo: `Ctrl+F`
- Completar: `Ctrl+Space`
- Abort: `Ctrl+E`
- Confirmar selección: `Enter`
- Seleccionar el siguiente ítem: `Tab` (modo inserción y selección)
- Seleccionar el ítem anterior: `Shift+Tab` (modo inserción y selección)
