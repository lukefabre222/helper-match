module SessionsHelper
  def log_in(staff)
    session[:staff_id] = staff.id
  end

  def current_staff
    if session[:staff_id]
      @current_staff ||= Staff.find_by(id: session[:staff_id])
    end
  end

  def logged_in?
    !current_staff.nil?
  end

  def log_out
    session.delete(:staff_id)
    @current_staff = nil
  end

  # 記憶しているURL (もしくはデフォルト値) にリダイレクトする
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # アクセスしようとしたURLを記憶しておく
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
