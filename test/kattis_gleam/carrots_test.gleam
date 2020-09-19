import gleam/should
import kattis_gleam/carrots

pub fn print_1_carrot_test() {
  let input = "2 1
carrots?
bunnies"
  let expected = Ok(1)

  carrots.run(input)
  |> should.equal(expected)
}

pub fn print_5_carrot_test() {
  let input = "1 5
solv problmz"
  let expected = Ok(5)

  carrots.run(input)
  |> should.equal(expected)
}
