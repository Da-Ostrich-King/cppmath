#include "../../include/util/Command.hpp"
#include "../../include/util/Exception.hpp"

#include <string>
#include <format>

using namespace gruyere::util;

command_options::command_options() {}

void command_options::register_flag( std::string single, std::string expanded ) {
    
    if ( single.length() > 1 ) {
        throw core::Exception( "Invalid Function Argument", std::format( 
            "Error in gruyere::util::command_options::register_flag, expected"
                    " single.length() <= 1, single was {}. Single should be one character in length eg. 'a' 'F'\n", 
                    single.length() ) );
    }

    for ( int i = 0; i < _options.size(); i++ ) {


        if ( ( single == "" ) ? true : std::get< 0 >( _options[ i ] ) == single ) {
            if ( ( expanded == "" ) ? true : std::get< 1 >( _options[ i ] ) == expanded ) {
                _flags.push_back( std::pair< std::string, std::string >( single, expanded ) );
            } else {
                throw core::Exception( "Redundant Flag", std::format( 
                    "Redundant flag {} was registered. Exists in option[{}]",
                    expanded, i ) );
            }
            
        } else {
            throw core::Exception( "Redundant Flag", std::format( 
                "Redundant flag {} was registered. Exists in option[{}]",
                single, i ) );
        }
    }
}