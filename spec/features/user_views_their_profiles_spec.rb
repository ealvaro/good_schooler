require 'rails_helper'
RSpec.feature "A user views their profile" , type: :feature do
 let!(:code_school) do
   CodeSchool.create( name: "Wyncode" )
 end
 let!(:user) do
   User.create( name: "Rube Goldberg" ,  email: "machine@example.com", code_school: code_school )
 end

 before do
   visit user_path(user)
 end

 it "displays their name" do
   expect(page).to have_content user.name
 end
 it "displays their email" do
   expect(page).to have_content user.email
 end
 it "displays their code school" do
   save_and_open_page
   expect(page).to have_content user.code_school.name
 end
end