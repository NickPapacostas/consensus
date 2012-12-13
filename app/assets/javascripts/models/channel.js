var Channel = exports = Spine.Model.setup("Channel", ["name"]);

Channel.extend(Spine.Model.Ajax);

Channel.include({
  messages: function(){
    var channel_id = this.id;
    return Message.select(function(m){
      return m.channel_id == channel_id;
    });
  },

  users: function(){
    var channel_id = this.id;
    return User.select(function(u){
      return u.current_channel_id == channel_id;
    });
  },

  validate: function(){
    if (!this.name)
      return "name is required";
  }
});