pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
-- fletch
-- a tool to export a spritesheet as an RLE encoded string

-- usage (run these from the PICO-8 console)
-- `load rle-encode.p8`
-- `import <spritesheet>.png`
-- `run`
-- now the spritesheet string is copied to your clipboard

-- https://gist.github.com/fletchmakes/0135b677b6c5468dfab33f4457a7c481

-- --------------------------------------------------------
-- calculates a base256 encoded string that represents a single RLE token - repetitions and color
-- 1 00 0000 0000 1 0000
-- one always-on bit, 10 bits to represent the number of repetitions, 1 always-on bit, 4 bits to represent color
-- see the gist for a more complete explanation

function calculateRleBitChars(numCounted, pixelColor)
  -- put an always-on bit on the right
  local rleBitString = 0x1 << 10

  -- add the 10 bits of repetitions
  rleBitString = rleBitString | numCounted

  -- add an always-on bit to the fifth position
  rleBitString = (rleBitString << 1) | 0x1
  
  -- add the color
  rleBitString = (rleBitString << 4) | pixelColor

  -- convert the bitstring into characters
  local char1, char2 = (rleBitString >>> 8) & 0xff, rleBitString & 0xff

  return chr(char1)..chr(char2)
end

function _init()
  cls(0)

  -- accumulator
  local result = ''

  -- state tracking
  local lastColor = sget(0, 0)
  local numCounted = 0
  
  -- loop from left to right, then top to bottom
  for y=0,127 do
    for x=0,127 do
      local curColor = sget(x, y)

      if (curColor == lastColor and numCounted < 1023) then
        numCounted += 1
      else
        result ..= calculateRleBitChars(numCounted, lastColor)
        numCounted = 1
      end

      lastColor = curColor
    end
  end

  -- finish the result string
  result ..= calculateRleBitChars(numCounted, lastColor)

  -- print the result to the clipboard
  printh(result, '@clip')

  -- visual feedback
  print('results sent to clipboard', 14, 61, 7)
  cursor(0, 122)
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000