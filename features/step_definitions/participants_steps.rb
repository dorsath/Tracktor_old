When /^I create a new user$/ do
  @user = new_user
end

Then /^I should have a new user$/ do
  User.count.should == 1
  User.last.should == @user
end

Given /^I have a project$/ do
  @project = new_project
end

Given /^I have a user$/ do
  @user = new_user
end

When /^I assign the user to the project$/ do
  @user.assign_project(@project)
end

Then /^the user should be assigned to the project$/ do
  @project.users.first.should == @user
end