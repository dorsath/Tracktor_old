When /^I (create|have) a feature named "([^"]*)"$/ do |action, feature_name|
  @feature = new_feature(name: feature_name, project: @project)
end

Then /^the project should have a feature named "([^"]*)"$/ do |feature_name|
  @project.features.count.should == 1
  @project.features.first.should == @feature
end

Then /^the feature should be in the backlog$/ do
  @feature.status.should == :backlog
end

When /^I add a scenario to the feature$/ do
  add_scenario_to_feature(@feature)
end

Then /^the feature should have a scenario$/ do
  @feature.reload
  @feature.scenarios.count.should == 1
  @feature.scenarios.first.should == "Login"
end
