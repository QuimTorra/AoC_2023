# =========== AOC d4 ===========
# =========== PART 1 ===========

defmodule AoC2023_d4 do
  def parseCard([], _, _), do: {[], []}

  def parseCard([head | tail], c_win, c_num) do
    c_win_n = if String.contains?(head, ":"), do: true, else: c_win
    c_num_n = if String.contains?(head, "|"), do: true, else: c_num

    {win, num} = parseCard(tail, c_win_n, c_num_n)

    if (not String.contains?(head, ":")) and (not String.contains?(head, "|")) do
      if c_num_n do
        {win, [head] ++ num}
      else
        if c_win_n do
          {[head] ++ win, num}
        else
          {win, num}
        end
      end
    else
      {win, num}
    end
  end

  def cardScore({win, [head | tail]}) do
    if tail == [] do
      if head in win, do: 1, else: 0
    else
      total = cardScore({win, tail})
      if head in win do
        if total == 0, do: 1, else: total+total
      else
        total
      end
    end
  end

  def readInput(sum) do
    line = IO.gets ""
    if line != "end" do
      {w, n} = AoC2023_d4.parseCard(String.split(line), false, false)
      points = AoC2023_d4.cardScore({w, n})
      readInput(sum+points)
    else
      IO.puts sum
    end
  end

end

AoC2023_d4.readInput(0)

# =========== PART 1 ===========

defmodule AoC2023_d4 do
  def parseCard([], _, _), do: {[], []}
  def parseCard([head | tail], c_win, c_num) do
    c_win_n = if String.contains?(head, ":"), do: true, else: c_win
    c_num_n = if String.contains?(head, "|"), do: true, else: c_num

    {win, num} = parseCard(tail, c_win_n, c_num_n)

    if (not String.contains?(head, ":")) and (not String.contains?(head, "|")) do
      if c_num_n do
        {win, [head] ++ num}
      else
        if c_win_n do
          {[head] ++ win, num}
        else
          {win, num}
        end
      end
    else
      {win, num}
    end
  end

  def matchings({win, [head | tail]}) do
    if tail == [] do
      if head in win, do: 1, else: 0
    else
      total = matchings({win, tail})
      if head in win do
        if total == 0, do: 1, else: total+1
      else
        total
      end
    end
  end

  def getCopies([head | tails], add) do
    m = AoC2023_d4.matchings(head)
    new_copies = if m > 0, do: AoC2023_d4.getCopies(tails, m-1), else: 0
    old_copies = if add > 0, do: AoC2023_d4.getCopies(tails, add-1), else: 0

    1+new_copies+old_copies
  end

  def getTotal([]) do
    0
  end
  def getTotal([head | tail]) do
    AoC2023_d4.getCopies([head]++tail, 0) + AoC2023_d4.getTotal(tail)
  end

  def readInput() do
    line = IO.gets ""
    if String.contains?(line, "end") do
      []
    else
      next = readInput()
      [AoC2023_d4.parseCard(String.split(line), false, false)] ++ next
    end
  end
end

cards = AoC2023_d4.readInput()
IO.puts AoC2023_d4.getTotal(cards)
