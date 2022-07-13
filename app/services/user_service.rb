class UserService < BaseService
  def unsubscribed(params)
    user = User.find_by_id(params[:id])
    return error({ messages: I18n.t('messages.unsubscribed.user_not_exist') }) unless user

    return error({ messages: I18n.t('messages.unsubscribed.already_unsubscribed') }) if user.unsubscribed?

    expire_time = Time.at(params[:expire_time].to_i).to_datetime

    return error({ messages: I18n.t('messages.unsubscribed.link_expired') }) if expire_time < 3.days.ago

    user.unsubscribed!
    success
  end
end
