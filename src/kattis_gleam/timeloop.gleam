//// # Stuck in a Time Loop
////
//// Difficulty: 1.3
//// See: https://open.kattis.com/problems/timeloop
////
//// ## Overview
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
import gleam/int.{to_string}
import gleam/iterator.{map, range, to_list}
import gleam/string.{append}

// NOTE: gleam/string_builder cannot be imported?
//       The method below is less efficient as it copies the string for every
//       append operation.
pub fn run(n: Int) -> String {
  let separator = "\n"
  let magic_word = "Abracadabra"

  range(from: 1, to: n + 1)
  |> map(fn(i) {
    i
    |> to_string
    |> append(" ")
    |> append(magic_word)
  })
  |> to_list
  |> intersperse(separator)
  |> fold(
    from: "",
    with: fn(el, acc) {
      acc
      |> append(el)
    },
  )
}
