function send_data()
  conn =  net.createConnection(net.TCP, 0)
  tmr.alarm(1, 1000, 1, function()
    conn:connect(8080, "192.168.1.3")
    _, temp, humdify,_, _ = dht.read(4)
    conn:send("{\"temp\":"..temp..",\"humdify\":"..humdify.."}")
    print("send")
  end)
end

function wait_sta_setup()
  if wifi.sta.status() == 5 then
    tmr.stop(0)
    send_data()
  else
    print(".")
  end
end

function set_sta_wifi(ssid, pwd)
  wifi.setmode(wifi.STATION)
  file.open("connected")
  ssid = string.gsub(file.readline(),"^%s*(.-)%s*$", "%1")
  password = string.gsub(file.readline(),"^%s*(.-)%s*$", "%1")
  print(ssid, password, "xxxx")
  wifi.sta.config(ssid, password)
  wifi.sta.connect()
  tmr.alarm(1, 100, 1, function() wait_sta_setup() end)
end

set_sta_wifi()

tmr.alarm(0, 500, 1, function()
  wait_sta_setup()
end)
