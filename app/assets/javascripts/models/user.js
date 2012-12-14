var User = exports = Spine.Model.setup("User", ["email", "organizations", "current_channel_id"]);

User.extend(Spine.Model.Ajax);


User.include({
  set_current_channel_id: function(){
    this.current_channel_id = App.current_channel().id
  }
});