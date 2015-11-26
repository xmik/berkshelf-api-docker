log_level                :info
log_location             STDOUT
node_name                'admin'
client_key               "#{Dir.pwd}/test/test_admin.pem"
chef_server_url          'https://chef.example.com/organizations/testorg'
syntax_check_cache_path  "#{Dir.pwd}/test/syntax_check_cache"

cookbook_email           = 'admin@example.com'
cookbook_copyright       = 'TestOrg'
ssl_verify_mode          :verify_none
