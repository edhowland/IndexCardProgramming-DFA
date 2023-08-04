// deterministic finite automoton
const {  delta, isaccept } = require("./table");
var argv = process.argv;


var q = 0; // starting state number

for (char of argv[2]) {
  q = delta(q, char);
}
console.log("The value of q is: ", q);
console.log("The result is ", isaccept(q));