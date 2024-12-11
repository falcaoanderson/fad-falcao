
-- Problem: https://adventofcode.com/2020/day/4

namespace AoC2020D4

def content : String := include_str "../../data/AoC2020_day4.txt"

#eval content

def input : List (String) :=
  content.splitOn "\n" |>.map String.trim

#eval input

def processedInput : List (String) :=
  input.foldr (λ x y => x.splitOn ++ y) [] |>.map (λ x => (x.splitOn ":").headD "@")

#eval processedInput

-- Part 1

def solve₁ : List (String) → Nat → Nat
  | [], q => if q = 7 then 1 else 0
  | ""::xs, q => if q = 7 then 1 + solve₁ xs 0 else solve₁ xs 0
  | x::xs, q => if x ≠ "cid" then solve₁ xs (q+1) else solve₁ xs q

#eval solve₁ processedInput 0

-- Part 2

end AoC2020D4
