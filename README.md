[![License](https://img.shields.io/badge/license-Apache--2.0-brightgreen.svg)](LICENSE)
[![Test](https://github.com/hhandoko/kattis_gleam/workflows/test/badge.svg)](https://github.com/hhandoko/kattis_gleam/actions?query=workflow%3Atest)


# kattis_gleam

[Kattis] solutions based on [Gleam] programming language. The main purpose of
this repo is to explore the programming language features when solving common
algorithm problems (i.e. code puzzles).

Refer to the following link for the list of problems, ranked from easiest to
hardest: <https://open.kattis.com/problems?order=problem_difficulty>

## Prerequisites

You will need [Erlang], [Gleam], and [rebar]. The easiest way to set them all up
is by using [asdf]. The exact version used by this repo as tested:

- [Erlang] 23.0.3
- [Gleam] 0.11.2
- [rebar] 3.14.0


## Quick start

```sh
# Build the project
rebar3 compile

# Run the eunit tests
rebar3 eunit

# Run the Erlang REPL
rebar3 shell
```


## License

```
    Copyright (c) 2020 Herdy Handoko

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
```

`kattis_gleam` is released under the Apache Version 2.0 License. See the [LICENSE] file for further details.


[asdf]: https://asdf-vm.com/
[Erlang]: https://www.erlang.org/
[Gleam]: https://gleam.run/
[Kattis]: https://open.kattis.com/
[LICENSE]: https://github.com/hhandoko/kattis_gleam/blob/master/LICENSE.txt
[rebar]: https://www.rebar3.org/
