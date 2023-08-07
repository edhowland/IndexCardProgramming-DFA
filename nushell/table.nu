# table.nu hand compiled regex for (ab|cd)+

def inner_delta [q: int, c: string] {
  return ({ "0_a": 1,
  "1_b": 2,
  "0_c": 3,
  "3_d": 4,
  "2_a": 1,
  "2_c": 3,
  "4_a": 1,
  "4_c": 3 } | get -i  $"($q)_($c)")
}


# The real delta fn
def delta [q: int, c: string] {
  let res = (inner_delta $q $c)
  if $res == null { return 999 } else { return $res }
}
def isaccept [q: int] {
  if $q == 999 { return false }
  return ([false, false, true, false, true] | get $q)
}
