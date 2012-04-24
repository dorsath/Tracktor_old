class Feature < ActiveRecord::Base
  belongs_to :project

  STATES = [:backlog, :started, :in_progress]

  def state
    STATES[state_id]
  end

  def state= new_state
    self.state_id = STATES.index(new_state)
  end

  def scenarios
    total = []
    n = 0

    body.split("\n").each do |line|
      if r = line =~ /Scenario: (.*)/

        if total[n].nil?
          total[n] =  {title: line[(r+10)..-1], body: []}
        else
          n += 1
        end
      else

        total[n][:body] << line.strip unless line.strip == ""
      end
    end
    total
  end
end
