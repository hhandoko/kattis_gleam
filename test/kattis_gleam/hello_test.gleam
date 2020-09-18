import gleam/should
import kattis_gleam/hello

pub fn print_hello_world_test() {
  hello.run()
  |> should.equal("Hello World!")
}
