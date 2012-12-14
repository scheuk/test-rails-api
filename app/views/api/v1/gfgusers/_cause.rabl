
node :cause do |causeuser|
  cause2 = Cause.find(causeuser.cause_id)
  {:_id => cause2.id,
   :name => cause2.name,
   :description => cause2.description,
   :url => cause2.url,
   :image => cause2.image,
   :icon =>cause2.icon,
   :prize => cause2.prize,
   :type => cause2.type,
   :startDate =>cause2.startDate,
   :endDate =>cause2.endDate,
   :isFeatured =>cause2.isFeatured,
   :donations =>cause2.donations,
   :createdBy =>cause2.createdBy,
   :active => causeuser.active}
end

#node :active do |causeuser|
#  causeuser.active
#end
