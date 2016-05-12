ami = require 'ami'

-- Set required params
ami_config =
{
  host = "127.0.0.1";
  user_name = "admin";
  secret = "amp111";
  channel = "SIP/502"; -- Needs a value, even if you don't intend to initiate channels
  context = "lua-ami-test"; -- Needs a value
  priority = 1;
  timeout = 30000;
  secure = true;
  logger = nil;
}

-- Initate connection
ami_manager = ami.make_ami_manager(ami_config)

-- Specify a string with the name of an event, and the next one that appears will be returned as a table
function ami_output_next_event(event)
  local conn, err = ami_manager:get_connection()
  if not conn then
    return nil, err
  end

  local response, err = conn:get_reply()
  while response ~= nil and event ~= response.Event do
    response, err = conn:get_reply()
  end
  if err then
    return nil, err
  end
  return response
end

-- Test listening for the next "Dial" event
event = ami_output_all("Dial")
for k,v in pairs(event) do
  print(k,v)
end
