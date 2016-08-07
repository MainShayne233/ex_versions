# ExVersions
Updates your README.md with version credentials of all your (specified) external dependencies.

## Installation
  1. Add `ex_versions` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:ex_versions, "~> 0.0.1"}]
    end
    ```

  2. Ensure `ex_versions` is started before your application:

    ```elixir
    def application do
      [applications: [:ex_versions]]
    end
    ```
## Usage
Within your apps start function, such as in ```lib/my_app.ex``` for Phoenix apps, add:
```elixir
# For each tuple:
## - First argument is the desired title for the dependency.
## - Second argument is the bash command for the version of the dependency.
ExVersions.watch [
                    {"Elixir", "elixir -v"},
                    {"Phoenix", "mix phoenix.new -v"},
                    {"Postgresql", "pg_config --version"},
                    {"npm", "npm -v"},
                    {"Node", "node -v"}
                 ]
```

Then simply add ```<!-- ex_versions -->``` in your README.md where you'd like the dependency versions to be placed. Make sure no characters follow ```<!-- ex_versions -->```.

## Example
The following is what the output is when placing ```<!-- ex_versions -->``` below and running the watch function example from above.

<!-- ex_versions -->
## Dependency Versions:
#### Elixir:
```bash
$ elixir -v

Erlang/OTP 19 [erts-8.0.1] [source] [64-bit] [smp:4:4] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

Elixir 1.3.1
```
#### Node:
```bash
$ node -v

v6.1.0
```
#### npm:
```bash
$ npm -v

3.10.3
```
#### Phoenix:
```bash
$ mix phoenix.new -v

Phoenix v1.2.0
```
#### Postgresql:
```bash
$ pg_config --version

PostgreSQL 9.4.4
```
<!-- ex_versions -->
