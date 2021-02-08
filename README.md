# Egyptian Multiplication

The following project is a small exploration of the [Egyptian
multiplication](https://en.wikipedia.org/wiki/Ancient_Egyptian_multiplication)
algorithm. The code was inspired by the [From Mathematics to Generic
Programming](https://dl.acm.org/doi/book/10.5555/2643027).

A non-recursive version using `foldl` was originally authored by Rodrigo Girão
Serrão after conversations on his blog [Egyptian multiplication with
Haskell](https://mathspp.com/blog/egyptian-multiplication).

## Documentation

[Haddock](https://www.haskell.org/haddock/doc/html/index.html) API
documentation is available on:

* [GitHub](https://frankhjung.github.io/haskell-multiply/)
  * [Criterion benchmarks](https://frankhjung.github.io/haskell-multiply/benchmark.html)
* [GitLab](https://frankhjung1.gitlab.io/haskell-multiply/)
  * [Criterion benchmarks](https://frankhjung1.gitlab.io/haskell-multiply/benchmark.html)

## Setup

To ensure package dependencies are installed, call:

```bash
make setup
```

## Build

To build run GNU Make with:

```bash
make
```

This runs the default targets of `check` and `fast`.

## Test

```bash
make test
```

## Benchmark

The first time you run the benchmarks, ensure `doc` target is called:

```bash
make doc bench
```

After which you can run just:

```bash
make bench
```

## Execute

To run the default multiplication algorithm (`multiply3`):

```bash
stack exec multiplyApp 12 15
```
