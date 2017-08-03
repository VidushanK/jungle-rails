class RegisterController < ApplicationController
  def new
    @register = User.new
  end

  def create
    user = User.new(register_params)

    if user.save
      redirect_to root_path, notice: 'User created'
    else
      render :new
    end
  end
  private
    def register_params
      params.require(:register).permit(
      :name,
      :email,
      :password
      )
    end
end
