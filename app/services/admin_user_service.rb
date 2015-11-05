class AdminUserService

  def initialize(user, roles = {})
    @user = user
    @roles = roles
  end

  def create_admin_user
    user = @user.update(@roles)
    if user
      Rails.logger.info 'User has been updated'
    else
      Rails.logger.warn 'User failed to update'
    end
  end

end