require 'spec_helper'

describe DevicesController do
  render_views
  
    
    
  describe "POST 'create'" do
    
    describe "success" do
      it "should create a device" do
        lambda do
          post :create, :ios_device => {:token => " "}
        end.should_not change(APN::Device, :count)
      end
    end
    
    describe "success" do
      it "should create a device" do
        lambda do
          post :create, :ios_device => {:token => "95bb8d98 626b1f15 8d7b03b9 3d7f47a4 f57baccd f73b8084 bfcd00f7 0ef2766d"}
        end.should change(APN::Device, :count).by(1)
      end
    end
    
  end
  
  
   
  
end
      