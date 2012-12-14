(function($){

window.Sidebar = Spine.Controller.create({
  events: {
    "click [data-name]": "click"
  },

  elements: {
    "#channels": "channels",
    "#users": "users"
  },

  proxied: ["change", "renderChannels", "renderUsers"],

  channelsTemplate: function(item){
    return $("#channelsTemplate").tmpl(item);
  },

  usersTemplate: function(item){
    return $("#usersTemplate").tmpl(item);
  },

  init: function(){
    Channel.bind("refresh change", this.renderChannels);
    User.bind("refresh change", this.renderUsers);
    this.App.bind("change", this.change);
  },

  renderChannels: function(){
    var items    = Channel.all();
    this.channels.html(this.channelsTemplate(items));

    // Select first channel
    // if ( !this.current )
    //   this.$("[data-name=channels]:first").click();
  },

  renderUsers: function(){
     var items    = User.findAllByAttribute("current_channel_id", App.current_channel());
    //var items = User.all();
    this.users.html(this.usersTemplate(items));

    // Select first channel
    // if ( !this.current )
    //   this.$("[data-name=users]:first").click();
  },

  change: function(type, item){
    this.App.trigger("change:" + type, item);

    this.deactivate();
    var elements = this.$("[data-name=" + type + "]");
    this.current = (item && elements.forItem(item)) || elements;
    this.current.addClass("current");
  },

  click: function(e){
    var element = $(e.target);
    var type = element.attr("data-name");
    if( type != "users"){
        var item = element.item();
        this.App.trigger("change", type, item);
    }
  },

  deactivate: function(){
    this.$("[data-name]").removeClass("current");
  }
});

})(jQuery);