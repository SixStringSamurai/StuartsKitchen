class DevicesController < ApplicationController
  respond_to :html, :xml, :json

  def index
    @ios_devices = APN::Device.all
    respond_with(@ios_devices)
  end
  
  
  def show
    @ios_device = APN::Device.find(params[:id])
    respond_with(@ios_device)
  end
  
  
  def create
    @ios_device = APN::Device.create(:token => params[:ios_device])    
    unless @ios_device.save 
      raise ApiError::InvalidDeviceParameters, @ios_device.errors.full_messages.join(",")
    end
    respond_with(@ios_device)
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
