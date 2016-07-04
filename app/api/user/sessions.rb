class User::Sessions < Grape::API
  desc "Create a session"
  params do
    requires :email, type: String, desc: "your email"
    requires :password, type: String, desc: "your password"
  end
  post do
    user = User.find_by(email: params[:email])
    if user.present? && user.valid_password?(params[:password])
      user
    else
      error! "422, Invalid email or password", 422
    end
  end
end
