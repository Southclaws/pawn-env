#include "env"

#define RUN_TESTS
#include <a_samp>
#include <YSI\y_testing>


main() {
    //
}

Test:RunTest() {
    new got[128];
    new ret;
    ret = GetEnv("SAMP_ENV_TEST", got);
    printf("- ret %d got '%s'", ret, got);
}
