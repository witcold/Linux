(/dhcp/ && /leased/) { print($1, $2, $3, $8) }
