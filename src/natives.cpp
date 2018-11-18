#include "natives.hpp"

const int ENV_VAR_VALUE_SIZE = 512;

#ifdef WIN32
cell Natives::GetEnv(AMX* amx, cell* params)
{
    char* key;
    int length = params[3];
    int result;
    char* value = new char[length];

    amx_GetCString(amx, params[1], key);
    result = GetEnvironmentVariableA(key, value, length);
	if (result > 0) {
		amx_SetCString(amx, params[2], value, result + 1);
	}

    delete[] value;

    return result;
}

#else

cell Natives::GetEnv(AMX* amx, cell* params)
{
    char* key;
    int length = params[3];
    int result = 0;

    amx_GetCString(amx, params[1], key);
    const char* value = getenv(key);
    if (value != nullptr) {
        result = strlen(value);
        amx_SetCString(amx, params[2], value, length);
    }

    return result;
}

#endif
