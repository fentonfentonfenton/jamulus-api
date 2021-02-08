require 'sinatra'
    get '/2' do
    `echo "POST /containers/jamulus/kill?signal=SIGUSR2 HTTP/1.0\r\n" | nc -U /tmp/docker.sock`
    end
    get '/1' do
        `echo "POST /containers/jamulus/kill?signal=SIGUSR1 HTTP/1.0\r\n" | nc -U /tmp/docker.sock`
      end