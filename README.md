# Gruyere++
# A C++ library for adding features not present in the normal STL, I decided to write this as a utility library for my own use, don't expect continued support

# Errors
Fatal runtime errors are reported as they are normally, as exceptions. And I have a custom exception class, `gruyere::util::core::Exception`, which is simple. The constructor takes 2 arguments rather than one, the first is the type of error (what is reported when calling `gruyere::util::core::Exception::what` or equivilent), but also a message, which can be found with `gruyere::util::core::Exception::why`

# TODO
- [x] Wrote Exception class
- [ ] Write command class # for command line parsing
- [ ] Write arbitrary precision integer class
- [ ] Write arbitrary precision decimal class
- [ ] Write math functions
- - [ ] Log
- - [ ] Trig functions

# Why is it called gruyere?
My cats name is gruyere, it has nothing to do with cheese
![An image of my cat Gruyere](Gruyere.jpg)