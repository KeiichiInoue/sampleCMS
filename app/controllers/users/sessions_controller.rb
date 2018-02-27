class Users::SessionsController < Devise::SessionsController

  before_action :authenticate_user!, only: [:destroy]
  protect_from_forgery :except => [:destroy]
  layout nil

  def new
  	@user = User.new
  	render layout: 'user_sign_in'
  end

  def create
  	# @user = User.authenticate_by_email_password(
   #      user_params[:email],
   #      user_params[:password]
   #    ) if user_params.present?
    @user = warden.authenticate(scope: :user)
  	if @user.present?
      sign_in(User, @user)
      redirect_to registrants_path
    else
      @user = User.new
      set_flash_message(:alert, :invalid)
      render template: sign_in_form_template, status: :unauthorized, layout: 'sign_in'
    end
  end

  def destroy
  	super
  end

  #-------------------------------------------------------------------------

  protected

  def sign_in_form_template
    "users/sessions/new"
  end

  def after_sign_out_path_for(resource)
    sign_in_path
  end

  #-------------------------------------------------------------------------
end
