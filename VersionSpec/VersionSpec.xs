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

#include <paludis-macros.hh>

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
  INIT:
    paludis_is_derived_from(ST(0),"Paludis::VersionSpec");
    paludis_is_derived_from(ST(1),"Paludis::VersionSpec");
  CODE:
    if (swap) {
        RETVAL = (robj->compare(*lobj));
    } else {
        RETVAL = (lobj->compare(*robj));
    }
  OUTPUT:
    RETVAL

bool 
VersionSpec::tilde_compare(VersionSpec * other)
  INIT:
    paludis_is_derived_from(ST(0),"Paludis::VersionSpec");
    paludis_is_derived_from(ST(1),"Paludis::VersionSpec");
  CODE:
    RETVAL = THIS->tilde_compare(*other);
  OUTPUT:
    RETVAL

bool 
VersionSpec::tilde_greater_compare(VersionSpec * other)
  INIT:
    paludis_is_derived_from(ST(0),"Paludis::VersionSpec");
    paludis_is_derived_from(ST(1),"Paludis::VersionSpec");
  CODE:
    RETVAL = THIS->tilde_greater_compare(*other);
  OUTPUT:
    RETVAL

bool 
VersionSpec::equal_star_compare(VersionSpec * other)
  INIT:
    paludis_is_derived_from(ST(0),"Paludis::VersionSpec");
    paludis_is_derived_from(ST(1),"Paludis::VersionSpec");
  CODE:
    RETVAL = THIS->equal_star_compare(*other);
  OUTPUT:
    RETVAL
