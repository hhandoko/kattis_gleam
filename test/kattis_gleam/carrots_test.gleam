import gleam/should
import gleam/string.{append}
import kattis_gleam/carrots

pub fn print_1_carrot_test() {
  let input = "2 1
carrots?
bunnies"

  carrots.run(input)
  |> should.equal("1")
}

pub fn print_5_carrot_test() {
  let input = "1 5
solv problmz"

  carrots.run(input)
  |> should.equal("5")
}

pub fn print_error_for_no_input_test() {
  let err =
    "Error: "
    |> append(carrots.no_input_error)

  carrots.run("")
  |> should.equal(err)
}

pub fn print_error_for_missing_second_arg_test() {
  let input = "2
honey?
bear"
  let err =
    "Error: "
    |> append(carrots.missing_argument_error)

  carrots.run(input)
  |> should.equal(err)
}

pub fn print_error_for_arg_invalid_number_test() {
  let input = "1 ABC
bees"
  let err =
    "Error: "
    |> append(carrots.invalid_number_error)

  carrots.run(input)
  |> should.equal(err)
}
