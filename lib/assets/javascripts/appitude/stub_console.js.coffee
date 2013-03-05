# some older browsers have no console
# we don't want them to pussy out when we leave
# the odd console statement lying around :)

stub_log = (args...)->
  return true

@console ||=
  log: stub_log
  debug: stub_log
  error: stub_log