import gleam/should
import kattis_gleam/timeloop

pub fn print_5_spells_test() {
  let expected =
    "1 Abracadabra
2 Abracadabra
3 Abracadabra
4 Abracadabra
5 Abracadabra"

  timeloop.run(5)
  |> should.equal(expected)
}

pub fn print_10_spells_test() {
  let expected =
    "1 Abracadabra
2 Abracadabra
3 Abracadabra
4 Abracadabra
5 Abracadabra
6 Abracadabra
7 Abracadabra
8 Abracadabra
9 Abracadabra
10 Abracadabra"

  timeloop.run(10)
  |> should.equal(expected)
}
