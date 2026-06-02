#!/usr/bin/env bash
set -euo pipefail

mkdir -p /home/analyst/lab.support.files /home/analyst/second_drive /mnt/docker_second_drive /var/log/journal
cp -n /opt/lab.support.files/* /home/analyst/lab.support.files/ 2>/dev/null || true
chown -R analyst:analyst /home/analyst/lab.support.files /home/analyst/second_drive

# Archivos base para Lab 1
if [ ! -f /home/analyst/some_text_file.txt ]; then
  cat >/home/analyst/some_text_file.txt <<'EOF'
This is a sample text file for Linux shell practice.
Cybersecurity analysts and developers use the shell to automate repeatable tasks.
EOF
  chown analyst:analyst /home/analyst/some_text_file.txt
fi
if [ ! -f /home/analyst/space.txt ]; then
  echo "Space exploration file for redirection practice." >/home/analyst/space.txt
  chown analyst:analyst /home/analyst/space.txt
fi

# Contenido que simula un segundo disco para Lab 2. Se monta con: sudo mount --bind /mnt/docker_second_drive ~/second_drive
if [ ! -f /mnt/docker_second_drive/myFile.txt ]; then
  cat >/mnt/docker_second_drive/myFile.txt <<'EOF'
This file lives in the simulated second drive volume.
Use chmod, chown and cat to practice Linux permissions.
EOF
fi
mkdir -p /mnt/docker_second_drive/lost+found
chown -R root:root /mnt/docker_second_drive
chmod 644 /mnt/docker_second_drive/myFile.txt
chmod 700 /mnt/docker_second_drive/lost+found

# Logs base para Lab 3
mkdir -p /var/log
for n in 1 2 3 4; do
  f="/var/log/syslog.${n}"
  if [ ! -f "$f" ]; then
    cat >"$f" <<EOF
Feb 7 13:23:15 secOps kernel: [5.458959] lab kernel message sample ${n}
Feb 7 13:23:16 secOps network: eth0 link up, 100Mbps, full-duplex
Feb 7 13:24:02 secOps sudo: analyst : TTY=pts/0 ; PWD=/home/analyst ; USER=root ; COMMAND=/usr/bin/cat /var/log/syslog.${n}
Feb 7 13:25:11 secOps sshd[120${n}]: Failed password for invalid user test from 192.0.2.${n} port 5522 ssh2
Feb 7 13:26:44 secOps app[22${n}]: user_login status=success user=analyst ip=198.51.100.${n}
EOF
  fi
done
chmod 640 /var/log/syslog.*
chown root:adm /var/log/syslog.* 2>/dev/null || chown root:root /var/log/syslog.*

# Mantener contenedor vivo y con shell accesible por docker exec.
echo "Lab workstation ready. Use: docker compose exec workstation bash"
tail -f /dev/null
