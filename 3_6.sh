#!/bin/bash
# Задача 3 (Парсинг текста регекспами и простыми утилитами - grep, wc, tr, cut, uniq, sort, echo, cat)
# 6. Используя /var/log/messages, вывести список IP-адресов, полученных за всё
# время через DHCP, список отсортированный, уникальный. Для каждого адреса
# вывести первое и последнее время, когда он был получен.
ips=`grep 'dhcp' messages | grep 'leased' | sed "s/ / /" | cut -d " " -f 1-3,8 | tee 3.tmp | sed "s/^.*:[0-9][0-9]//" | sort | uniq`;
for ip in $ips
do
  echo IP : $ip;
  f=`grep "$ip" 3.tmp | head -n 1 | sed "s/$ip//"`;
  l=`grep "$ip" 3.tmp | tail -n 1 | sed "s/$ip//"`;
  echo First : $f;
  echo Last : $l;
done
