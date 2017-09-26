class RandomController < ApplicationController
  protect_from_forgery except: :service_worker
end