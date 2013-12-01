#!/bin/bash
# Задача 5 (Функции)
# Написать рекурсивную функцию.
fib () {
  i=$1;
  if test $i -eq 1; then
    echo 1;
  elif test $i -eq 2; then
    echo 1;
  else
    echo $((`fib $((i-1))` + `fib $((i-2))`))
  fi
}

echo `fib 2`;
