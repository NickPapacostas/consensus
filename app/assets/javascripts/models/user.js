var User = exports = Spine.Model.setup("User", ["email", "organizations", "current_channel_id"]);

User.extend(Spine.Model.Ajax);


User.include({
  current_channel_id: function(){
    return Channel.select
  }
});