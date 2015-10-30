class Service::SolanoCI < Service::HttpPost
  string :token
  string :override_url

  white_list :override_url

  url "https://www.solanolabs.com"
  logo_url "https://www.solanolabs.com/favicon.ico"

  maintained_by :github => 'solanolabs', :twitter => '@solanolabs'
  supported_by  :web => 'https://support.solanolabs.com/', :email => 'support@solanolabs.com'

  default_events Service::ALL_EVENTS

  def receive_event
    token = required_config_value('token')
    override_url = data['override_url']

    url_base = override_url.present? ? override_url : "https://hooks.solanolabs.com:443/1/github"
    solano_ci_url = "#{url_base}/#{token}" 
    deliver solano_ci_url
  end
end

