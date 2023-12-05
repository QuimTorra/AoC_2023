// =========== AOC d1 =========== 
// =========== PART 1 ===========

import std.stdio;
import std.string;
import std.array;
import std.conv;
import std.algorithm: canFind;

void main()
{
  long[] seeds = [];
  bool[] converted = [];
  string line = strip(stdin.readln());
  string[] l = line.split(" ");
  for (int i = 1; i < l.length; i++) {
    seeds ~= (std.conv.to!long(l[i]));
    converted ~= (false);
  }
  converted[] = false;
  
  line = strip(stdin.readln()); // discard empty line
  line = strip(stdin.readln());
  while(line != "end") {
    l = line.split(" ");
    if (l.length == 0) {
      converted[] = false;
      line = strip(stdin.readln());
      continue;
    }
    if (l.canFind("map:")) {
        line = strip(stdin.readln());
        continue;
    }
    
    long dest = std.conv.to!long(l[0]);
    long orig = std.conv.to!long(l[1]);
    long range = std.conv.to!long(l[2]);
    
    for (int i = 0; i < seeds.length; i++) {
      if (converted[i]) continue;
      long diff = seeds[i]-orig;
      if (diff >= 0 && diff < range) {
        seeds[i] = dest + diff;
        converted[i] = true;
      }
    }
    
    line = strip(stdin.readln());
  }
  
  long min = seeds[0];
  for (int i = 1; i < seeds.length; i++) {
    if (seeds[i] < min) min = seeds[i];
  }
  writeln(min);
}

// =========== PART 2 =========== UNFINISHED!!

import std.stdio;
import std.string;
import std.array;
import std.conv;
import std.algorithm;
import std.algorithm.iteration;

void main()
{
  long[] seeds = [];
  long[] converted = [];
  string line = strip(stdin.readln());
  string[] l = line.split(" ");
  for (int i = 1; i < l.length; i++) {
    seeds ~= (std.conv.to!long(l[i]));
  }
  
  line = strip(stdin.readln()); // discard empty line
  line = strip(stdin.readln());
  while(line != "end") {
    l = line.split(" ");
    if (l.length == 0) {
      seeds ~= converted;
      converted = [];
      line = strip(stdin.readln());
      seeds = seeds.filter!(a => a > 0).array;
      continue;
    }
    if (l.canFind("map:")) {
        line = strip(stdin.readln());
        continue;
    }
    
    long dest = std.conv.to!long(l[0]);
    long orig = std.conv.to!long(l[1]);
    long range = std.conv.to!long(l[2])-1;
    
    
    for (int i = 0; i < seeds.length; i++) {
      if (seeds[i] == -1) {
        i+=1;
        continue;
      }
      long min = seeds[i];
      long max = seeds[i]+seeds[i+1]-1;
      
      long mindiff = min-orig;
      long maxdiff = max-orig;
      long topmindiff = min-(orig+range);
      long topmaxdiff = max-(orig+range);
      
      if (mindiff >= 0 && topmaxdiff <= 0) {
        // full range
        converted ~= [dest+mindiff, seeds[i+1]];
        seeds[i] = -1;
        seeds[i+1] = -1;
      } else if (mindiff >= 0 && topmindiff <= 0 &&  topmaxdiff > 0) {
        // bottom part range
        converted ~= [dest+mindiff, topmaxdiff];
        seeds[i] = -1;
        seeds[i+1] = -1;
        seeds ~= [(orig+range), topmaxdiff];
      } else if (mindiff < 0 && maxdiff >= 0 && topmaxdiff <= 0) {
        // top part range
        converted ~= [dest, maxdiff];
        seeds[i] = -1;
        seeds[i+1] = -1;
        seeds ~= [min, orig-min];
      } else if (mindiff < 0 && topmaxdiff > 0) {
        // middle part range
        converted ~= [dest, range];
        seeds[i] = -1;
        seeds[i+1] = -1;
        seeds ~= [min, mindiff];
        seeds ~= [(orig+range), topmaxdiff];
      }
      
      i+=1;
    }
    
    line = strip(stdin.readln());
  }
  
  seeds ~= converted;
  converted = [];
  
  long min = seeds[0];
  for (int i = 0; i < seeds.length; i+=2) {
    if (seeds[i] < -1) continue;
    if (min == -1) min = seeds[i];
    if (seeds[i] < min) min = seeds[i];
  }
  writeln(min);
}