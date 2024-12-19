#include "../../include/util/Exception.hpp"

using namespace gruyere::util::core;

Exception::Exception( std::string _error, std::string _message ) {
    this->_error = _error;
    this->_message = _message;
}

const char* Exception::what() {
    return _error.c_str();
}

const char* Exception::why() {
    return _message.c_str();
}