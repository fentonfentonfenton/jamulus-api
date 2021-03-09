require 'sinatra'
require 'aws-sdk-s3'

get '/toggleRec' do
    `echo "POST /containers/jamulus/kill?signal=SIGUSR2 HTTP/1.0\r\n" | nc -U /tmp/docker.sock`
end

get '/enableRec' do
    `echo "POST /containers/jamulus/kill?signal=SIGUSR1 HTTP/1.0\r\n" | nc -U /tmp/docker.sock`
end

get '/sync' do
    	client = Aws::S3::Client.new(
  		region: 'us-east-1',
  		credentials: Aws::InstanceProfileCredentials.new
		)

	files = Dir.glob("/tmp/*.wav")
	pp files
	files.each do |file|
		resp = client.put_object({
  			body: file, 
  			bucket: "examplebucket", 
  			key: IO.read(file), 
			})
		File.delete(file)
	end
end


