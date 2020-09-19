import gleam/should
import gleam/string.{append}
import kattis_gleam/r2

pub fn print_r2_for_11_15_test() {
  let input = "11 15"

  r2.run(input)
  |> should.equal("19")
}

pub fn print_r2_for_4_3_test() {
  let input = "4 3"

  r2.run(input)
  |> should.equal("2")
}

pub fn print_error_for_no_input_test() {
  let err =
    "Error: "
    |> append(r2.no_input_error)

  r2.run("")
  |> should.equal(err)
}

pub fn print_error_for_missing_second_arg_test() {
  let err =
    "Error: "
    |> append(r2.missing_argument_error)

  r2.run("2")
  |> should.equal(err)
}

pub fn print_error_for_first_arg_invalid_number_test() {
  let err =
    "Error: "
    |> append(r2.invalid_number_error)

  r2.run("ABC 1")
  |> should.equal(err)
}

pub fn print_error_for_second_arg_invalid_number_test() {
  let err =
    "Error: "
    |> append(r2.invalid_number_error)

  r2.run("1 ABC")
  |> should.equal(err)
}

pub fn print_error_for_neg_1001_first_arg_test() {
  let err =
    "Error: "
    |> append(r2.out_of_range_error)

  r2.run("-1001 1")
  |> should.equal(err)
}

pub fn print_error_for_neg_1001_second_arg_test() {
  let err =
    "Error: "
    |> append(r2.out_of_range_error)

  r2.run("1 -1001")
  |> should.equal(err)
}

pub fn print_error_for_1001_first_arg_test() {
  let err =
    "Error: "
    |> append(r2.out_of_range_error)

  r2.run("1001 1")
  |> should.equal(err)
}

pub fn print_error_for_1001_second_arg_test() {
  let err =
    "Error: "
    |> append(r2.out_of_range_error)

  r2.run("1 1001")
  |> should.equal(err)
}

pub fn print_error_for_neg_1001_both_arg_test() {
  let err =
    "Error: "
    |> append(r2.out_of_range_error)

  r2.run("-1001 -1001")
  |> should.equal(err)
}

pub fn print_error_for_1001_both_arg_test() {
  let err =
    "Error: "
    |> append(r2.out_of_range_error)

  r2.run("1001 1001")
  |> should.equal(err)
}

pub fn print_error_for_neg_1001_and_1001_arg_test() {
  let err =
    "Error: "
    |> append(r2.out_of_range_error)

  r2.run("-1001 1001")
  |> should.equal(err)
}

pub fn print_error_for_1001_and_neg_1001_arg_test() {
  let err =
    "Error: "
    |> append(r2.out_of_range_error)

  r2.run("1001 -1001")
  |> should.equal(err)
}
