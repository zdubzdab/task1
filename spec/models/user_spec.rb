require 'spec_helper'

describe User do
  
  before(:each) do
    @user = FactoryGirl.create(:user)
  end
  
  describe 'full_name' do
    it 'should return first name followed by last name' do 
      @user.full_name.should eq("#{@user.first_name} #{@user.last_name}")
    end
    
    it 'should not return last name followed by first name' do
      @user.full_name.should_not eq("#{@user.last_name} #{@user.first_name}")
    end
  end
end