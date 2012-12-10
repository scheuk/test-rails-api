object @gfguser

attributes :id, :username, :firstName, :lastName, :country, :location, :mischiffs

node :causes do |gfguser|
  gfguser.causeusers.map do |test|
    partial 'api/v1/gfgusers/_cause', object: test, root: false
  end
end

