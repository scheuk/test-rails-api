object @gfguser

attributes :id, :fbid, :username, :firstName, :lastName, :country, :location, :mischiffs, :spins

node :causes do |gfguser|
  gfguser.causeusers.map do |test|
    partial 'api/v1/gfgusers/_cause', object: test, root: false
  end
end

