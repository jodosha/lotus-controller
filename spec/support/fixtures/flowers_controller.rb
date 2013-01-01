class FlowersController < Lotus::Controller
  def index
  end

  def set_body
    response.body = ['Lotus']
  end

  def set_status
    response.status = 403
  end

  def set_header
    response.header['Content-Type'] = 'application/json'
  end
end
