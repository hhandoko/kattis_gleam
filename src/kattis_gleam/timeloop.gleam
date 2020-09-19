//// # Stuck in a Time Loop
////
//// Difficulty: 1.3
//// See: https://open.kattis.com/problems/timeloop
////
//// ### Overview
////
//// Last night when you went to sleep, you had a strange feeling that you may
//// see the same day again. And your strange feeling came to bewhen you woke
//// up, everyone seemed to think that it was yesterday morning! The same
//// strange feeling came back in the evening.
////
//// When this pattern continued for days, you looked for help from a time
//// wizard. The wizard says he can break you out of the time loop, but you must
//// chant his spell. The wizard gives you a magic number, and you must count up
//// to that number, starting at 1, saying “Abracadabra” each time.
////
//// ### Input
////
//// Input consists of a single integer N (1 ≤ N ≤ 100).
////
//// ### Output
////
//// Output the entire wizard's spell by counting from 1 to N, giving one number
//// and "Abracadabra" per line.
////
//// ### Example(s)
////
//// Sample 1:
//// ```
//// In:
//// 5
////
//// Out:
//// 1 Abracadabra
//// 2 Abracadabra
//// 3 Abracadabra
//// 4 Abracadabra
//// 5 Abracadabra
//// ```
////
//// Sample 2:
//// ```
//// In:
//// 10
////
//// Out:
//// 1 Abracadabra
//// 2 Abracadabra
//// 3 Abracadabra
//// 4 Abracadabra
//// 5 Abracadabra
//// 6 Abracadabra
//// 7 Abracadabra
//// 8 Abracadabra
//// 9 Abracadabra
//// 10 Abracadabra
//// ```
////

import gleam/int
import gleam/list
import gleam/iterator as itr
import gleam/result
import gleam/string
import gleam/string_builder.{StringBuilder} as sb

pub const out_of_range_error = "Input should be between 1 and 100 (inclusive)"

pub const invalid_number_error = "Input is not a valid number"

const magic_word = "Abracadabra"

const line_sep = "\n"

const sep = " "

fn parse_arg(arg: String) -> Result(Int, String) {
  arg
  |> int.parse
  |> result.map_error(fn(_) { invalid_number_error })
}

fn validate(in: Int) -> Result(Int, String) {
  let min = 1
  let max = 100

  case in {
    in if in >= min && in <= max -> Ok(in)
    _ -> Error(out_of_range_error)
  }
}

fn compose_spell(in: Int) -> StringBuilder {
  in
  |> int.to_string
  |> sb.from_string
  |> sb.append(sep)
  |> sb.append(magic_word)
}

fn cast_spell(in: Int) -> String {
  let seed = sb.from_string("")
  let line_sep_sb = sb.from_string(line_sep)

  itr.range(from: 1, to: in + 1)
  |> itr.map(compose_spell)
  |> itr.to_list
  |> list.intersperse(line_sep_sb)
  |> list.fold(from: seed, with: sb.prepend_builder)
  |> sb.to_string
}

pub fn run(in: String) -> String {
  let result =
    in
    |> parse_arg
    |> result.then(validate)
    |> result.map(cast_spell)

  case result {
    Ok(spell) -> spell
    Error(err) ->
      "Error: "
      |> string.append(err)
  }
}
