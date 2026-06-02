# Lab 1 — Linux Shell

Documento base: `Spanish_8_2_7_Lab_Getting_Familiar_with_the_Linux_Shell.docx`

## Objetivo
Practicar comandos básicos de Linux: `man`, `pwd`, `cd`, `ls`, `mkdir`, redirección, `cat`, archivos ocultos, `cp`, `rm` y `mv`.

## Entrar al laboratorio

```bash
docker compose exec workstation bash
su - analyst
```

## Actividades equivalentes al DOCX

```bash
pwd
ls -l
man man
man cp
man pwd

mkdir cyops_folder1
mkdir cyops_folder2
mkdir cyops_folder3
ls -l

cd /home/analyst/cyops_folder3
pwd
cd ~
mkdir /home/analyst/cyops_folder3/cyops_folder4
ls -l /home/analyst/cyops_folder3

# Redirección y anexado
ls -l > listing.txt
cat listing.txt
echo "new line for the lab" >> some_text_file.txt
cat some_text_file.txt

# Archivos ocultos
ls -a
touch .hidden_lab_file
ls -la

# Copiar, eliminar y mover
cp some_text_file.txt cyops_folder2/
ls -l cyops_folder2/
rm some_text_file.txt
ls -l
mv cyops_folder2/some_text_file.txt .
ls -l
rm -r cyops_folder1
ls -l
```

## Evidencia a entregar

- Captura o salida de `pwd`, `ls -la`, `cat some_text_file.txt`.
- Explicación corta de la diferencia entre `>` y `>>`.
- Explicación corta de la diferencia entre `cp`, `mv` y `rm`.
