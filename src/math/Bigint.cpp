#include "../../include/math/Bigint.hpp"


template< int size > gruyere::math::Bigint< size >::Bigint() {
    data.resize( size );
}

template< int precision >
std::ostream& operator<< ( std::ostream& out, gruyere::math::Bigint< precision > const &data) {
    for ( int i = 0; i < data.length(); i++ ) {
        out << ( int ) data[ i ];
    }
    return out;
}