require 'spec_helper'

describe DevicesController do
  render_views
  
    
    
  describe "POST 'create'" do
    
    describe "failure" do
      before(:each) do
        @attr = {:token => ""} 
      end
      it "should not create an apn_device" do
        lambda do
          post :create, :apn_device => @attr
        end.should_not change(APN::Device, :count)
      end
    end
    
    describe "success" do
      before(:each) do
        @attr = {:token => "95bb8d98 626b1f15 8d7b03b9 3d7f47a4 f57baccd f73b8084 bfcd00f7 0ef2766d"} 
      end
      it "should create a device" do
        lambda do
          post :create, :apn_device => @attr
        end.should change(APN::Device, :count).by(1)
      end
    end
    
  end
  
  
   
  
end
      