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

import gleam/list.{fold, intersperse}
import gleam/int.{parse, to_string}
import gleam/iterator.{map as i_map, range, to_list}
import gleam/result.{map as r_map, map_error, then}
import gleam/string.{append}

pub const out_of_range_error = "Input should be between 1 and 100 (inclusive)"

pub const invalid_number_error = "Input is not a valid number"

const magic_word = "Abracadabra"

const line_sep = "\n"

const sep = " "

fn validate(in: Int) -> Result(Int, String) {
  let min = 1
  let max = 100

  case in {
    in if in >= min && in <= max -> Ok(in)
    _ -> Error(out_of_range_error)
  }
}

// NOTE: `gleam/string_builder` cannot be imported? (At gleam 0.11)
//       The method below is less efficient as it copies the string for every
//       append operation.
fn cast_spell(in: Int) -> String {
  range(from: 1, to: in + 1)
  |> i_map(fn(i) {
    i
    |> to_string
    |> append(sep)
    |> append(magic_word)
  })
  |> to_list
  |> intersperse(line_sep)
  |> fold(
    from: "",
    with: fn(el, acc) {
      acc
      |> append(el)
    },
  )
}

pub fn run(in: String) -> String {
  let result =
    in
    |> parse
    |> map_error(fn(_) { invalid_number_error })
    |> then(validate)
    |> r_map(cast_spell)

  case result {
    Ok(spell) -> spell
    Error(err) ->
      "Error: "
      |> append(err)
  }
}
