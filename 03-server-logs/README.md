# Lab 3 — Lectura de logs de servidor

Documento base: `Spanish_4_2_9_Lab_Reading_Server_Logs.docx`

## Objetivo
Leer logs con `cat`, `more`, `less`, `tail`, `tail -f`, revisar syslog y usar una versión simulada de `journalctl` en Docker.

## Actividades

```bash
docker compose exec workstation bash
su - analyst

# Archivo principal del lab
cat /home/analyst/lab.support.files/logstash-tutorial.log
more /home/analyst/lab.support.files/logstash-tutorial.log
less /home/analyst/lab.support.files/logstash-tutorial.log
tail /home/analyst/lab.support.files/logstash-tutorial.log
```

## Monitoreo activo

Terminal 1:

```bash
tail -f /home/analyst/lab.support.files/logstash-tutorial.log
```

Terminal 2:

```bash
docker compose exec workstation bash
su - analyst
echo "this is a new entry to the monitored log file" >> /home/analyst/lab.support.files/logstash-tutorial.log
```

Detener `tail -f` con `CTRL+C`.

## Syslog

```bash
sudo cat /var/log/syslog.1
sudo cat /var/log/syslog.2
sudo cat /var/log/syslog.3
sudo cat /var/log/syslog.4
```

## Journalctl adaptado para Docker

El contenedor no ejecuta systemd real. Se incluye un simulador de `journalctl` que permite practicar las opciones del documento:

```bash
journalctl
sudo journalctl --utc
sudo journalctl -b
sudo journalctl -u nginx.service --since today
sudo journalctl -k
sudo journalctl -f
```

## Generar tráfico HTTP

Desde el host abre http://localhost:8080 o desde `workstation`:

```bash
curl http://web-server/
```

## Evidencia a entregar

- Diferencia entre `cat`, `more`, `less`, `tail` y `tail -f`.
- Una línea sospechosa encontrada en los logs.
- Explicación de por qué algunos logs requieren `sudo`.
