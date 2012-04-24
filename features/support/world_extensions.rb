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

  def assign_user_to_project(user, project)
    project.assign_user(user)
  end

  def remove_user_from_project(user, project)
    project.remove_user(user)
  end

  def add_scenario_to_feature(feature)
    feature.body += """
    Scenario: Login
      Given I am a registered user
      When I log in with the correct details
      Then I should be logged in
    """
    feature.save
  end

  def set_state feature, state
    feature.state = state 
    feature.save
  end

end

module KnowsTheUserInterface
  def new_user
    visit new_user_path
    fill_in(:user_name, with: "Ronald")
    click_button("Create User")
    User.last
  end

  def new_project
    visit new_project_path
    fill_in(:project_name, with: "Gall & Gall")
    click_button("Create Project")

    Project.last
  end

  def assign_user_to_project(user, project)
    visit project_path(project)
    click_link("Add User")
    select(user.name, from: "project_users")
    click_button("Add User")
  end

  def remove_user_from_project(user, project)
    visit project_path(project)
    click_link('Users')
    within(".user_#{user.id}") do
      click_link('X')
    end
  end

  def new_feature(data)
    visit project_path(data[:project])
    click_link("New Feature")
    fill_in(:feature_name, with: data[:name])
    click_button("Save")

    Feature.last
  end

  def add_scenario_to_feature(feature)
    visit project_path(feature.project)
    click_link(feature.name)
    fill_in("feature_body", with:
      """Scenario: Login
        Given I am a registered user
        When I log in with the correct details
        Then I should be logged in
      """ )
    click_button("Save")
  end

  def set_state feature, state
    visit edit_project_feature_path(@project, feature.id)
    within(".state_#{state}") do
      choose ("feature_state_id_#{Feature::STATES.index(state)}")
    end
    click_button("Save")
  end
end

if ENV["UI"]
  World(KnowsTheUserInterface)
else
  World(KnowsTheDomain)
end


