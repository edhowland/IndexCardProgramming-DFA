# table.nu hand compiled regex for (ab|cd)+

def delta [q: int, c: string] {
  return ({ "0_a": 1,
  "1_b": 2,
  "0_c": 3,
  "3_d": 4,
  "2_a": 1,
  "2_c": 3,
  "4_a": 1,
  "4_c": 3 } | get -i  $"($q)_($c)")
}

def isaccept [q: int] {
  return ([false, false, true, false, true] | get $q)
}
