ap_ip_config =  {
  ip = "192.168.56.1",
  netmask = "255.255.255.0",
  gateway = "192.168.56.1"
}
ap_wifi_config  = {
  ssid = "TRY_AGAIN1235",
  pwd = "12345678"
}
wifi.ap.config(ap_wifi_config)
wifi.ap.setip(ap_ip_config)
wifi.setmode(wifi.SOFTAP)
print(wifi.ap.getip())
srv = net.createServer(net.TCP, 30)
srv:listen(80,function(conn)
  conn:on("receive", function(conn, payload)
    postparse={string.find(payload,"submit=")}
    if postparse[2]~= nil then
      params = {}
      for k, v in string.gmatch(payload, "([%w_]*)=([%w_]+)") do
        params[k] = v
      end
      file.remove("connected")
      file.open("connected","w")
      file.writeline(params["ssid"])
      file.writeline(params["password"])
      file.close()
      print("restarting...")
      node.restart()
    else
      conn:send('HTTP/1.1 200 OK\n\n')
      conn:send('<!DOCTYPE HTML>\n')
      conn:send('<html>\n')
      conn:send('<head><meta  content="text/html; charset=utf-8">\n')
      conn:send('<title>WiFi Config</title></head>\n')
      conn:send('<body><h1>ESP8266 WiFi Config!</h1>\n')

      ap_ip = wifi.ap.getip()
      sta_ip = wifi.sta.getip()
      if ap_id ~= nil then
        conn:send('<h4>AP IP:'..wifi.ap.getip()..'</h4>\n')
      end
      if sta_ip ~= nil then
        conn:send('<h4>STA IP:'..wifi.sta.getip()..'</h4>\n')
      end
      conn:send('<form action="" method="POST">\n')
      conn:send('SSID:<input type="text" name="ssid" value="">\n')
      conn:send('PASSWORD:<input type="passsword" name="password" value="">\n')
      conn:send('<input type="submit" name="submit" value="Submit">\n')
      conn:send('</body></html>\n')
      conn:on("sent", function(conn)  conn:close() end)
    end
  end)
end)

