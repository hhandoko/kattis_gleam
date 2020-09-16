import gleam/should
import kattis_gleam/hello

pub fn should_print_hello_world() {
  hello.main()
  |> should.equal("Hello World!")
}
