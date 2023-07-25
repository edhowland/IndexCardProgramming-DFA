
def delta(s, c):
    return { (0, "a"): 1, (1, "b"): 2, (0, "c"): 3, (3, "d"): 4, (2, "a"): 1, (2, "c"): 3, (4, "a"): 1, (4, "c"): 3}.get((s, c), 999)
    
def isaccept(s):
    return s in {2, 4}