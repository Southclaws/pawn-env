#include <cstring>
#include <string>

#ifdef WIN32
#include <windows.h>
#else
#include <cstdlib>
#endif

#include <amx/amx2.h>

#include "common.hpp"

namespace Natives {
cell GetEnv(AMX* amx, cell* params);
}
