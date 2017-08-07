class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['name'], password: ENV['password']
  def show
  end

  def authentication_request(controller, realm)
   super
   controller.response_body = "test123.\n"
  end

end
