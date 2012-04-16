require 'spec_helper'

describe Feature do
  it "should be able to find all the scenario's in a feature" do
    subject.body = """
    Scenario: Create blog post
      Given I am on the homepage
      When I create a blog post
      Then visitors should be able to see it
    """
    subject.scenarios.count.should == 1
    subject.scenarios.first[:title].should == "Create blog post"
    subject.scenarios.first[:body].count.should == 3
  end
end
