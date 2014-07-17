#
# Name    : <plugin name>
# Author  : <your name>, <your website url>, <twitter handle>
# Version : <version number>
# Repo    : <repo url>
# Website : <website url>
#

root = this
$ = jQuery

class TerritoryIncluder extends TerritoryPicker
  _create: ->
    # do all territoryPicker initializations
    super()

    # includer customizations
    @_add_territory_id_to_containers()
    @_turn_into_include_options()

    jQuery.each (@options.included_territory_codes || []), (idx, territory_code) =>
      @_perform_include_on territory_code

    jQuery.each (@options.excluded_territory_codes || []), (idx, territory_code) =>
      @_perform_exclude_on territory_code

    # event hooks
    @element.delegate 'a.include', 'click', (event) =>
      event.preventDefault()
      event.stopPropagation()
      @_perform_include_on $(event.target).parent().prop('id').replace('territory_', '')

    @element.delegate 'a.exclude', 'click', (event) =>
      event.preventDefault()
      event.stopPropagation()
      @_perform_exclude_on $(event.target).parent().prop('id').replace('territory_', '')

  _add_territory_id_to_containers: ->
    @element.find('input').each (idx, inputEl) ->
      el = $(inputEl)
      el.parent().prop('id', el.prop('id'))

  _turn_into_include_options: ->
    @element.find('input').each (idx, inputEl) ->
      el = $(inputEl)
      includeEl = $('<a href="#" class="include">+</a>')
      excludeEl = $('<a href="#" class="exclude">-</a>')
      el.after includeEl
      el.after excludeEl

  _perform_include_on: (territory_code) ->
    if @_territory_inclusion_state(territory_code) == 'included'
      @_uninclude_territory_recursive territory_code
    else
      @_include_territory_recursive(territory_code)
    if parent_code = @_parent_code(territory_code)
      @_update_inclusion_territory(parent_code)

  _perform_exclude_on: (territory_code) ->
    if @_territory_inclusion_state(territory_code) == 'excluded'
      @_unexclude_territory_recursive territory_code   
    else
      @_exclude_territory_recursive(territory_code)
    if parent_code = @_parent_code(territory_code)
      @_update_inclusion_territory(parent_code)


  _update_inclusion_territory: (code) ->
    all = @_all_child_territory_containers(code)
    included = @_all_child_territory_containers(code, '.included')
    excluded = @_all_child_territory_containers(code, '.excluded')

    if all.length == included.length
      @_include_territory code
      return

    if all.length == excluded.length
      @_exclude_territory code
      return

    @_uninclude_territory code
    @_unexclude_territory code

  _territory_inclusion_state: (code) ->
    el = @element.find('li#territory_'+code.toLowerCase())
    return 'included' if el.hasClass('included')
    return 'excluded' if el.hasClass('excluded')
    return null

  _include_territory: (code) ->
    @element.find('li#territory_'+code.toLowerCase()).addClass('included').removeClass('excluded')

  _include_territory_recursive: (code) ->
    @_include_territory(code)
    @_all_child_territory_containers(code).each (idx, containerEl) =>
      @_include_territory_recursive($(containerEl).prop('id').replace('territory_', ''))

  _uninclude_territory: (code) ->
    @element.find('li#territory_'+code.toLowerCase()).removeClass('included')

  _uninclude_territory_recursive: (code) ->
    @_uninclude_territory(code)
    @_all_child_territory_containers(code).each (idx, containerEl) =>
      @_uninclude_territory_recursive($(containerEl).prop('id').replace('territory_', ''))

  _exclude_territory: (code) ->
    @element.find('li#territory_'+code.toLowerCase()).addClass('excluded').removeClass('included')

  _exclude_territory_recursive: (code) ->
    @_exclude_territory(code)
    @_all_child_territory_containers(code).each (idx, containerEl) =>
      @_exclude_territory_recursive($(containerEl).prop('id').replace('territory_', ''))

  _unexclude_territory: (code) ->
    @element.find('li#territory_'+code.toLowerCase()).removeClass('excluded')

  _unexclude_territory_recursive: (code) ->
    @_unexclude_territory(code)
    @_all_child_territory_containers(code).each (idx, containerEl) =>
      @_unexclude_territory_recursive($(containerEl).prop('id').replace('territory_', ''))

  _all_child_territory_containers: (code, selector) ->
    selector = '' if selector == undefined
    @element.find('li#territory_'+code.toLowerCase()+' > ul.territory_options > li'+selector)

  _parent_code: (code) ->
    el = @element.find('li#territory_'+code.toLowerCase()).parent().parent()
    if el.prop('id').match(/^territory_/)
      return el.prop('id').replace(/^territory_/, '') 
    return null

  all_included_territory_codes: ->
    result = []
    @element.find('li.included').each (idx,el) ->
      result.push $(el).prop('id').replace('territory_', '')
    return result

  all_excluded_territory_codes: ->
    result = []
    @element.find('li.excluded').each (idx,el) ->
      result.push $(el).prop('id').replace('territory_', '')
    return result

  included_territory_codes: ->
    result = []
    @element.find('li.included').each (idx,el) ->
      if !$(el).parent().parent().hasClass('included')
        result.push $(el).prop('id').replace('territory_', '')
    return result

  excluded_territory_codes: ->
    result = []
    @element.find('li.excluded').map (idx,el) ->
      if !$(el).parent().parent().hasClass('excluded')
        result.push $(el).prop('id').replace('territory_', '')
    return result


# register jquery widget
$.widget 'fuga.territoryIncluder', new TerritoryIncluder



