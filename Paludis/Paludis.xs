#ifdef __cplusplus
extern "C" {
#endif
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"
#ifdef __cplusplus
}
#endif

#include <paludis/paludis.hh>
#include <iostream>
#include <iomanip>

using namespace paludis;

class Paludis {
    public:
        Paludis() {
        }
        ~Paludis() {
        }

        int MAJOR_VERSION() {
            return PALUDIS_VERSION_MAJOR;
        }
        int MINOR_VERSION() {
            return PALUDIS_VERSION_MINOR;
        }
};

MODULE = Paludis		PACKAGE = Paludis		

Paludis *
Paludis::new()

void
Paludis::DESTROY()

int
Paludis::MAJOR_VERSION()

int
Paludis::MINOR_VERSION()
