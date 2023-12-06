# =========== AOC d6 =========== 
# =========== PART 1 ===========

using Printf
function getPosibilities(a, b, c)
  local min = floor((-b + sqrt(b^2 - 4*a*c))/(2*a))+1
  local max = ceil((-b - sqrt(b^2 - 4*a*c)) / (2*a))
  return max-min
end

line = readline()
times = split(line, " ")
times = times[times .!= ""]
distances = split(readline(), " ")
distances = distances[distances .!= ""]

global total = 1
for i in 2:1:length(times)
  local t = parse(Int128, times[i])
  local d = parse(Int128, distances[i])
  global total *= getPosibilities(-1, t, -d)
end
@printf "%i\n" total

# =========== PART 2 ===========

using Printf
function getPosibilities(a, b, c)
  local min = floor((-b + sqrt(b^2 - 4*a*c))/(2*a))+1
  local max = ceil((-b - sqrt(b^2 - 4*a*c)) / (2*a))
  return max-min
end

line = readline()
times = split(line, " ")
times = times[times .!= ""]
times = join(times[2:1:length(times)], "")
distances = split(readline(), " ")
distances = distances[distances .!= ""]
distances = join(distances[2:1:length(distances)], "")

t = parse(Int128, times)
d = parse(Int128, distances)

global total = getPosibilities(-1, t, -d)
@printf "%i\n" total