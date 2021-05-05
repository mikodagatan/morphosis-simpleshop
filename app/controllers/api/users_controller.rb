class Api::UsersController < ApiController
  def index
    users = User.all
    authorize users, :index?
    render json: UserBlueprint.render(users)
  end
end