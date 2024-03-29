//= require lib/json2
//= require lib/jquery
//= require lib/array.ext.js
//= require spine/src/spine
//= require spine/src/ajax
//= require spine/src/list
//= require spine/src/local
//= require spine/src/manager
//= require spine/src/relation
//= require spine/src/route
//= require utils

//= require models/search
//= require models/message
//= require models/channel
//= require models/user
//= require models/juggernaut

//= require controllers/messages
//= require controllers/sidebar
//= require controllers/searches
//= require controllers/settings
//= require controllers/assets

jQuery(function($){

window.App = Spine.Controller.create({
  el: $("body"),

  elements: {
    "#sidebar": "sidebarEl",
    "#messages": "messagesEl",
    "#searches": "searchesEl",
    "#settings": "settingsEl"
  },

  constructor: function(){
    this.messages = Messages.init({el: this.messagesEl});
    this.sidebar  = Sidebar.init({el: this.sidebarEl});
    this.searches = Searches.init({el: this.searchesEl});
    this.settings = Settings.init({el: this.settingsEl});
    this.assets   = Assets.init({messages: this.messages});

    // Make sure only one view is visible
    this.manager = Spine.Controller.Manager.init();
    this.manager.addAll(this.messages, this.searches, this.settings);

    // Remove selected sidebar items when searching
    this.manager.bind("change", this.proxy(function(current){
      if (current == this.searches) this.sidebar.deactivate();
    }));

    User.fetch();
    Message.fetch();
    Channel.fetch();
  },

  current_user: function(){
    return User.select(function(u){
      return u.email == window.user_email;
    })[0];
  },

  current_channel: function(){
    current_chan_name = $('.current').text().replace(/^\s+ | \s+$/g, '');
    return Channel.findByAttribute("name", current_chan_name);
  }


});

new window.App();


});
//= require juggernaut