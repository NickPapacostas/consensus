class App.User extends Spine.Model
  @configure 'User', 'email', 'password_digest'
  @extend Spine.Model.Ajax