pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
function _init()
  maxcpu = 0
  curcpu = 0
  
  rle_8x8_heart = "8,0,9,2,2,2,1,16,1,6,3,4,5,2"
  rle_16x16_heart = "16,0,50,4,4,4,3,6,2,6,2,14,2,14,2,14,3,12,5,10,7,8,9,6,11,4,13,2"
  rle_64x64_music = "64,1,130,60,4,60,4,60,4,60,4,60,4,6,1,46,1,6,4,5,3,44,3,5,4,6,1,30,2,14,1,6,4,35,5,20,4,33,7,20,4,31,9,20,4,29,11,20,4,27,13,20,4,25,15,20,4,23,17,20,4,21,19,20,4,19,16,2,3,20,4,17,16,4,3,20,4,16,15,6,3,20,4,15,14,8,3,20,4,15,12,10,3,20,4,15,10,12,3,20,4,15,8,14,3,20,4,15,6,16,3,20,4,15,4,18,3,20,4,15,3,19,3,20,4,15,3,19,3,20,4,15,3,19,3,20,4,15,3,19,3,20,4,15,3,19,3,20,4,15,3,19,3,20,4,15,3,19,3,20,4,15,3,19,3,20,4,15,3,19,3,20,4,15,3,15,7,20,4,15,3,14,8,20,4,15,3,13,9,20,4,15,3,13,9,20,4,15,3,13,9,20,4,15,3,13,9,20,4,15,3,13,9,20,4,15,3,13,8,21,4,15,3,14,6,22,4,14,4,16,3,23,4,13,5,42,4,11,7,42,4,10,8,42,4,10,8,42,4,10,8,42,4,10,8,42,4,10,8,42,4,11,6,43,4,6,1,6,2,38,1,6,4,5,3,44,3,5,4,6,1,46,1,6,4,60,4,60,4,60,4,60,4,60,130"
end

function _update()

end

function _draw()
  cls(0)
  -- profiling
  print(curcpu.."-current cpu", 0, 0, 7)
  print(maxcpu.."-max cpu", 0, 6, 7)
  
  -- draw the shape
  -- 8x8 spr
  -- 0.0123 - running cpu
  -- 0.0132 - max cpu
  -- spr(1, 60, 60)
  
  -- 8x8 rle
  -- 0.0146 - running cpu
  -- 0.0154 - max cpu
  -- rle(rle_8x8_heart, 60, 60)
  
  -- 16x16 spr
  -- 0.0137 - running cpu
  -- 0.0146 - max cpu
  -- spr(2, 56, 56, 2, 2)
  
  -- 16x16 rle
  -- 0.0195 - running cpu
  -- 0.0203 - max cpu
  -- rle(rle_16x16_heart, 56, 56)

  -- 64x64 spr
  -- 0.0412 - running cpu
  -- 0.0421 - max cpu
  -- spr(4, 32, 32, 8, 8)

  -- 64x64 rle
  -- 0.0852 - running cpu
  -- 0.0861 - max cpu
  rle(rle_64x64_music, 32, 32)

  -- calculate last frame's profile state
  curcpu = stat(1)
  if (maxcpu < curcpu) then
    maxcpu = curcpu
  end
end

function rle(str, x, y)
  -- get number of columns
  local rledata = split(str)
  local pixelidx, cols, pixelcolor = 0, rledata[1], rledata[2] == 1 and 7 or 0

  for i=3,#rledata do
    -- don't need to draw transparent pixels
    if (pixelcolor == 0) then
      pixelidx += rledata[i]
    else
      -- draw the next set of rle pixels
      for j=0,rledata[i]-1 do
        pset(x+(pixelidx%cols),y+(pixelidx\cols),pixelcolor)
        pixelidx += 1
      end
    end

    -- flip the color parity
    pixelcolor = pixelcolor == 7 and 0 or 7
  end
end
__gfx__
00000000000000000000000000000000777777777777777777777777777777777777777777777777777777777777777700000000000000000000000000000000
00000000077007700000000000000000777777777777777777777777777777777777777777777777777777777777777700000000000000000000000000000000
00700700777777770000000000000000770000000000000000000000000000000000000000000000000000000000007700000000000000000000000000000000
00077000777777770077770000777700770000000000000000000000000000000000000000000000000000000000007700000000000000000000000000000000
00077000077777700777777007777770770000000000000000000000000000000000000000000000000000000000007700000000000000000000000000000000
00700700007777000777777777777770770000000000000000000000000000000000000000000000000000000000007700000000000000000000000000000000
00000000000770000777777777777770770000000000000000000000000000000000000000000000000000000000007700000000000000000000000000000000
00000000000000000777777777777770770000007000000000000000000000000000000000000000000000070000007700000000000000000000000000000000
00000000000000000077777777777700770000077700000000000000000000000000000000000000000000777000007700000000000000000000000000000000
00000000000000000007777777777000770000007000000000000000000000000000000770000000000000070000007700000000000000000000000000000000
00000000000000000000777777770000770000000000000000000000000000000000077777000000000000000000007700000000000000000000000000000000
00000000000000000000077777700000770000000000000000000000000000000007777777000000000000000000007700000000000000000000000000000000
00000000000000000000007777000000770000000000000000000000000000000777777777000000000000000000007700000000000000000000000000000000
00000000000000000000000770000000770000000000000000000000000000077777777777000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000000000000000000007777777777777000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000000000000000000777777777777777000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000000000000000077777777777777777000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000000000000007777777777777777777000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000000000000777777777777777700777000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000000000077777777777777770000777000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000000000777777777777777000000777000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000000007777777777777700000000777000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000000007777777777770000000000777000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000000007777777777000000000000777000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000000007777777700000000000000777000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000000007777770000000000000000777000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000000007777000000000000000000777000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000000007770000000000000000000777000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000000007770000000000000000000777000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000000007770000000000000000000777000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000000007770000000000000000000777000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000000007770000000000000000000777000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000000007770000000000000000000777000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000000007770000000000000000000777000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000000007770000000000000000000777000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000000007770000000000000000000777000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000000007770000000000000007777777000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000000007770000000000000077777777000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000000007770000000000000777777777000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000000007770000000000000777777777000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000000007770000000000000777777777000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000000007770000000000000777777777000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000000007770000000000000777777777000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000000007770000000000000777777770000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000000007770000000000000077777700000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000000077770000000000000000777000000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000000777770000000000000000000000000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000077777770000000000000000000000000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000777777770000000000000000000000000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000777777770000000000000000000000000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000777777770000000000000000000000000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000777777770000000000000000000000000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000777777770000000000000000000000000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000077777700000000000000000000000000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000007000000770000000000000000000000000000000000000070000007700000000000000000000000000000000
00000000000000000000000000000000770000077700000000000000000000000000000000000000000000777000007700000000000000000000000000000000
00000000000000000000000000000000770000007000000000000000000000000000000000000000000000070000007700000000000000000000000000000000
00000000000000000000000000000000770000000000000000000000000000000000000000000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000000000000000000000000000000000000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000000000000000000000000000000000000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000000000000000000000000000000000000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000770000000000000000000000000000000000000000000000000000000000007700000000000000000000000000000000
00000000000000000000000000000000777777777777777777777777777777777777777777777777777777777777777700000000000000000000000000000000
00000000000000000000000000000000777777777777777777777777777777777777777777777777777777777777777700000000000000000000000000000000