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
end

World(KnowsTheDomain)
