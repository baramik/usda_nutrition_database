namespace :admin do
  desc 'Creates admin user'
  task create_admin_user: :environment do
    credentials = {
        email: 'admin@admin.com',
        password: '123123123',
        password_confirmation: '123123123',
    }

    user = User.find_by(email: credentials[:email])

    if user.present?
      user
    else
      user = User.create(credentials)
    end

    admin_service = AdminUserService.new(user)
    admin_service.create_admin_user
  end
end