module KnowsTheDomain
  def new_project
    @project ||= Project.create!(name: "Gall & Gall")
  end

  def new_user
    @user ||= User.create!(name: "Ronald")
  end

  def new_feature(data)
    Feature.create!(data)
  end

  def add_scenario(feature)
    scenario = Scenario.create!(
      description: "User logs in with correct details",
      body: """
        Given I am registered
        When I fill in my details
        Then I should be logged in
      """)
    feature.scenarios << scenario

    scenario
  end
end

World(KnowsTheDomain)
