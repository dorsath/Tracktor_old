class Feature < ActiveRecord::Base
  belongs_to :project
  has_many :scenarios

  STATUS = [:backlog, :started]

  def status
    STATUS[status_id]
  end
end
