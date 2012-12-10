
node :cause do |test|
  Cause.find(test.cause_id)
end