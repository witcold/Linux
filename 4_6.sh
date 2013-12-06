#!/bin/bash
# Задача 4 (Применение AWK для обработки текста, LaTeX для верстки)
# 6. Используя /var/log/messages, вывести список IP-адресов, полученных за всё
# время через DHCP, список отсортированный, уникальный. Для каждого адреса
# вывести первое и последнее время, когда он был получен.
ips=`awk -f 4_6_grep.awk messages | tee 4.tmp | awk '{ print($4) }' | sort | uniq`;

echo \\document.class[11pt] {article} > 4.tex;
echo \\author {W. Mescheryakov} >> 4.tex;
echo \\title {Test Report} >> 4.tex;
echo \\begin {document} >> 4.tex;
echo \\maketitle >> 4.tex;
echo \\begin {tabular} {\|c\|c\|c\|} >> 4.tex;
echo \\hline >> 4.tex;
echo IP \& First \& Last \\\\ >> 4.tex;
echo \\hline >> 4.tex;

count=0;
for ip in $ips
do
  count=$((count+1))
  f=`grep "$ip" 4.tmp | head -n 1 | sed "s/$ip//"`;
  l=`grep "$ip" 4.tmp | tail -n 1 | sed "s/$ip//"`;
  echo $ip \& $f \& $l \\\\ >> 4.tex;
  echo \\hline >> 4.tex;
done;
rm 4.tmp;
echo \\end {tabular} >> 4.tex;
echo >> 4.tex;
echo Total count: $count >> 4.tex;
echo \\end {document} >> 4.tex;
pdflatex 4.tex;
