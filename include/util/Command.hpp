#include <string>
#include <vector>

#pragma once

namespace gruyere {
    namespace util {
        class command_options {

        public:

            command_options();

            /* 
             * registers a flag, a flag is an argument that stands alone,
             * it doesn't need to have it's own argument
             */
            void register_flag( std::string single, std::string expanded );
            /*
             * registers an option, which accepts an argument, otherwise same as flag
            */
            void register_option( std::string single, std::string extended, int paramaters );

            void parse( const char** argv );

        private:
        
            bool parsed = false;
            std::vector< std::pair< std::string, std::string > > _flags;
            std::vector< std::tuple< std::string, std::string, int > > _options;

        };
    }
}