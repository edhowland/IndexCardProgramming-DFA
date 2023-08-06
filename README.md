# Determistic Finite Automoton

## Purpose

This exercise was composed for BarCampGR held on Aug. 12th, 2023 and presented by
me (Ed Howland). The participants were asked to write an implementation of a DFA
to be the runtime for a DIY RegExp engine on 3X5 sized index cards. Alternatively,
they can use a simple note taker app on their laptops, tablets or phones. No IDEs or code editors
were explicitly not encouraged.

The inspiration for using this learning technique came from this video:

[William Byrd on The Most Beutiful Program ever written](https://www.youtube.com/watch?v=OyfBQmvr2Hc))

This talk was given at the Papers We Love in NYC on April 12th,  2017
Dr. Byrd says in this video that his mentor Dan Freidman (author of the Little Lisper)
said that if you can't express your idea on a 3X5 index card, then you are doing it wrong.
Specifically, the talk is about Lisp written in Lisp itself.
Alan Kay (of Smalltalk/OOP fame) compared the page 13 of the Lisp Programmer's 1.5
Manual to that of James Clark Maxwell's equations for electrom-magnetism.
The equations of Computer Science.

[McCarthy et al. LISP 1.5 Programmer's Manual Software Preservation Group](https://www.softwarepreservation.org/projects/LISP/book/LISP 1.5 Programmers Manual.pdf/view contents selected Search with Google or enter address edit text](https://www.softwarepreservation.org/projects/LISP/book/LISP%201.5%20Programmers%20Manual.pdf/view)

### Dr. William Byrd's  professional web page

[William E. Byrd](http://webyrd.net/)


### Contents

This repository contains 3 or 4 implementations of the DFA runtime. A DFA
or a Deterministic Finite Automata is a finite state machine of the lowest order.
It implements the 5-tuple of a state machine that recognizes strings in a regular
language. The 5-tuple is:

1. Q : The finite set of states
2. Sigma :  The set of input symbols that are in the alphabet of the  regular language
3. Delta : The transition function. A LUT  that maps Q[i], Sigma[j] to the next Q[i]
4. Final/Accepts : The set of states (Q)  that are some final state. IOW the state is accepted and the string is in the language
5. Q(0) : The start state

## Implementations

- Ruby
- Python
- Javascript

Every implementation is named like this: 'dfa.{ext}' where ext is: 'rb', 'py' or 'js'.

### The regular expression

```regexp
/(ab|cd)+/
```

It is assumed that there is another program that compiles the regular expression
into a file called like: 'table.{ext}', again ext can be: 'rb', 'py' or 'js'.


### The  compiled table.{ext}

Contains 2 functions:

- delta(q, c) : The transition function returns the next state (q) given q and c.
  * Returns 999 if there is no state transitions from q, c.
  * 999 is arbitrary, could be any number not in the set of final states.
- isaccept(q) : Returns true if q is in the set of final states.

There is some boilerplate code at the top of every dfa.{ext} unique to every language
that does possibly 2 things:

- Loads 'table.{ext}' in the same directory.
- Boilerplate to read command line args for the input string to check if in the regex.


Note: where possible, the load step attempts to map the functions: 
delta, isaccept to local to local names within dfa.{ext}.

If the types  must be supplied in your implementations, they should be:

- q: unsigned int
- i: string : The input string
- c/char : single char or 1 character string


The loop must terminate after reading every character in the imput string.
e.g. while (i.length() != 0) { ... }, or use a foreach pattern.

## Notes on delta, isaccepted

These two functions must exist in table.{ext}.
They are expected to be compiled from the regular expression
In other words,  different regular expressions will result in different
table.{ext} files. The same 'dfa.{ext}' can be used to run any regex against
any input string.

In this repo, the table.{ext} . are hand-compiled files that
implement the state transitions table for the regex: '(ab|cd)+'

### The transition table

The key is given as a tuple of (state, char)
The value is the  next state, an int.

1. (0, 'a') : 1
2. (1, 'b') : 2
3. (0, 'c') : 3
4. (3, 'd') : 4
5. ('2, 'a') : 1
6. (2, 'c') : 3
7. (4, 'a') : 1
8. (4, 'c') : 3


The set of final or accepted states:

- [2, 4]

### Implementing the delta function

The return type must be unsigned int
The parameters are:

1. q: unsigned int
2. c: char or single character string

Hint: Most languages support a Hash (table), Dictionary or Object type.
The LUT (Lookup table) must have a cell for every combination of an element from
set Q and every possible value of Sigma (the input alphabet, probably printable ASCII)
Since the latter might explode the size of the LUT toextreme size,  (Q length 10 X 95 ASCII == 950 cells,
you can take advantage of the smaller size of a Hashor Dict. Most implementations
support a default value when a key is not found, use that default to return 999.

### Implementing the isaccepted function

The return type  must be boolean.
The only input parameter is q: unsigned int.

The isaccepted function must return true if, and only if the value of q is in the
set of final or accepted states.
Most languages support a type of Set data type which can be used to store the
set of final state values. (2 and 4 in this example). Return the Set hasMember or similar
method with the passed in value of q.

##### What to do if your language does not have a built-in Set data type

If your language does have a Hash or Dict type, then you can simulate the Set functionality
by creating a Hash with keys of the final state values and values of 'true'.
Again, exploit the ability of the default  to return 'false' when no match
occurs. Alternativly, you can use the Hash hasKey function as well.


## Testing your DFA

This repo has  implementations of the hand compiled regex  for /(ab|cd)+/
in the following files:

- ruby/table.rb
- python/table.py
- javascript/table.js

Copy the needed file to your local directory and make sure to include/require/import
it into your dfa.{rb,py,js} if that is your language of choice.


#### Running your program

```ruby
$ ruby dfa.rb abcd
```

```python
$ python dfa.py cdab
```

Note: Your python maybe called 'python3'

```javascript
$ node dfa.js ababcdcd
```


Contact me if you have any questions or problems

I can be reached on mastodon: @edhowland@fosstodon.org
## Links

[DFA in Python](https://www.youtube.com/watch?v=32bC33nJR3A)
