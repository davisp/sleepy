#include "erl_nif.h"
#include <unistd.h>

static int
load(ErlNifEnv* env, void** priv, ERL_NIF_TERM load_info)
{
    return 0;
}

static ERL_NIF_TERM
nifsleep(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[])
{
    sleep(10);
    return enif_make_atom(env, "ok");
}

static ErlNifFunc sleepy_funcs[] =
{
    {"sleep", 0, nifsleep}
};

ERL_NIF_INIT(sleepy, sleepy_funcs, load, NULL, NULL, NULL)
