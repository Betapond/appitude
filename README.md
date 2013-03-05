# Appitude

  Wraps up some client-side boilerplate code for our apps

## Installation

Add this line to your application's Gemfile:

    gem 'appitude', :git => 'Betapond/appitude'

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
});

// adding a backbone view is simple
// the view will be loaded on domready if the "el" element is present in the page
App.addView('main', {
  el: 'body',
  events: {
    'click .share': 'share'
  },

  initialize: function(){

  },

  share: function(){

  }
});

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
