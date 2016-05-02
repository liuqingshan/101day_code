#!/usr/bin/env puma

environment 'production'
threads 2, 32 # minimum 2 threads, maximum 64 threads
workers 2

app_name = "www.ithulu.com"

application_path = "/home/work/www/#{app_name}"

directory "#{application_path}/current"

pidfile "#{application_path}/shared/tmp/pids/puma.pid"
state_path "#{application_path}/shared/tmp/sockets/puma.state"
stdout_redirect "#{application_path}/shared/log/puma.stdout.log", "#{application_path}/shared/log/puma.stderr.log"

bind "unix://#{application_path}/shared/tmp/sockets/puma.sock"
activate_control_app "unix://#{application_path}/shared/tmp/sockets/pumactl.sock"

daemonize true

preload_app!
