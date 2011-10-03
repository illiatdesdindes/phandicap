class AddAdminUsers < ActiveRecord::Migration
  def self.up
    AdminUser.create!(:email => 'printemps.handicap2012@gmail.com', :password => '11mai2012', :password_confirmation => '11mai2012')
    AdminUser.create!(:email => 'siegenational@ami-handicap.org', :password => '19aout36', :password_confirmation => '19aout36')
    AdminUser.create!(:email => 'amicd71@gmail.com', :password => '71ami1979', :password_confirmation => '71ami1979')
  end

  def self.down
  end
end
