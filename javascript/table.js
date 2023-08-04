// table.js - The compiled regex of "(ab|cd)+"
function delta(s, c) {
  let tbl = {};
tbl[[0, "a"]] = 1;
  tbl[[1, "b"]] = 2;
  tbl[[0, "c"]] = 3;
  tbl[[3, "d"]] = 4;
  // Now for the '+' part
tbl[[2, "a"]] = 1;
  tbl[[2, "c"]] = 3;
  tbl[[4, "a"]] = 1;
  tbl[[4, "c"]] = 3;
  return tbl[[s, c]] ?? 999;
}


// isaccept takes q and returns bool if q in accepts set
function isaccept(q) {
  let accepts = new Set();
accepts.add(2);
accepts.add(4);

  return accepts.has(q);
}

module.exports = { delta, isaccept };
