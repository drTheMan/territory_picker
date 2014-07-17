describe 'TerritoryIncluder', ->
  options = {}

  beforeEach ->
    jQuery('body').append('<div id="fixtures"></div>')
    @$element = $( '#fixtures' )
    @$element.territoryIncluder()

  afterEach ->
    @$element.remove()

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

  it "should provide a complete list of included/excluded territories", ->
    expect( @$element.territoryIncluder('all_included_territory_codes') ).toEqual []
    expect( @$element.territoryIncluder('all_excluded_territory_codes') ).toEqual []
    @$element.find('li#territory_fr > .include').trigger('click')
    expect( @$element.territoryIncluder('all_included_territory_codes') ).toEqual ['fr']
    expect( @$element.territoryIncluder('all_excluded_territory_codes') ).toEqual []
    @$element.find('li#territory_europe > .exclude').trigger('click')
    expect( @$element.territoryIncluder('all_excluded_territory_codes').length ).toBe 53
    expect( @$element.territoryIncluder('all_included_territory_codes') ).toEqual []

  it "should provide a non-recursive list included/excluded territories", ->
    expect( @$element.territoryIncluder('included_territory_codes').length ).toBe 0
    expect( @$element.territoryIncluder('excluded_territory_codes').length ).toBe 0
    @$element.find('li#territory_fr > .include').trigger('click')
    expect( @$element.territoryIncluder('included_territory_codes') ).toEqual ['fr']
    expect( @$element.territoryIncluder('excluded_territory_codes') ).toEqual []
    @$element.find('li#territory_europe > .exclude').trigger('click')
    expect( @$element.territoryIncluder('excluded_territory_codes') ).toEqual ['europe']
    expect( @$element.territoryIncluder('included_territory_codes') ).toEqual []

  it "should remove included/excluded class from parent territory", ->
    expect( @$element.territoryIncluder('all_included_territory_codes').length ).toBe 0
    expect( @$element.territoryIncluder('all_excluded_territory_codes').length ).toBe 0
    @$element.find('li#territory_europe > .exclude').trigger('click')
    expect( @$element.territoryIncluder('all_excluded_territory_codes').length ).toEqual 53
    expect( @$element.territoryIncluder('all_included_territory_codes').length ).toEqual 0
    @$element.find('li#territory_fr > .include').trigger('click')
    expect( @$element.territoryIncluder('all_included_territory_codes') ).toEqual ['fr']
    expect( @$element.territoryIncluder('all_excluded_territory_codes').length ).toEqual 51

  it "should toggle included/excluded", ->
    expect( @$element.territoryIncluder('all_included_territory_codes').length ).toEqual 0
    @$element.find('li#territory_europe > .include').trigger('click')
    expect( @$element.territoryIncluder('all_included_territory_codes').length ).toEqual 53
    @$element.find('li#territory_fr > .include').trigger('click')
    expect( @$element.territoryIncluder('all_included_territory_codes').length ).toEqual 51 # both europe and france are now UNincluded
    @$element.find('li#territory_de > .include').trigger('click')
    expect( @$element.territoryIncluder('all_included_territory_codes').length ).toEqual 50

  it "should accept included_territory_codes/excluded_territory_codes options", ->
    expect( @$element.territoryIncluder('all_included_territory_codes') ).toEqual []
    expect( @$element.territoryIncluder('all_excluded_territory_codes') ).toEqual []
    
    @$element.remove()
    jQuery('body').append('<div id="newFixtures"></div>')
    @$element = $( '#newFixtures' )
    @$element.territoryIncluder(included_territory_codes: ['nl', 'fr'], excluded_territory_codes: ['es', 'au'])

    expect( @$element.territoryIncluder('all_included_territory_codes').sort() ).toEqual ['nl', 'fr'].sort()
    expect( @$element.territoryIncluder('all_excluded_territory_codes').sort() ).toEqual ['es', 'au'].sort()






