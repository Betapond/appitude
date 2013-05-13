# Appitude

  Wraps up some client-side boilerplate code for our apps

## Installation

Add this line to your application's Gemfile:

    gem 'appitude', :github => 'Betapond/appitude'

And then execute:

    $ bundle

## Usage

```
//= require appitude

// App triggers events when views are loaded, just in case you need it.
App.on('view:loaded', function(view, name){
  console.debug('view loaded', name);
});

// You can hook into the load event for specific views if you need to.
App.on('view:base:loaded', function(view, name){
  console.debug('base view loaded', v);
  view.setSomething('foo')
});

// adding a backbone view is simple
// the view will be loaded on domready if the "el" element is present in the page

(function(){
  var view = {
    el: 'body',
    events: {
      'click .share': 'share'
    },

    initialize: function(){

    },

    share: function(){

    }
  }

  App.addView('main', view);
  # App.addView('main', view, {autoload: false});

}).call(this);

```

How do I load a view that I have set to ```autoload: false```

```
// if main is already loaded, this will unload and reload the view
App.loadView('main')
// you can also pass options that will be passed to the view's initialize method
App.loadView('posts', {posts: [...]})
```

How do I know what's loaded?

```
// in your javascript console
App.debugViews()
// => bookmarks, autoload: true, loaded: true
// => customLike, autoload: true, loaded: true
// => list, autoload: true, loaded: true
// => main, autoload: true, loaded: true
// => planner, autoload: false, loaded: true
// => map, autoload: true, loaded: true
// => place, autoload: true, loaded: false 
```

Accessing an already loaded view?
```
App.getView('main') // returns false if the view is not loaded
```

### Facebook Apps (WIP)

```
//= require appitude
//= require appitude/facebook

// You must provide your fb app id
App.fb.appId = '123123123123'

// internally, App.fb.ready hooks into a $.Deferred which is
// resolved after the FB jssdk is loaded and FB.init is called
App.fb.ready(function(){
  console.debug('fb js sdk has been loaded and initialized');
});

```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
