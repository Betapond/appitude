#= require json2
#= require underscore
#= require backbone
#= require jquery
#= require ./appitude/rails
#= require ./appitude/stub_console

views = []
viewObjects = {}

$(document).ready ()->
  loadViews()

$(document).on 'page:change', ()->
  view.remove() for view in viewObjects
  viewObjects = {}
  loadViews()

loadViews = ()->
  loadView.apply(this, view) for view in views

loadView = (view, name)->
  el = $ view.prototype.el;
  if el.length > 0
    try
      viewObjects[name] ||= new view()
      @App.trigger("view:loaded view:#{name}:loaded", viewObjects[name], name)
    catch error
      console.error("Failed to load view: #{name}\n", error.message)

addView = (name, properties = {})->
  view = Backbone.View.extend(properties)
  views.push [view, name]

@App =
  views: viewObjects
  addView: addView

_.extend(@App, Backbone.Events)

