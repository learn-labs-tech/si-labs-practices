# Lab 2 — Sistema de archivos y permisos Linux

Documento base: `Spanish_8_5_4_Lab_Navigating_the_Linux_Filesystem_and_Permission_Settings.docx`

## Objetivo
Practicar exploración del sistema de archivos, montaje simulado, permisos, propietarios, enlaces simbólicos y enlaces rígidos.

## Nota de adaptación Docker
El DOCX usa una VM con `/dev/sdb1`. En Docker se simula ese segundo disco con el volumen `/mnt/docker_second_drive` y un montaje bind hacia `~/second_drive`.

## Actividades

```bash
docker compose exec workstation bash
su - analyst

lsblk
mount
mount | grep -E ' / |docker_second_drive|second_drive' || true
cd /
ls -l

# Simular montaje de segundo disco
cd ~
ls -l second_drive/
sudo mount --bind /mnt/docker_second_drive ~/second_drive
ls -l second_drive/
mount | grep second_drive

# Permisos
cd ~/second_drive
ls -l myFile.txt
cat myFile.txt
sudo chmod 665 myFile.txt
ls -l myFile.txt
sudo chown analyst:analyst myFile.txt
ls -l myFile.txt
cat myFile.txt

# Prueba de permisos en /mnt
touch /mnt/myNewFile.txt || echo "Permiso denegado esperado"
sudo touch /mnt/myNewFile.txt
ls -l /mnt/myNewFile.txt

# Directorios y permisos
cd ~
mkdir permisos_lab
chmod 700 permisos_lab
ls -ld permisos_lab
chmod 755 permisos_lab
ls -ld permisos_lab

# Enlaces simbólicos y rígidos
echo "contenido archivo 1" > file1.txt
echo "contenido archivo 2" > file2.txt
ln -s file1.txt file1symbolic
ln file2.txt file2hard
ls -li file1.txt file1symbolic file2.txt file2hard
mv file1.txt file1new.txt
mv file2.txt file2new.txt
cat file1symbolic || echo "El enlace simbólico se rompió"
cat file2hard

# Desmontar al final
cd ~
sudo umount ~/second_drive
```

## Evidencia a entregar

- Salida de `ls -l` antes/después de `chmod` y `chown`.
- Explicación de permisos `665`.
- Explicación de por qué el enlace simbólico se rompe y el enlace rígido no.
