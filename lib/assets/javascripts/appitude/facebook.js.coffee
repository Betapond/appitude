fb = $.Deferred()

fb.ready = ()->
  if (arguments.length == 0)
    fb.resolve()
  else
    fb.done.apply(fb, arguments)


@fbAsyncInit = ()->
  throw new Error "Missing Facebook App Id" unless features.appId
  params =
     appId      : features.appId, #App ID
     status     : true, # check login status
     cookie     : true, # enable cookies to allow the server to access the session
     xfbml      : true, # parse XFBML
     channelURL : features.channelUrl # Channel File

  FB.init(params)
  fb.resolve()

features =
  appId: undefined
  channelUrl: '//' + window.location.host + '/channel.html'
  locale: 'en_US'
  ready: fb.ready

_.extend(@App, {fb: features})

# add the fb js script to the page
$ ()->
  $.getScript("//connect.facebook.net/#{features.locale}/all.js")