require 'aws-sdk'
require 'mysql2'


begin
	client = Mysql2::Client.new(:host => "ocelli-server.cximaxs7x3ws.us-west-2.rds.amazonaws.com", :username => "xxx",:password => "xxx", :database => "xxx")

    puts client.server_info
    rs = client.query 'SELECT VERSION()'

    rs.each do |row|
	  puts row



num = 1
AWS.config(access_key_id: 'xxx', secret_access_key: 'xxx', region: 'us-west-2')
ec2 = AWS::EC2.new
puts "started: " + Time.now.to_s
  client.query "DELETE FROM environment_node"
  client.query "DELETE FROM node_artifact"
    client.query "DELETE FROM node"
ec2.instances.with_tag("aws:autoscaling:groupName","App Server Group").each do |instance|

  client.query "INSERT INTO `node` (`version`, `access_key_id`, `node_description`, `node_host_name`, `node_name`) VALUES (1, 3, 'App Server #{num}', '"+instance.ip_address+"', 'Server #{num}')"
  nodeid = client.last_id
  client.query "INSERT INTO `node_artifact` (`node_artifacts_id`, `artifact_id`) VALUES (#{nodeid}, 1)"
	num +=1
end
 
puts "finished: " + Time.now.to_s
end
    
rescue Mysql2::Error => e
    puts e.errno
    puts e.error
    
ensure
    client.close if client
end
