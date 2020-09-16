class HomeController < ApplicationController
  before_action :forbid_login_user, only: :index
  before_action :forbid_logout_user, except: :index
  
def index
  end
end
