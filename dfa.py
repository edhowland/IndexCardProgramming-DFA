import sys
from table import delta, isaccept

i=sys.argv[1]
s=0
while len(i) != 0:
    c=i[0]; i=i[1:]
    s = delta(s, c)


print(isaccept(s))
    
    