import gleam/should
import hello

pub fn should_print_hello_world() {
  hello.main()
  |> should.equal("Hello World!")
}
