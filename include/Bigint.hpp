#include <cstdint>
#include <ostream>
#include <vector>
#include <iostream>
namespace gruyere {
    namespace math {
        template< int precision >
        class Bigint;

        template< int precision >
        std::ostream& operator<<( std::ostream &out, Bigint< precision > const &data );

        template< int precision > // precision in bytes
        class Bigint {
        public:
            Bigint();
            
        private:
            std::vector< uint8_t > data;
            bool sign;

            template< int size >
            friend std::ostream& operator<<( std::ostream &out, Bigint< precision > const &data );
        };
    }
}