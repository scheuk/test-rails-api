#object @cuser

attributes :_id, :score, :mirrorShield, :gfguser_id

node :username do |cuser|
  Gfguser.find(cuser.gfguser_id).username
end

node :location do |cuser|
  Gfguser.find(cuser.gfguser_id).location
end


#glue @gfguser do
#  attributes :username, :location
#end
