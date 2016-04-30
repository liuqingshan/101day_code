send
gpio.mode(1, gpio.INPUT)
flag = gpio.read(1)
tmr.delay(5000)
if gpio.read(1) == 0 and flag == 0 then
    file.remove("connected")
end
if file.open("connected","r") == nil then
  dofile("connect.lua")
else
  dofile("connected.lua")
end
