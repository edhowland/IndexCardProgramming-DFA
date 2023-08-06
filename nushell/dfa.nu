#!/usr/bin/env nu
# dfa.nu deterministic finite automoton
source table.nu


# In Nushell, we have to define a main command to capture CLI args
def main [i: string] {
  let q: int = 0
for $c in ($i | split chars) {
  let q = delta $q $c
}
  print (isaccept $q)
echo
echo $"The value of q is ($q)"
}
