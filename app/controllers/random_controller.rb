class RandomController < ApplicationController
  protect_from_forgery except: :service_worker

  def random
    sleep(1)
  end
end