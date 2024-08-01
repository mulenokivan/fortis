module CvsHelper
  def author?
    current_user.present? && current_user.id == @cv.user_id
  end
end
