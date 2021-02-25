require 'sinatra'
require 'aws-sdk-s3'
require 'aws-sdk-sts'

get '/toggleRec' do
    `echo "POST /containers/jamulus/kill?signal=SIGUSR2 HTTP/1.0\r\n" | nc -U /tmp/docker.sock`
end

get '/enableRec' do
    `echo "POST /containers/jamulus/kill?signal=SIGUSR1 HTTP/1.0\r\n" | nc -U /tmp/docker.sock`
end

get '/sync' do
    client = Aws::STS::Client.new(
  		region: 'us-east-1',
  		Aws::InstanceProfileCredentials.new
  		)
    client = Aws::S3::Client.new(
  		region: 'us-east-1',
  		credentials: Aws::InstanceProfileCredentials.new
		)
    resp = client.put_object({
  		body: "filetoupload", 
  		bucket: "examplebucket", 
  		key: "exampleobject", 
		})
end


