// table.js - The compiled regex of "(ab|cd)+"
function delta(s, c) {
  let tbl = {};
  return tbl[[s, c]] ?? 999;
}



function isaccept(s) {
  return false;
}

module.exports = { delta, isaccept };
