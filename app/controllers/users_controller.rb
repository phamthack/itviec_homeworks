class UsersController < ApplicationController
  def unsubscribed
    response = user_service.unsubscribed(params)

    flash[:notice] = response.success? ? I18n.t('messages.unsubscribed.unsubscribe_successfully') : response.messages
  end

  private

  def user_service
    @user_service ||= UserService.new
  end
end
