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

MODULE = Paludis		PACKAGE = Paludis::VersionSpec

VersionSpec *
VersionSpec::new(char * text)

void
VersionSpec::DESTROY()

bool
comp(lobj, robj, swap)
    VersionSpec * lobj
    VersionSpec * robj
    IV swap
  CODE:
    RETVAL = (lobj->compare(*robj));
  OUTPUT:
    RETVAL

bool
eql(lobj, robj, swap)
    VersionSpec * lobj
    VersionSpec * robj
    IV swap
  CODE:
    RETVAL = (*lobj == *robj);
  OUTPUT:
    RETVAL

bool
lessthan(lobj, robj, swap)
    VersionSpec * lobj
    VersionSpec * robj
    IV swap
  CODE:
    RETVAL = (*lobj < *robj);
  OUTPUT:
    RETVAL

