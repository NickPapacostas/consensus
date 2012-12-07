$ = jQuery.sub()
Organization = App.Organization

$.fn.item = ->
  elementID   = $(@).data('id')
  elementID or= $(@).parents('[data-id]').data('id')
  Organization.find(elementID)

class New extends Spine.Controller
  events:
    'click [data-type=back]': 'back'
    'submit form': 'submit'
    
  constructor: ->
    super
    @active @render
    
  render: ->
    @html @view('organizations/new')

  back: ->
    @navigate '/organizations'

  submit: (e) ->
    e.preventDefault()
    organization = Organization.fromForm(e.target).save()
    @navigate '/organizations', organization.id if organization

class Edit extends Spine.Controller
  events:
    'click [data-type=back]': 'back'
    'submit form': 'submit'
  
  constructor: ->
    super
    @active (params) ->
      @change(params.id)
      
  change: (id) ->
    @item = Organization.find(id)
    @render()
    
  render: ->
    @html @view('organizations/edit')(@item)

  back: ->
    @navigate '/organizations'

  submit: (e) ->
    e.preventDefault()
    @item.fromForm(e.target).save()
    @navigate '/organizations'

class Show extends Spine.Controller
  events:
    'click [data-type=edit]': 'edit'
    'click [data-type=back]': 'back'

  constructor: ->
    super
    @active (params) ->
      @change(params.id)

  change: (id) ->
    @item = Organization.find(id)
    @render()

  render: ->
    @html @view('organizations/show')(@item)

  edit: ->
    @navigate '/organizations', @item.id, 'edit'

  back: ->
    @navigate '/organizations'

class Index extends Spine.Controller
  events:
    'click [data-type=edit]':    'edit'
    'click [data-type=destroy]': 'destroy'
    'click [data-type=show]':    'show'
    'click [data-type=new]':     'new'

  constructor: ->
    super
    Organization.bind 'refresh change', @render
    Organization.fetch()
    
  render: =>
    organizations = Organization.all()
    @html @view('organizations/index')(organizations: organizations)
    
  edit: (e) ->
    item = $(e.target).item()
    @navigate '/organizations', item.id, 'edit'
    
  destroy: (e) ->
    item = $(e.target).item()
    item.destroy() if confirm('Sure?')
    
  show: (e) ->
    item = $(e.target).item()
    @navigate '/organizations', item.id
    
  new: ->
    @navigate '/organizations/new'
    
class App.Organizations extends Spine.Stack
  controllers:
    index: Index
    edit:  Edit
    show:  Show
    new:   New
    
  routes:
    '/organizations/new':      'new'
    '/organizations/:id/edit': 'edit'
    '/organizations/:id':      'show'
    '/organizations':          'index'
    
  default: 'index'
  className: 'stack organizations'