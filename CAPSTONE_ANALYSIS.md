# Capstone: Desensamblado de Librerías Nativas (.so)

## Índice

1. [¿Qué es Capstone?](#qué-es-capstone)
2. [Instalación](#instalación)
3. [Arquitecturas soportadas](#arquitecturas-soportadas)
4. [Modos de operación](#modos-de-operación)
5. [Opciones de configuración](#opciones-de-configuración)
6. [API principal](#api-principal)
7. [Uso con librerías Android .so](#uso-con-librerías-android-so)
8. [Script de análisis incluido](#script-de-análisis-incluido)
9. [Ejemplos prácticos](#ejemplos-prácticos)
10. [Análisis de MotoOta.apk](#análisis-de-motoota-apk)

---

## ¿Qué es Capstone?

[Capstone](https://www.capstone-engine.org/) es un framework de desensamblado
multi-arquitectura, multi-plataforma y de código abierto. Convierte código
máquina (bytes binarios) en instrucciones legibles en ensamblador.

| Característica      | Detalle                                                 |
|---------------------|---------------------------------------------------------|
| **Versión**         | 5.0.x (paquete pip: capstone)                           |
| **Licencia**        | BSD                                                     |
| **Lenguajes**       | C/C++ (núcleo), con bindings para Python, Java, Go, etc.|
| **Arquitecturas**   | ARM, ARM64, x86, MIPS, PowerPC, SPARC, SystemZ, XCore   |
| **Uso principal**   | Ingeniería inversa, análisis de malware, seguridad       |

---

## Instalación

```bash
pip install capstone
```

Verificación rápida:

```python
import capstone
print(capstone.cs_version())  # (major, minor, combined)
```

---

## Arquitecturas soportadas

Capstone soporta las siguientes arquitecturas de procesador. Para Android,
las más relevantes son **ARM** y **ARM64 (AArch64)**.

| Constante          | Valor | Descripción                         | Uso en Android        |
|--------------------|-------|-------------------------------------|-----------------------|
| `CS_ARCH_ARM`      | 0     | ARM (32-bit)                        | ✅ armeabi-v7a        |
| `CS_ARCH_ARM64`    | 1     | ARM64 / AArch64 (64-bit)           | ✅ arm64-v8a          |
| `CS_ARCH_MIPS`     | 2     | MIPS                                | ⚠️ Obsoleto en Android|
| `CS_ARCH_X86`      | 3     | x86 / x86_64                        | ✅ x86, x86_64        |
| `CS_ARCH_PPC`      | 4     | PowerPC                             | ❌                    |
| `CS_ARCH_SPARC`    | 5     | SPARC                               | ❌                    |
| `CS_ARCH_SYSZ`     | 6     | SystemZ                             | ❌                    |
| `CS_ARCH_XCORE`    | 7     | XCore                               | ❌                    |

---

## Modos de operación

Los modos se combinan con la arquitectura para definir cómo se decodifican
las instrucciones.

### Modos de tamaño

| Constante              | Valor       | Descripción                              |
|------------------------|-------------|------------------------------------------|
| `CS_MODE_16`           | 2           | Modo 16-bit (x86)                        |
| `CS_MODE_32`           | 4           | Modo 32-bit (x86)                        |
| `CS_MODE_64`           | 8           | Modo 64-bit (x86_64)                     |

### Modos ARM

| Constante              | Valor       | Descripción                              |
|------------------------|-------------|------------------------------------------|
| `CS_MODE_ARM`          | 0           | Modo ARM estándar (instrucciones 32-bit) |
| `CS_MODE_THUMB`        | 16          | Modo Thumb (instrucciones 16-bit)        |

> **Nota Android:** La mayoría de código ARM en Android usa modo **Thumb**
> (instrucciones de 16 bits) para reducir el tamaño del binario. Las librerías
> `.so` suelen mezclar ambos modos.

### Modos MIPS

| Constante              | Valor       | Descripción                              |
|------------------------|-------------|------------------------------------------|
| `CS_MODE_MIPS32`       | 4           | MIPS 32-bit                              |
| `CS_MODE_MIPS64`       | 8           | MIPS 64-bit                              |

### Endianness

| Constante                  | Valor       | Descripción                          |
|----------------------------|-------------|--------------------------------------|
| `CS_MODE_LITTLE_ENDIAN`    | 0           | Little-endian (default Android)      |
| `CS_MODE_BIG_ENDIAN`       | 0x80000000  | Big-endian                           |

Los modos se combinan con el operador OR (`|`):

```python
# ARM Thumb, little-endian
mode = capstone.CS_MODE_THUMB | capstone.CS_MODE_LITTLE_ENDIAN

# x86 64-bit
mode = capstone.CS_MODE_64
```

---

## Opciones de configuración

### CS_OPT_SYNTAX — Sintaxis del desensamblado

Controla la notación usada para mostrar las instrucciones. Solo aplica a x86.

| Constante                  | Valor | Descripción                              |
|----------------------------|-------|------------------------------------------|
| `CS_OPT_SYNTAX_DEFAULT`   | 0     | Sintaxis por defecto de la arquitectura  |
| `CS_OPT_SYNTAX_INTEL`     | 1     | Sintaxis Intel: `mov eax, 1`             |
| `CS_OPT_SYNTAX_ATT`       | 2     | Sintaxis AT&T: `movl $1, %eax`          |
| `CS_OPT_SYNTAX_NOREGNAME` | 3     | Usa números de registro en vez de nombres|

```python
md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
md.syntax = capstone.CS_OPT_SYNTAX_INTEL  # Sintaxis Intel
```

### CS_OPT_DETAIL — Información detallada

Cuando está activado, cada instrucción incluye información detallada
como registros leídos/escritos, grupos de instrucciones, y operandos
desglosados.

```python
md = capstone.Cs(capstone.CS_ARCH_ARM, capstone.CS_MODE_ARM)
md.detail = True  # Activar información detallada

for insn in md.disasm(code, 0x1000):
    if insn.detail:
        print(f"  Registros leídos: {insn.regs_read}")
        print(f"  Registros escritos: {insn.regs_write}")
        print(f"  Grupos: {insn.groups}")
```

> **Rendimiento:** Activar `detail` reduce el rendimiento un ~40%.
> Usar solo cuando se necesite análisis profundo.

### CS_OPT_SKIPDATA — Saltar datos no-código

Por defecto, Capstone se detiene cuando encuentra bytes que no puede
decodificar como instrucciones válidas. Con `skipdata`, los salta
y continúa.

```python
md = capstone.Cs(capstone.CS_ARCH_ARM, capstone.CS_MODE_ARM)
md.skipdata = True  # No detenerse en datos inválidos
```

Esto es especialmente útil al desensamblar archivos `.so` completos
que mezclan código y datos (tablas de salto, constantes literales, etc.).

### CS_OPT_MODE — Cambiar modo en tiempo de ejecución

Permite cambiar el modo de operación sin crear una nueva instancia.

```python
md = capstone.Cs(capstone.CS_ARCH_ARM, capstone.CS_MODE_ARM)
# Cambiar a modo Thumb
md.mode = capstone.CS_MODE_THUMB
```

---

## API principal

### Crear instancia

```python
import capstone

# Crear desensamblador ARM 32-bit
md = capstone.Cs(capstone.CS_ARCH_ARM, capstone.CS_MODE_ARM)
```

### Desensamblar código

```python
CODE = b"\x00\x00\xa0\xe3\x1e\xff\x2f\xe1"

# disasm(code, address, count=0)
#   code    : bytes del código máquina
#   address : dirección virtual base
#   count   : máximo de instrucciones (0 = todas)
for insn in md.disasm(code, 0x1000):
    print(f"0x{insn.address:x}: {insn.mnemonic} {insn.op_str}")
```

Salida:
```
0x1000: mov r0, #0
0x1004: bx lr
```

### Propiedades de una instrucción (`CsInsn`)

| Propiedad     | Tipo       | Descripción                              |
|---------------|------------|------------------------------------------|
| `id`          | int        | ID único de la instrucción               |
| `address`     | int        | Dirección virtual                        |
| `size`        | int        | Tamaño en bytes                          |
| `bytes`       | bytes      | Bytes crudos de la instrucción           |
| `mnemonic`    | str        | Nombre de la instrucción (ej: `mov`)     |
| `op_str`      | str        | Operandos como texto (ej: `r0, #0`)     |
| `regs_read`   | list[int]  | Registros leídos (requiere `detail=True`)|
| `regs_write`  | list[int]  | Registros escritos (requiere `detail=True`)|
| `groups`      | list[int]  | Grupos a los que pertenece               |

### Funciones de utilidad

```python
# Verificar si una arquitectura está soportada
capstone.cs_support(capstone.CS_ARCH_ARM)  # True

# Obtener versión
capstone.cs_version()  # (5, 0, 1280)

# Desensamblar con iterador rápido (menor memoria)
for insn in md.disasm_lite(code, 0x1000):
    address, size, mnemonic, op_str = insn
```

---

## Uso con librerías Android .so

Las aplicaciones Android pueden incluir librerías nativas (`.so`) compiladas
para diferentes arquitecturas de procesador. Estas se encuentran en:

```
app.apk
└── lib/
    ├── armeabi-v7a/    ← ARM 32-bit (CS_ARCH_ARM + CS_MODE_THUMB)
    ├── arm64-v8a/      ← ARM 64-bit (CS_ARCH_ARM64 + CS_MODE_ARM)
    ├── x86/            ← x86 32-bit (CS_ARCH_X86 + CS_MODE_32)
    └── x86_64/         ← x86 64-bit (CS_ARCH_X86 + CS_MODE_64)
```

### Extraer librerías de un APK

```bash
# Descomprimir el APK
unzip app.apk -d extracted/

# Las librerías están en extracted/lib/<arquitectura>/
ls extracted/lib/arm64-v8a/
# → libfoo.so libbar.so
```

### Desensamblar una librería ARM64

```python
import capstone

with open("libfoo.so", "rb") as f:
    code = f.read()

md = capstone.Cs(capstone.CS_ARCH_ARM64, capstone.CS_MODE_ARM)
md.detail = True
md.skipdata = True

for insn in md.disasm(code, 0x0):
    print(f"0x{insn.address:x}: {insn.mnemonic}\t{insn.op_str}")
```

### Detección automática de arquitectura

El script `capstone_disassemble.py` incluido detecta automáticamente la
arquitectura leyendo el encabezado ELF del archivo `.so`:

| Campo ELF      | Offset | Significado                                |
|----------------|--------|--------------------------------------------|
| `e_ident[4]`   | 0x04   | Clase: 1=32-bit, 2=64-bit                 |
| `e_ident[5]`   | 0x05   | Endianness: 1=LE, 2=BE                    |
| `e_machine`    | 0x12   | Arquitectura: 0x28=ARM, 0xB7=ARM64, etc.  |

---

## Script de análisis incluido

### `capstone_disassemble.py`

Script Python que automatiza el escaneo y desensamblado de archivos `.so`.

#### Uso

```bash
# Escanear directorio actual
python3 capstone_disassemble.py

# Escanear directorio específico
python3 capstone_disassemble.py /ruta/a/lib/

# Limitar instrucciones por archivo
python3 capstone_disassemble.py /ruta/ --max-instructions 500

# Guardar salida en archivo
python3 capstone_disassemble.py /ruta/ --output resultado.txt

# Desensamblar todo (sin límite)
python3 capstone_disassemble.py /ruta/ --max-instructions 0
```

#### Opciones

| Opción                   | Descripción                                       | Default |
|--------------------------|---------------------------------------------------|---------|
| `directory`              | Directorio a escanear (posicional)                | `.`     |
| `--max-instructions, -n` | Máximo de instrucciones por archivo               | 200     |
| `--output, -o`           | Archivo de salida                                 | stdout  |

#### Características

- **Detección automática** de arquitectura y modo desde el encabezado ELF
- **Localización de .text** — busca la sección `.text` del ELF
- **Escaneo recursivo** de directorios
- **Soporte multi-arquitectura**: ARM, ARM64, x86, x86_64, MIPS
- **Manejo de errores** para archivos no-ELF o arquitecturas no soportadas

#### Ejemplo de salida

```
Capstone version: (5, 0, 1280)
Scanning directory: /tmp
Found 1 .so file(s):

  • /tmp/test_lib.so

================================================================================
File: /tmp/test_lib.so
Size: 233 bytes
Is ELF: True
Architecture: ARM
Mode: ARM
Entry Point: 0x1000
.text Section: offset=0x34, size=20 bytes, vaddr=0x1000
Instructions disassembled: 5
--------------------------------------------------------------------------------
        0x1000:  0000a0e3                  mov        r0, #0
        0x1004:  0110a0e3                  mov        r1, #1
        0x1008:  0220a0e3                  mov        r2, #2
        0x100c:  010080e0                  add        r0, r0, r1
        0x1010:  1eff2fe1                  bx         lr
```

---

## Ejemplos prácticos

### 1. Desensamblar ARM Thumb (común en Android)

```python
import capstone

# Código Thumb: push {r7, lr}; mov r7, sp; pop {r7, pc}
code = b"\x80\xb5\x00\xaf\x80\xbd"

md = capstone.Cs(capstone.CS_ARCH_ARM, capstone.CS_MODE_THUMB)
for insn in md.disasm(code, 0x1000):
    print(f"0x{insn.address:x}: {insn.mnemonic}\t{insn.op_str}")
```

### 2. Desensamblar x86_64

```python
import capstone

# x86_64: push rbp; mov rbp, rsp; pop rbp; ret
code = b"\x55\x48\x89\xe5\x5d\xc3"

md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
md.syntax = capstone.CS_OPT_SYNTAX_INTEL
for insn in md.disasm(code, 0x1000):
    print(f"0x{insn.address:x}: {insn.mnemonic}\t{insn.op_str}")
```

Salida:
```
0x1000: push    rbp
0x1001: mov     rbp, rsp
0x1004: pop     rbp
0x1005: ret
```

### 3. Análisis detallado con operandos

```python
import capstone

code = b"\x01\x00\x80\xe0"  # add r0, r0, r1

md = capstone.Cs(capstone.CS_ARCH_ARM, capstone.CS_MODE_ARM)
md.detail = True

for insn in md.disasm(code, 0x1000):
    print(f"Instrucción: {insn.mnemonic} {insn.op_str}")
    print(f"  Bytes: {insn.bytes.hex()}")
    print(f"  Tamaño: {insn.size}")
    print(f"  Registros leídos: {[insn.reg_name(r) for r in insn.regs_read]}")
    print(f"  Registros escritos: {[insn.reg_name(r) for r in insn.regs_write]}")
```

### 4. Buscar instrucciones específicas (llamadas a funciones)

```python
import capstone

md = capstone.Cs(capstone.CS_ARCH_ARM, capstone.CS_MODE_ARM)
md.detail = True

with open("libfoo.so", "rb") as f:
    code = f.read()

for insn in md.disasm(code, 0x0):
    # Buscar instrucciones de salto/llamada
    if insn.mnemonic in ("bl", "blx", "b", "bx"):
        print(f"0x{insn.address:x}: {insn.mnemonic} {insn.op_str}")
```

---

## Análisis de MotoOta.apk

### Resultado del escaneo

El APK **MotoOta.apk** (versión 35.00.094) fue analizado con el script
`capstone_disassemble.py`. Resultado:

```
No .so files found.
```

### Conclusión

**MotoOta.apk no contiene librerías nativas (.so)**. Es una aplicación
100% Java/Kotlin que:

- No incluye directorio `lib/` con binarios nativos
- No contiene llamadas a `System.loadLibrary()` ni `System.load()`
- Usa la API estándar de Android (SDK) para todas sus operaciones
- La comunicación de red se realiza mediante Volley (Java HTTP stack)
- El procesamiento de actualizaciones OTA se hace completamente en código
  Dalvik/ART (Java bytecode decompilado a Smali)

### ¿Por qué no hay librerías nativas?

Las aplicaciones de actualización OTA de Motorola están diseñadas para:

1. **Comunicarse con servidores CDS** (Cloud Device Service) — operación de
   red pura que no requiere código nativo
2. **Gestionar descargas** de paquetes de actualización — usando
   `DownloadManager` del sistema Android
3. **Verificar integridad** — usando APIs criptográficas de Java (`java.security`)
4. **Aplicar actualizaciones** — delegando al `RecoverySystem` del framework
   Android, que internamente usa código nativo del sistema operativo

No requiere código nativo propio porque toda la funcionalidad de bajo nivel
la proporciona el framework Android.

---

## Referencias

- [Capstone Engine — Documentación oficial](https://www.capstone-engine.org/documentation.html)
- [Capstone Python API](https://www.capstone-engine.org/lang_python.html)
- [Repositorio GitHub Capstone](https://github.com/capstone-engine/capstone)
- [Android NDK — ABI Management](https://developer.android.com/ndk/guides/abis)
- [Formato ELF — Wikipedia](https://en.wikipedia.org/wiki/Executable_and_Linkable_Format)
