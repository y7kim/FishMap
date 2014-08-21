class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :get_social

  protected

  	#returns the currently logged in user or nil if there isn't one
  	def current_user
  		return unless session[:user_id]
  		@current_user ||= User.find_by_id(session[:user_id])
  	end

    def get_social
      @social = {:twitter => "http://twitter.com/spaceship", :github =>  "http://github.com/y7kim" }
    end

  	#make current user available in templates as a helper
  	helper_method :current_user

  	#filter method to enforce a login requirement
  	#apply as a before_action on any controller you want to protect
  	def authenticate
  		logged_in? || access_denied
  	end

  	#predicate method to test for a logged in user
  	def logged_in?
  		current_user.is_a? User
  	end

  	#make logged_in? available in templates as a helper
  	helper_method :logged_in?

  	def access_denied
  		redirect_to login_path, notice: "Please log in to continue" and return false
  	end

    def make_hash(fish)
      Gmaps4rails.build_markers(fish) do |fish, marker|
        marker.lat fish.latitude
        marker.lng fish.longitude
        marker.infowindow render_to_string(:partial => "/fish/infowindow", :locals => { :object => fish})
        # .gsub(/\n/, '').gsub(/"/, '\"')
        marker.title fish.species
      end
    end
end
