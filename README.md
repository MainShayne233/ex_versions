# ExVersions
Updates your README.md with version credentials of all your external dependencies.

## Installation
  1. Add `ex_versions` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:ex_versions, "~> 0.1.0"}]
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

Then simple add ```<!-- ex_versions -->``` in your README.md where you'd like the dependency version to be placed.
