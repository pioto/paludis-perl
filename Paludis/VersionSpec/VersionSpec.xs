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

MODULE = Paludis::VersionSpec   PACKAGE = Paludis::VersionSpec

VersionSpec *
VersionSpec::new(char * text)

void
VersionSpec::DESTROY()

int
comp(lobj, robj, swap)
    VersionSpec * lobj
    VersionSpec * robj
    IV swap
  CODE:
    if (! sv_isobject(ST(0)) || ! sv_derived_from(ST(0), "Paludis::VersionSpec") )
    {
        warn( "Paludis::VersionSpec::comp() -- lobj must be a VersionSpec object" );
        XSRETURN_UNDEF;
    }
    if (! sv_isobject(ST(1)) || ! sv_derived_from(ST(1), "Paludis::VersionSpec") )
    {
        warn( "Paludis::VersionSpec::comp() -- robj must be a VersionSpec object" );
        XSRETURN_UNDEF;
    }

    if (swap) {
        RETVAL = (robj->compare(*lobj));
    } else {
        RETVAL = (lobj->compare(*robj));
    }
  OUTPUT:
    RETVAL
