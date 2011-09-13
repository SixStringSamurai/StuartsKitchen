class IosDevicesController < ApplicationController
  respond_to :html, :xml, :json
  
  before_filter :signed_in?, :except => :create
  

  def index
    @ios_devices = APN::Device.all
    respond_with(@ios_devices)
  end
  
  
  def show
    @ios_device = APN::Device.find(params[:id])
    respond_with(@ios_device)
  end
  
  
  def create
    @ios_device = APN::Device.create(:token => params[:ios_device][:token], :device_type => params[:ios_device][:device_type])
    @ios_device.save
    #add device automatically to the group labeled "everyone"
    @ios_device.devicegroupings.create(:group_id=>Group.find_by_name("everyone").id)
#    unless @ios_device.save 
#      raise ApiError::InvalidDeviceParameters, @ios_device.errors.full_messages.join(",")
#    end
    respond_with(@ios_device) do |format|  #this ensures no response to creating a device
      format.html { render :text => " " }
      format.xml { render :text => " " }
      format.json { render :text => " " }
    end  
  end

    
  def edit
    @ios_device = APN::Device.find(params[:id])
    respond_with(@ios_device)
  end


  def destroy
    @ios_device = APN::Device.find(params[:id])
    @ios_device.destroy
    respond_with(@ios_device) do |format|
      format.html { redirect_to(ios_devices_url) }
      format.json { head :ok }
    end
  end
  
end
