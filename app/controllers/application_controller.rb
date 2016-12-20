class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  def current_user
   if session[:user_id]
     @currrent_user ||= User.find(session[:user_id])
   else
     nil
   end
  end
  helper_method :user_signed_in?
  def user_signed_in?
    if current_user
      return true
    else
      return false
    end
  end



  before_filter :choose_lang
  def choose_lang
    # User wants to switch langage
    if params[:lang]
      session[:lang] = params[:lang].to_sym
      I18n.locale = params[:lang].to_sym
    elsif session[:lang]
      I18n.locale = session[:lang].to_sym
    end
  end

end
