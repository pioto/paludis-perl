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

#include "const-c.inc"

MODULE = Paludis		PACKAGE = Paludis		

INCLUDE: const-xs.inc

