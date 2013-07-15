fb = $.Deferred()

fb.ready = ()->
  if (arguments.length == 0)
    fb.resolve()
  else
    fb.done.apply(fb, arguments)


# fbAsyncInit is called when all.js is loaded
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

# handle turbolinks stuff!
fb_root = null
justiceServed = false

fixFacebookWithTurbolinksForGreatJustice = ->
  document.addEventListener 'page:fetch', copyFbRoot
  document.addEventListener 'page:change', restoreFbRoot
  document.addEventListener 'page:load', -> FB?.XFBML.parse()
  justiceServed = true

copyFbRoot = ->
  fb_root = $('#fb-root').detach()

restoreFbRoot = ->
  if $('#fb-root').length > 0
    $('#fb-root').replaceWith fb_root
  else
    $('body').append fb_root

# add the fb js script to the page
$ ()->
  $.getScript("//connect.facebook.net/#{features.locale}/all.js")
  fixFacebookWithTurbolinksForGreatJustice() unless justiceServed