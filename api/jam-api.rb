require 'sinatra'
require 'aws-sdk-s3'
require 'aws-sdk-sts'

    get '/2' do
    `echo "POST /containers/jamulus/kill?signal=SIGUSR2 HTTP/1.0\r\n" | nc -U /tmp/docker.sock`
    end
    get '/1' do
        `echo "POST /containers/jamulus/kill?signal=SIGUSR1 HTTP/1.0\r\n" | nc -U /tmp/docker.sock`
      end
   get '/sync' do
       `do a thing to get the stuff`
       credentials = aws.sts.client.get_token 
        aws.s3.client.sync {credentials} file : bucket
      end
