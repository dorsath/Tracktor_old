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
