#!/bin/bash
# Задача 5 (Функции)
# Написать рекурсивную функцию.
fib () {
if $1 == 1 then
  return 1;
elif $1 == 2 then
  return 1;
else
  return `fib ($1-1)` + `fib ($1-2)`
fi
}

echo `fib 2`;
