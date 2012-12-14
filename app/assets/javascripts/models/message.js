var Message = exports = Spine.Model.setup("Message", ["body", "name", "channel_id", "user_id", "per"]);

Message.extend(Spine.Model.Ajax);

Message.include({
  validate: function(){
    if ( !this.channel_id )
      return "channel_id required";
  },

  channel: function(){
    return Channel.find(this.channel_id);
  },

  forChannel: function(record){
    if ( !record ) return false;
    return(parseInt(this.channel_id) === record.id);
  },

  isPaste: function(){
    return this.body.match(/\r|\n/);
  },

  user: function(){
    return User.find(this.user_id);
  },

  handle: function(){
    return $("meta[name=handle]").attr("content");
  }
});

