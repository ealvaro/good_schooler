class ChangeEmailNotNullInUser < ActiveRecord::Migration
  def up
    #set a default for users with no email
    User.where(email: nil).each do |user|
      user.email = "#{user.name}@wyncode.co"
      user.save
    end
    change_column :users, :email, :string, null: false
  end
  def down
    change_column :users, :email, :string, null: true    
  end
end
