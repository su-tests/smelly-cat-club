# frozen_string_literal: true
class ClubController < ApplicationController
  before_action :authenticate_user!

  def catty; end
end
