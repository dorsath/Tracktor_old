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
  assign_user_to_project(@user, @project)
end

Then /^the user should be assigned to the project$/ do
  @project.users.first.should == @user
end

Given /^the user is assigned to the project$/ do
  #simple alias to make documentation more readable
  step "I assign the user to the project"
end

Then /^the user should be only once in the project users list$/ do
  @project.users.count == 1
end

When /^I remove the user from the project$/ do
  remove_user_from_project(@user, @project)
end

Then /^the user should no longer be assigned to the project$/ do
  @user.reload.projects.should_not include @project
end
