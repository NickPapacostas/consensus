var User = exports = Spine.Model.setup("User", ["email", "organizations", "current_channel_id"]);

User.extend(Spine.Model.Ajax);


User.include({

  current_channel_id: null,

  reset_current_channel_id: function(current_channel_id){
    return this.current_channel_id = current_channel_id;
  }
});