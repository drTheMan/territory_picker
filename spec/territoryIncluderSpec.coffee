describe 'TerritoryIncluder', ->
  options = {}

  beforeEach ->
    jQuery('body').append('<div id="fixtures"></div>')
    @$element = $( '#fixtures' )
    @$element.territoryIncluder()

  afterEach ->
    jQuery('#fixtures').remove()

  it "should add include/exclude buttons to each territory", ->
    @$element.find('input').each (idx, inputEl) ->
      expect( $(inputEl).next().prop('class') ).toEqual 'exclude'
      expect( $(inputEl).next().next().prop('class') ).toEqual 'include'

  it "should give the territory container element the territory code as id", ->
    @$element.find('input').each (idx, inputEl) ->
      expect( $(inputEl).parent().prop('id') ).toEqual $(inputEl).prop('id')

  it "should add include/exclude classes to the territory's container element", ->
    expect( @$element.find('li#territory_nl').hasClass('included') ).toBe false
    expect( @$element.find('li#territory_nl').hasClass('excluded') ).toBe false
    @$element.find('li#territory_nl .include').trigger('click')
    expect( @$element.find('li#territory_nl').hasClass('included') ).toBe true
    expect( @$element.find('li#territory_nl').hasClass('excluded') ).toBe false
    @$element.find('li#territory_nl .exclude').trigger('click')
    expect( @$element.find('li#territory_nl').hasClass('included') ).toBe false
    expect( @$element.find('li#territory_nl').hasClass('excluded') ).toBe true

  it "should include/exclude child territories recursively", ->
    expect( @$element.find('li.included').length ).toBe 0
    expect( @$element.find('li.excluded').length ).toBe 0
    @$element.find('li#territory_world > .exclude').trigger('click')
    expect( @$element.find('li.excluded').length ).toBe 252
    expect( @$element.find('li.included').length ).toBe 0
    @$element.find('li#territory_world > .include').trigger('click')
    expect( @$element.find('li.excluded').length ).toBe 0
    expect( @$element.find('li.included').length ).toBe 252
