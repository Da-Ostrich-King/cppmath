# Gruyere++
A C++ library for adding features not present in the normal STL, or that I decided would be fun to write even if they are redundant, I decided to write this as a utility library for my own use, don't expect continued support

# Lincense
The license file is located /LICENCE where / is the top level of the git repository
This is a library that adds features to the c++ STL that I think would be useful called "Gruyere++"

Copyright (C) 2024 Copyright belongs to whomever can prove they are the lawfull owner of the following Github Account
<https://github.com/da-ostrich-king/>

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

# Errors
Fatal runtime errors are reported as they are normally, as exceptions. And I have a custom exception class, `gruyere::util::core::Exception`, which is simple. However the constructor takes 2 arguments rather than one, the first is the type of error (what is reported when calling `gruyere::util::core::Exception::what` or equivilent), but also a message, which can be found with `gruyere::util::core::Exception::why`

# Contributing
If you want to contribute, go ahead, but it is not entirely unlikely this will be abandoned. If you still want to contribute, read the [contributers guide](CONTRIBUTING.md). 


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