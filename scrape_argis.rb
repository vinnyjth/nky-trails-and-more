require 'net/http'
require 'net/https'
require 'json'

def send_request(offset)
  uri = URI("https://linkgis.org/arcgisweb/rest/services/CC_KC_PCTheme/MapServer/7/query?where=1%3D1&outFields=*&f=json&resultOffset=#{offset}")

  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_PEER

  req =  Net::HTTP::Get.new(uri)
  req.add_field "Content-Type", "application/json; charset=utf-8"
  # You probs will need your own cookie
  req.add_field "Cookie", "AGS_ROLES=\"419jqfa+uOZgYod4xPOQ8Q==\""

  # Fetch Request
  res = http.request(req)
  puts "Response HTTP Status Code: #{res.code}"
  File.open("./kmz/#{offset}.json",'w') do |f|
    f.write res.body
  end  
rescue StandardError => e
  puts "HTTP Request failed (#{e.message})"
end

offset = 0
# ooof. we should query for this number.
while offset < 36000 do 
  send_request(offset)
  offset += 1000
end