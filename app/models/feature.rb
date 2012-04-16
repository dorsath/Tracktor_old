class Feature < ActiveRecord::Base
  belongs_to :project

  STATUS = [:backlog, :started]

  def status
    STATUS[status_id]
  end

  def scenarios
    body.scan(/Scenario: (.*)/).flatten
  end
end
