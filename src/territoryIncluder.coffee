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
      # @_all_child_territories(territory_code).prop('checked', false)

    @element.delegate 'a.exclude', 'click', (event) =>
      event.preventDefault()
      territory_code = $(event.target).parent().prop('id').replace('territory_', '')
      @_exclude_territory_recursive(territory_code)


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
      
  _include_territory_recursive: (code) ->
    @element.find('li#territory_'+code).addClass('included')
    @element.find('li#territory_'+code).removeClass('excluded')
    @_all_child_territory_containers(code).each (idx, containerEl) =>
      @_include_territory_recursive($(containerEl).prop('id').replace('territory_', ''))
      # $(containerEl).addClass('included').removeClass('excluded')

  _exclude_territory_recursive: (code) ->
    @element.find('li#territory_'+code).addClass('excluded').removeClass('included')
    @_all_child_territory_containers(code).each (idx, containerEl) =>
      @_exclude_territory_recursive($(containerEl).prop('id').replace('territory_', ''))
      # $(containerEl).addClass('excluded').removeClass('included')


  _all_child_territory_containers: (code) ->
    @element.find('li#territory_'+code+' > ul.territory_options > li')

# register jquery widget
$.widget 'fuga.territoryIncluder', new TerritoryIncluder



