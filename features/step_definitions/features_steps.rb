When /^I create a feature named "([^"]*)"$/ do |feature_name|
  @feature = new_feature(name: feature_name, project: @project)
end

Then /^the project should have a feature named "([^"]*)"$/ do |feature_name|
  @project.features.count.should == 1
  @project.features.first.should == @feature
end

Then /^the feature should be in the backlog$/ do
  @feature.status.should == :backlog
end

Given /^I have a feature$/ do
  @feature = new_feature(name: "User login", project: @project)
end

When /^I add a scenario to the feature$/ do
  @scenario = add_scenario(@feature)
end

Then /^the feature should have a scenario$/ do
  @feature.scenarios.count.should == 1
  @feature.scenarios.last.should == @scenario
end
