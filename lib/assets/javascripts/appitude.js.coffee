#= require json2
#= require underscore
#= require backbone
#= require jquery
#= require ./appitude/rails
#= require ./appitude/stub_console

views = {}
viewObjects = {}

getView = (name)->
  views[name] || false

getViewObject = (name)->
  if viewObjects.hasOwnProperty(name) then viewObjects[name].object else false

unloadView = (name)->
  if view = getView(name)
    view.undelegateEvents();
    delete views[name]

loadViews = ()->
  loadView.call(App, name) for name, view of viewObjects when view.loadOptions.autoload is true

loadView = (name, options = {})->
  return unless view = getViewObject(name)
  unloadView(name) # unload view before trying to load
  el = $ view.prototype.el
  if el.length > 0
    try
      views[name] ||= new view(options)
      App.trigger("view:loaded view:#{name}:loaded", views[name], name)
    catch error
      console.error("Failed to load view: #{name}\n", error.message, error)

addView = (name, properties = {}, loadOptions = {})->
  view = Backbone.View.extend(properties)
  loadOptions = _.extend({autoload:true}, loadOptions)
  viewObjects[name] = {object:view, loadOptions: loadOptions}

debugViews = ()->
  _v = _.map viewObjects, (view, name)->
    loaded = views.hasOwnProperty(name)
    autoload = view.loadOptions.autoload
    "#{name}, autoload: #{autoload}, loaded: #{loaded}"
  console.debug(_v.join("\n"))

App =
  debugViews: debugViews
  getView: getView
  addView: addView
  loadView: loadView
  loadViews: loadViews
  unloadView: unloadView

_.extend(App, Backbone.Events)

@App = App
