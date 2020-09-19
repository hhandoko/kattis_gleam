import gleam/should
import gleam/string.{append}
import kattis_gleam/timeloop

pub fn print_5_spells_test() {
  let expected =
    "1 Abracadabra
2 Abracadabra
3 Abracadabra
4 Abracadabra
5 Abracadabra"

  timeloop.run("5")
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

  timeloop.run("10")
  |> should.equal(expected)
}

pub fn print_error_for_neg_1_test() {
  let err =
    "Error: "
    |> append(timeloop.out_of_range_error)

  timeloop.run("-1")
  |> should.equal(err)
}

pub fn print_error_for_0_test() {
  let err =
    "Error: "
    |> append(timeloop.out_of_range_error)

  timeloop.run("0")
  |> should.equal(err)
}

pub fn print_error_for_101_test() {
  let err =
    "Error: "
    |> append(timeloop.out_of_range_error)

  timeloop.run("101")
  |> should.equal(err)
}

pub fn print_error_for_invalid_number_test() {
  let err =
    "Error: "
    |> append(timeloop.invalid_number_error)

  timeloop.run("Hello")
  |> should.equal(err)
}
