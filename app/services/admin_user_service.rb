class AdminUserService

  def initialize(user)
    @user = user
  end

  def create_admin_user
    user = @user.update(admin: true)
    if user
      Rails.logger.info 'User has been updated'
    else
      Rails.logger.warn 'User failed to update'
    end
  end

end