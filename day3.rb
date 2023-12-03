# =========== AOC d3 =========== 
# =========== PART 1 ===========

def isNum(str)
  !!Integer(str)
rescue ArgumentError, TypeError
  false
end

def isSymbol(str)
  !isNum(str) && str != "."
end

def getNeighborNums(r, c, machine)
  nums = []
  for i in r-1..r+1
    if i < 0 or i >= machine.length then next end
    gotNum = false
    for j in c-1..c+1
      if j < 0 || j >= machine[i].length then next end
      if isNum(machine[i][j])
        if gotNum then next end
        gotNum = true
        n = machine[i][j]
        for p in (j-1).downto(0)
          if isNum(machine[i][p])
            n = machine[i][p] + n
          else 
            break
          end
        end
        for p in (j+1).upto(machine[i].length)
          if isNum(machine[i][p])
            n = n + machine[i][p]
          else 
            break
          end
        end
        nums.append(Integer(n))
      else
        gotNum = false
      end
    end
  end
  return nums
end

machine = []
line = gets.chomp
total = 0
while line != "end" do
  machine.append(line)
  line = gets.chomp
end

sNum = ""
hasSymbol = false
for row, i in machine.each.with_index(0) do
  for j in 0..row.length-1 do
    ch = row[j]
    if isSymbol(ch)
      neighbors = getNeighborNums(i, j, machine)
      total += neighbors.sum
    end
  end
end

puts total

# =========== PART 2 ===========

def isNum(str)
  !!Integer(str)
rescue ArgumentError, TypeError
  false
end

def isSymbol(str)
  !isNum(str) && str != "."
end

def getNeighborNums(r, c, machine)
  nums = []
  for i in r-1..r+1
    if i < 0 or i >= machine.length then next end
    gotNum = false
    for j in c-1..c+1
      if j < 0 || j >= machine[i].length then next end
      if isNum(machine[i][j])
        if gotNum then next end
        gotNum = true
        n = machine[i][j]
        for p in (j-1).downto(0)
          if isNum(machine[i][p])
            n = machine[i][p] + n
          else 
            break
          end
        end
        for p in (j+1).upto(machine[i].length)
          if isNum(machine[i][p])
            n = n + machine[i][p]
          else 
            break
          end
        end
        nums.append(Integer(n))
      else
        gotNum = false
      end
    end
  end
  return nums
end

machine = []
line = gets.chomp
total = 0
while line != "end" do
  machine.append(line)
  line = gets.chomp
end

sNum = ""
hasSymbol = false
for row, i in machine.each.with_index(0) do
  for j in 0..row.length-1 do
    ch = row[j]
    if isSymbol(ch)
      neighbors = getNeighborNums(i, j, machine)
      if ch == "*" && neighbors.length == 2
        prod = 1
        neighbors.each { |n| prod *= n }
        total += prod
      end
    end
  end
end

puts total
