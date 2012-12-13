var User = exports = Spine.model.setup("User", ["email", "organizations", "current_channels"]);

User.extend(Spine.Model.Ajax);
