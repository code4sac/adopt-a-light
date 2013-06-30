class TempOwner < ActiveRecord::Base
  attr_accessible :address_1, :address_2, :city, :email, :name, :orgainization, :sms_number, :state, :voice_number, :zip
end
