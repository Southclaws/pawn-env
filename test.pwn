#include "env"

#define RUN_TESTS
#include <a_samp>
#include <YSI\y_testing>


main() {
    //
}

Test:Valid() {
    new got[128];
    new ret;
    ret = GetEnv("SAMP_ENV_TEST", got);
    printf("- ret %d got '%s'", ret, got);
    ASSERT(ret == 11);
    ASSERT(!strcmp(got, "hello world"));
}

Test:Invalid() {
    new got[128];
    new ret;
    ret = GetEnv("DOES_NOT_EXIST", got);
    printf("- ret %d got '%s'", ret, got);
    ASSERT(ret == 0);
}
