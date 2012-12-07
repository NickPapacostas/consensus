//= require json2
//= require app/lib/array.ext.js
//= require jquery
//= require app/lib/jquery.tmpl
//= require app/lib/jquery.audio

//= require app/lib/spine
//= require app/lib/spine.model.ajax
//= require app/lib/spine.controller.manager
//= require app/utils

//= require app/models/message
//= require app/models/channel

//= require app/controllers/messages
//= require app/controllers/sidebar
//= require app/controllers/settings

window.App = Spine.Controller.create({
  el: $("body"),

  elements: {
    "#sidebar": "sidebarEl",
    "#messages": "messagesEl",
    "#searches": "searchesEl",
    "#settings": "settingsEl"
  },

  init: function(){
    this.messages = Messages.init({el: this.messagesEl});
    this.sidebar  = Sidebar.init({el: this.sidebarEl});
    this.settings = Settings.init({el: this.settingsEl});

    // Make sure only one view is visible
    this.manager = Spine.Controller.Manager.init();
    this.manager.addAll(this.messages, this.settings);


    Message.fetch();
    Channel.fetch();
  }
}).init();


//= require juggernaut