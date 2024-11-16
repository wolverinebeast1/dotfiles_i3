## Arch Linux Instalación básica

Este archivo contiene la secuencia de comandos necesaria para instalar la base de Arch Linux. El enfoque es adecuado para quienes están instalando Arch Linux en `VirtualBox`, pero también funciona bien si lo estás instalando en hardware.

## Tabla de Contenidos
- [Configuración del Teclado](#Configurar-teclado)
- [Conectarse a Wi-Fi (Opcional)](#Conectar-Wi-fi(opcional))
- [Particionado de Discos](#Crear-particiones)
- [Formateo y Montaje de Particiones](#Formateo-y-montaje-particiones)
- [Instalación del Sistema](#Instalar-Sistema)



---

## Configurar-teclado

Configura la distribución de tu teclado. Para encontrar la distribución correcta, consulta las instrucciones en la documentación de Arch Linux.


Para buscar las distribuciones puedes usar el siguiente comando:
```bash
#Buscar distribuciones de teclado
localectl list-keymaps
```
```bash
#En mi caso usare la distribución en español 
loadkeys es
```
---
## Conectar-Wi-Fi (OPCIONAL)
```bash
iwctl
device list
station your_device_name scan
station your_device_name get-networks
station your_device_name connect SSID
ping google.com
```
## Crear-particiones
En esta sección de la instalación, usaremos un enfoque básico para particionar discos sin cifrado.

Las particiones suelen verse así:

- `/dev/nvme0n1p1`
- `/dev/nvme0n1p2`
- `/dev/sda`
- `/dev/sdb`

Para identificar fácilmente las particiones, puedes usar el comando lsblk, que mostrará algo como esto:

<img src="/images/lsblk.PNG" alt="rice" align="center" width="500px">

Después de identificar las particiones, es momento de particionarlas y formatearlas.

```bash
#En mi caso es /dev/sda
cfdisk /dev/sda
```

## Formateo-y-montaje-particiones

After partitioning the disks, we will proceed to format them and mount them.

```bash
# Formatear como FAT32
mkfs.fat -F32 /dev/sda1
# Formatear como ext4 
mkfs.ext4 /dev/sda2
# Crear un directorio para la partición EFI
mkdir -p /mnt/boot/efi
# Montar la partición EFI
mount /dev/sda1 /mnt/boot/efi
# Montar la partición Linux
mount /dev/sda2 /mnt 
```

## Instalar-Sistema
Ya hemos creado, formateado y montado nuestras particiones. Ahora es momento de instalar el sistema operativo.

En esta etapa, la instalación está mayormente automatizada. El script se encargará de la configuración y de instalar los paquetes necesarios. Una vez finalice, podremos reiniciar y comenzar a usar el sistema.

```bash
# Instalar los paquetes base necesarios
pacstrap /mnt base base-devel linux linux-firmware git vim
# Generar la tabla fstab
genfstab -U /mnt >> /mnt/etc/fstab
# Verificar que todo esté en orden
cat /mnt/etc/fstab
# Ingresar a la configuración de Arch
arch-chroot /mnt
# Clonar este repositorio para descargar el script de instalación
git clone https://github.com/wolverinebeast1/arch-installation
# Cambiar al directorio
cd arch-installation/
# Dar permisos al script
chmod +x install_arch.sh
# Ejecutar el script de instalación
./install_arch.sh
```