When /^I change the state of a feature$/ do
  set_state @feature, :in_progress
end

Then /^the feature should have a different state$/ do
  @feature.reload.state.should == :in_progress
end

