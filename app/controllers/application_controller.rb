class ApplicationController < ActionController::Base
  def after_sign_in_path_for(user)
    # your path goes here
    publications_path(user) # as an example
  end
end
