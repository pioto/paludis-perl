#define paludis_is_derived_from(o,c) \
    if (! sv_isobject(o) || ! sv_derived_from(o, c) ) \
    { \
        warn( "paludis_is_derived_from: object of wrong type" ); \
        XSRETURN_UNDEF; \
    }

