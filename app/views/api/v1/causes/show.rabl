object @cause

attributes :_id, :name, :description, :url, :image, :icon, :prize, :type, :startDate, :endDate, :isFeatured, :donations

child :causeusers => :causeUsers do
  #attributes :_id, :score, :mirrorShield, :gfguser_id
  extends "api/v1/causes/causeuser"
end