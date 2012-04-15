When /^I create a new project$/ do
  new_project
end

Then /^I should have a new project$/ do
  Project.count.should == 1
end
