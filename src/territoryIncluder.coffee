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
    super()
    @_add_territory_id_to_containers()
    @_turn_into_include_options()

    @element.delegate 'a.include', 'click', (event) =>
      event.preventDefault()
      event.stopPropagation()
      territory_code = $(event.target).parent().prop('id').replace('territory_', '')
      @_include_territory_recursive(territory_code)
      if parent_code = @_parent_code(territory_code)
        @_update_inclusion_territory(parent_code)

    @element.delegate 'a.exclude', 'click', (event) =>
      event.preventDefault()
      territory_code = $(event.target).parent().prop('id').replace('territory_', '')
      @_exclude_territory_recursive(territory_code)
      if parent_code = @_parent_code(territory_code)
        @_update_inclusion_territory(parent_code)

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

  _update_inclusion_territory: (code) ->
    all = @_all_child_territory_containers(code)
    included = @_all_child_territory_containers(code, '.included')
    excluded = @_all_child_territory_containers(code, '.excluded')

    console.log code
    console.log [all.length,included.length,excluded.length]
    if all.length == included.length
      @_include_territory code
      return

    if all.length == excluded.length
      @_exclude_territory code
      return

    @_uninclude_territory code
    @_unexclude_territory code

  _include_territory: (code) ->
    @element.find('li#territory_'+code).addClass('included').removeClass('excluded')

  _uninclude_territory: (code) ->
    @element.find('li#territory_'+code).removeClass('included')

  _include_territory_recursive: (code) ->
    @_include_territory(code)
    @_all_child_territory_containers(code).each (idx, containerEl) =>
      @_include_territory_recursive($(containerEl).prop('id').replace('territory_', ''))

  _exclude_territory: (code) ->
    @element.find('li#territory_'+code).addClass('excluded').removeClass('included')

  _unexclude_territory: (code) ->
    @element.find('li#territory_'+code).removeClass('excluded')

  _exclude_territory_recursive: (code) ->
    @_exclude_territory(code)
    @_all_child_territory_containers(code).each (idx, containerEl) =>
      @_exclude_territory_recursive($(containerEl).prop('id').replace('territory_', ''))

  _all_child_territory_containers: (code, selector) ->
    selector = '' if selector == undefined
    @element.find('li#territory_'+code+' > ul.territory_options > li'+selector)

  _parent_code: (code) ->
    el = @element.find('li#territory_'+code).parent().parent()
    if el.prop('id').match(/^territory_/)
      return el.prop('id').replace(/^territory_/, '') 
    return null

  all_included_territory_codes: ->
    @element.find('li.included').map (idx,el) ->
      $(el).prop('id').replace('territory_', '')

  all_excluded_territory_codes: ->
    @element.find('li.excluded').map (idx,el) ->
      $(el).prop('id').replace('territory_', '')

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



