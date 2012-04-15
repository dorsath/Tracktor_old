module KnowsTheDomain
  def new_project
    Project.create!(name: "Gall & Gall")
  end

  def new_user
    User.create!(name: "Ronald")
  end
end

World(KnowsTheDomain)
