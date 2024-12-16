#include <cstdint>
#include <ostream>
#include <vector>
#include <iostream>

namespace math {
    template< int precision >
    class Bigint;

    template< int precision >
    std::ostream& operator<<( std::ostream &out, Bigint< precision > const &data );




    template< int precision > // precision in bytes, must be a multiple of 64
    class Bigint {
    public:
        Bigint();
        
    private:
        std::vector< uint64_t > data;
        bool sign;
        friend std::ostream& operator<< <>( std::ostream &out, Bigint< precision > const &data );
    };
}