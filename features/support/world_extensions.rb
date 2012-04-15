module KnowsTheDomain
  def new_project
    Project.create!(name: "Gall & Gall")
  end
end

World(KnowsTheDomain)
