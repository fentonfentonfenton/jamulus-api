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
	files.each do |file|
		resp = client.put_object({
	  			body: IO.read(file),
	  			bucket: "backupsmeyoueveryone", 
	  			key: file.delete_prefix("/tmp/"), 
				})
		File.delete(file)
	end
	resp = client.list_objects_v2({
	  bucket: "backupsmeyoueveryone", 
	  max_keys: 25, 
	})
	"Hello I tried to upload #{files}! Now this is what is on s3: #{resp.contents}" 

end
