#= require json2
#= require underscore
#= require backbone
#= require jquery
#= require ./appitude/stub_console

domReady = $.Deferred()

$(document).ready ()->
  domReady.resolve()

views = {}

loadView = (view, name)->
  el = $ view.prototype.el;
  if el.length > 0
    try
      views[name] ||= new view()
      @App.trigger("view:loaded view:#{name}:loaded", views[name], name)
    catch error
      console.error("Failed to load view: #{name}\n", error.message)

addView = (name, properties = {})->
  view = Backbone.View.extend(properties)
  domReady.done ()->
    loadView view, name

@App =
  views: views
  addView: addView

_.extend(@App, Backbone.Events)