Rails.application.config.middleware.use OmniAuth::Builder do
    provider :slack, '3172151209105.3145637538775', '34ccf989f8f01306c4888787ea41bf40', scope: 'team:read,users:read,identify,bot'
  end