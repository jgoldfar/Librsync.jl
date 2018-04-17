#include "librsync.h"
#include <stdlib.h>

const rs_stats_t *construct_rs_stats_t(void)
{
    rs_stats_t      *stats = malloc(sizeof (rs_stats_t));
    return stats;
}