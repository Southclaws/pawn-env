# pawn-env

[![sampctl](https://shields.southcla.ws/badge/sampctl-pawn--env-2f2f2f.svg?style=for-the-badge)](https://github.com/Southclaws/pawn-env)

Provides access to environment variables in Pawn.

**Rule III of the [Twelve Factor App](https://12factor.net/)** states:

Store config in the environment

An app’s _config_ is everything that is likely to vary between deploys (staging,
production, developer environments, etc). This includes:

- Resource handles to the database, Memcached, and other backing services
- Credentials to external services such as Amazon S3 or Twitter
- Per-deploy values such as the canonical hostname for the deploy

Apps sometimes store config as constants in the code. This is a violation of
twelve-factor, which requires strict separation of config from code. Config
varies substantially across deploys, code does not.

([read the rest here](https://12factor.net/config))

## Installation

Simply install to your project:

```bash
sampctl package install Southclaws/pawn-env
```

Include in your code and begin using the library:

```pawn
#include <env>
```

## Usage

This package provides one function `GetEnv` which stores into `dest` the
environment variable identified by `name` and returns the length of the result.

For example, this code loads a MySQL password from an environment variable:

```pawn
main() {
    new mysqlPassword[128];
    ret = GetEnv("MYSQL_PASSWORD", mysqlPassword);
    if(ret) {
        // use mysqlPassword to connect to DB
    } else {
        print("Environment variable `MYSQL_PASSWORD` not set.");
    }
}
```

## Building

On Windows, to build the standard Windows .dll file: open `CMakeLists.txt` with
Visual Studio 2017+ and develop/build using MSVC tools. To build the Linux build
on Windows, run `make build-linux` and Docker will be used to compile it. On
Linux, use CMake: `mkdir build && cd build && cmake .. && make`.

## Testing

To test on Windows or Linux with the need for containers:

```bash
make test-windows
```

To the Linux build on Windows with a Docker container:

```bash
make test-linux
```
