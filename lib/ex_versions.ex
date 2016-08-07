defmodule ExVersions do
  def watch dependencies do
    {:ok, file} = File.read "README.md"
    case Regex.split ~r/<!-- ex_versions -->(?!.)/, file do
      [first_chunk, second_chunk] ->
        [top, bottom] = [first_chunk, second_chunk]
        write_to_readme top, bottom, dependencies
      [first_chunk, middle, second_chunk] ->
        [top, _, bottom] = [first_chunk, middle, second_chunk]
        write_to_readme top, bottom, dependencies
      [_] ->
        IO.puts "\n<--------------ExVersions Warning-------------->\n\n" <>
                "Missing <!-- ex_versions --> from README.md\n" <>
                "I need this to know where to put the versions!\n" <>
                "Place it wherever you'd like in the README.md\n\n" <>
                "<---------------------------------------------->\n"
    end
  end

  def write_to_readme top, bottom, dependencies do
    deps = sort dependencies
    versions = Enum.map deps, fn(dep) ->
                                {name, cmd_line} = dep
                                [cmd | args] = String.split cmd_line
                                {version, 0} = System.cmd(cmd, args)
                                "#### #{name}:\n" <>
                                "```bash\n$ #{cmd_line}\n\n#{version}```"
                              end

    updated = top <>
              "<!-- ex_versions -->\n" <>
              "## Dependency Versions:\n" <>
              Enum.join(versions, "\n") <>
              "\n<!-- ex_versions -->" <>
              bottom

    {:ok, new_file} = File.open "README.md", [:write]
    IO.binwrite new_file, updated
    File.close new_file
  end

  def sort deps do
    Enum.sort deps, &(dep_name(&1) < dep_name(&2))
  end

  def dep_name dep do
    {name, _} = dep
    String.capitalize name
  end
end
