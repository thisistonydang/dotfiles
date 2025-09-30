IEx.configure(
  default_prompt:
    [
      "\r",
      IO.ANSI.magenta(),
      " ",
      IO.ANSI.blue(),
      "%prefix",
      IO.ANSI.cyan(),
      "(",
      IO.ANSI.bright(),
      IO.ANSI.white(),
      "%counter",
      IO.ANSI.cyan(),
      ")",
      IO.ANSI.magenta(),
      " ❯",
      IO.ANSI.reset()
    ]
    |> IO.chardata_to_string(),
  alive_prompt:
    [
      "\r",
      IO.ANSI.magenta(),
      " ",
      IO.ANSI.blue(),
      "%prefix",
      IO.ANSI.cyan(),
      "(",
      IO.ANSI.bright(),
      IO.ANSI.white(),
      "%node",
      IO.ANSI.cyan(),
      ")",
      IO.ANSI.bright(),
      IO.ANSI.white(),
      "%counter",
      IO.ANSI.magenta(),
      " ❯",
      IO.ANSI.reset()
    ]
    |> IO.chardata_to_string()
)

# Ecto helper functions
import_if_available(Ecto.Changeset)
import_if_available(Ecto.Query)
