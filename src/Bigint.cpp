#include "../include/Bigint.hpp"

template< int size > math::Bigint< size >::Bigint() {
    data.resize( size / 4 );
}