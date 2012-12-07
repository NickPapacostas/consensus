class JuggernautObserver < Activeresourceord::Observer
  observe :message, :channel

  def after_create(resource)
    publish(:create, resource)
  end

  def after_update(resource)
    publish(:update, resource)
  end

  def after_destroy(resource)
    publish(:destroy, resource)
  end

  protected
    def publish(type, resource)
      Juggernaut.publish("/observer", {
        :type  => type, :id => resource.id,
        :klass => resource.class.name, :resourceord => resource
      })
    end
end