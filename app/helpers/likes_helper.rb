module LikesHelper

  def follow_count(staff_id)
    Like.where(staff_id: staff_id).count
  end

  def followed_count(staff_id)
    Like.where(follow_id: staff_id).count
  end

  def already_like?(staff_id, follow_id)
    Like.where(staff_id: staff_id).where(follow_id: follow_id).present?
  end
end
