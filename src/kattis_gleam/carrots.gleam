//// # Solving for Carrots
////
//// Difficulty: 1.3
//// See: https://open.kattis.com/problems/carrots
////
//// ### Overview
////
//// Carrots are good for you! First of all, they give you good night vision.
//// Instead of having your lights on at home, you could eat carrots and save
//// energy! Ethnomedically, it has also been shown that the roots of carrots
//// can be used to treat digestive problems. In this contest, you also earn a
//// carrot for each difficult problem you solve, or huffle-puff problems as we
//// prefer to call them.
////
//// You will be given the number of contestants in a hypothetical contest, the
//// number of huffle-puff problems that people solved in the contest and a
//// description of each contestant. Now, find the number of carrots that will
//// be handed out during the contest.
////
//// ### Input
////
//// Input starts with two integers 1 ≤ N,P ≤ 1000 on a single line, denoting
//// the number of contestants in the contest and the number of huffle-puff
//// problems solved in total. Then follow N lines, each consisting of a single
//// non-empty line in which the contestant describes him or herself. You may
//// assume that the contestants are good at describing themselves, in a way
//// such that an arbitrary 5-year-old with hearing problems could understand
//// it.
////
//// ### Output
////
//// Output should consist of a single integer: the number of carrots that will
//// be handed out during the contest.
////
//// ### Example(s)
////
//// Sample 1:
//// ```
//// In:
//// 2 1
//// carrots?
//// bunnies
////
//// Out:
//// 1
//// ```
////
//// Sample 2:
//// ```
//// In:
//// 1 5
//// solv problmz
////
//// Out:
//// 5
//// ```
////

import gleam/int.{parse, to_string}
import gleam/list.{map}
import gleam/result.{flatten, map_error, then}
import gleam/string.{append, split, trim}

pub const no_input_error = "Input is not provided"

pub const missing_argument_error = "Input is missing the second argument"

pub const invalid_number_error = "Input at second argument is not a valid number"

const line_sep = "\n"

const sep = " "

fn get_first_line(in: String) -> Result(String, String) {
  let lines =
    in
    |> split(line_sep)
    |> map(trim)

  case lines {
    [] -> Error(no_input_error)
    [line] if line == "" -> Error(no_input_error)
    [line] -> Ok(line)
    [head, ..] -> Ok(head)
  }
}

fn get_second_arg(in: String) -> Result(String, String) {
  let args =
    in
    |> split(sep)

  case args {
    [_, second] -> Ok(second)
    [_, second, ..] -> Ok(second)
    _ -> Error(missing_argument_error)
  }
}

fn parse_arg(arg: String) -> Result(Int, String) {
  arg
  |> parse
  |> map_error(fn(_) { invalid_number_error })
}

fn count_carrots(in: String) -> Result(Int, String) {
  in
  |> get_first_line
  |> then(get_second_arg)
  |> then(parse_arg)
}

pub fn run(in: String) -> String {
  case count_carrots(in) {
    Ok(count) ->
      count
      |> to_string
    Error(err) ->
      "Error: "
      |> append(err)
  }
}
