#= require json2
#= require underscore
#= require backbone
#= require jquery

setup = $.Deferred()

fb = $.Deferred()
fb.ready = ()->
  if (arguments.length == 0)
    fb.resolve()
  else
    fb.done.apply(fb, arguments)

$(document).ready ()->
  setup.resolve()

views = {}

loadView = (view, name)->
  el = $ view.prototype.el;
  if el.length > 0
    views[name] ||= new view()
    @App.trigger("view:loaded view:#{name}:loaded", views[name], name)

addView = (name, properties = {})->
  view = Backbone.View.extend(properties)
  setup.done ()->
    loadView view, name

@App =
  setup: setup
  fb: fb
  views: views
  addView: addView

_.extend(@App, Backbone.Events)

App.on('fb:ready')