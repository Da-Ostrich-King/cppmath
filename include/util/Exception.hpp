#pragma once

#include <string>

#include "../defines.hpp"


namespace gruyere {
    namespace util {
        namespace core {
            class Exception {
            public:
                Exception( std::string _error, std::string _message );
                std::string _error;
                std::string _message;

                const char* what();
                const char* why();
            };
        }
    }
}