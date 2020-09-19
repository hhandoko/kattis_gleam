//// # R2
////
//// Difficulty: 1.3
//// See: https://open.kattis.com/problems/r2
////
//// ### Overview
////
//// The number S is called the mean of two numbers R1 and R2 if S is equal to
//// (R1 + R2) / 2. Mirko's birthday present for Slavko was two integers R1 and
//// R2. Slavko promptly calculated their mean which also happened to be an
//// integer but then lost R2! Help Slavko restore R2.
////
//// ### Input
////
//// The first and only line of input contains two integers R1 and S, both
//// between −1000 and 1000.
////
//// ### Output
////
//// Output R2 on a single line.
////
//// ### Example(s)
////
//// Sample 1:
//// ```
//// In:
//// 11 15
////
//// Out:
//// 19
//// ```
////
//// Sample 2:
//// ```
//// In:
//// 4 3
////
//// Out:
//// 2
//// ```
////

import gleam/list
import gleam/int
import gleam/result
import gleam/string

pub const no_input_error = "Input is not provided"

pub const missing_argument_error = "Input is missing the second argument"

pub const invalid_number_error = "Input is not a valid number"

pub const out_of_range_error = "Input should be between -1000 and 1000 (inclusive)"

const sep = " "

fn read_args(in: String) -> Result(tuple(String, String), String) {
  let args =
    in
    |> string.split(sep)

  case string.trim(in), args {
    "", _ -> Error(no_input_error)
    _, [_] -> Error(missing_argument_error)
    _, [first, second] -> Ok(tuple(first, second))
    _, [first, second, ..] -> Ok(tuple(first, second))
  }
}

fn parse_args(args: tuple(String, String)) -> Result(tuple(Int, Int), String) {
  case int.parse(args.0), int.parse(args.1) {
    Ok(a), Ok(b) -> Ok(tuple(a, b))
    _, _ -> Error(invalid_number_error)
  }
}

fn validate(args: tuple(Int, Int)) -> Result(tuple(Int, Int), String) {
  let min = -1000
  let max = 1000

  let is_valid =
    [args.0, args.1]
    |> list.all(fn(i) { min <= i && i <= max })

  case is_valid {
    True -> Ok(args)
    False -> Error(out_of_range_error)
  }
}

fn find_r2(args: tuple(Int, Int)) -> Int {
  let tuple(r1, mean) = args

  mean * 2 - r1
}

pub fn run(in: String) -> String {
  let result =
    in
    |> read_args
    |> result.then(parse_args)
    |> result.then(validate)
    |> result.map(find_r2)

  case result {
    Ok(count) ->
      count
      |> int.to_string
    Error(err) ->
      "Error: "
      |> string.append(err)
  }
}
