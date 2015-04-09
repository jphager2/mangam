module ApplicationHelper
  include FoundationRailsHelper::FlashHelper

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def clean_params
    params.dup.delete_if do |param, value| 
      %w{ action controller locale }.include?(param)
    end
  end
end
