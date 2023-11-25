pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
-- fletch
-- tools to add an effective 4 more spritesheets to PICO-8

-- spritesheet 0 (part of the cartridge data)
-- spritesheet 1-4 (pasted RLE strings from rle-encode.p8)

local rle_spritesheet_one = '128,80,81,82,83,84,85,86,87,88,89,8a,8b,8c,8d,8e,8f,80,81,82,83,84,85,86,87,88,89,8a,8b,8c,8d,8e,8f,20,17,20,17,20,81,82,83,84,85,86,87,88,89,8a,8b,8c,8d,8e,8f,30,27,30,81,82,83,84,85,86,87,88,89,8a,8b,8c,8d,8e,8f,30,27,30,81,82,83,84,85,86,87,88,89,8a,8b,8c,8d,8e,8f,20,17,20,17,20,81,82,83,84,85,86,87,88,89,8a,8b,8c,8d,8e,8f,80,81,82,83,84,85,86,87,88,89,8a,8b,8c,8d,8e,8f,80,81,82,83,84,85,86,87,88,89,8a,8b,8c,8d,8e,8f,153600'
local rle_spritesheet_two = ''
local rle_spritesheet_three = ''
local rle_spritesheet_four = ''

-- TODO: function to load sprite from arbitrary spritesheet

function load_spritesheets()
  -- spritesheet one: 0x8000-0x9fff
  if (#rle_spritesheet_one > 0) then
    read_into_spritesheet_memory(rle_spritesheet_one)
    memcpy(0x8000, 0x0000, 8192)
  end

  -- spritesheet two: 0xa000-0xbfff
  if (#rle_spritesheet_two > 0) then
    read_into_spritesheet_memory(rle_spritesheet_two)
    memcpy(0xa000, 0x0000, 8192)
  end

  -- spritesheet three: 0xc000-0xdfff
  if (#rle_spritesheet_three > 0) then
    read_into_spritesheet_memory(rle_spritesheet_three)
    memcpy(0xc000, 0x0000, 8192)
  end

  -- spritesheet four: 0xe000-0xffff
  if (#rle_spritesheet_four > 0) then
    read_into_spritesheet_memory(rle_spritesheet_four)
    memcpy(0xe000, 0x0000, 8192)
  end

  -- spritesheet 0: 0x0000-0x1fff
  reload()
end

function read_into_spritesheet_memory(rle_string)
  -- get number of columns
  local rledata = split(rle_string, ",", false)
  local pixelidx, cols = 0, rledata[1]

  for i=2,#rledata do
    local token = rledata[i]
    local pixelcolor = tonum(token[#token], 0x1)
    local num = sub(token, 1, #token-1)

    -- draw the next set of rle pixels
    for j=0,num-1 do
      sset(pixelidx%cols,pixelidx\cols,pixelcolor)
      pixelidx += 1
    end
  end
end

function _init()
  -- load spritesheets
  load_spritesheets()

  -- copy data to active spritesheet
  memcpy(0x0000, 0xa000, 8192)
end

function _draw()
  cls(0)
  spr(3, 60, 60)
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
