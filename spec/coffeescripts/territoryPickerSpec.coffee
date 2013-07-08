describe 'TerritoryPicker', ->
  options =
    message: 'Hello World'

  beforeEach ->
    loadFixtures 'fragment.html'
    @$element = $( '#fixtures' )

  describe 'plugin behavior', ->
    it 'should be available on the jQuery object', ->
      expect( $.fn.territoryPicker ).toBeDefined()

    it 'should be chainable', ->
      expect( @$element.territoryPicker() ).toBe @$element

    it 'should offers default values', ->
      plugin = new $.territoryPicker( @$element )

      expect( plugin.defaults ).toBeDefined()

    it 'should overwrites the settings', ->
      plugin = new $.territoryPicker( @$element, options )

      expect( plugin.settings.message ).toBe( options.message )

  describe 'plugin state', ->
    beforeEach ->
      @plugin = new $.territoryPicker( @$element )

    it 'should have a ready state', ->
      expect( @plugin.getState() ).toBe 'ready'

    it 'should be updatable', ->
      @plugin.setState( 'new state' )

      expect( @plugin.getState() ).toBe 'new state'

  describe 'initialization', ->
    describe 'worldwide option', ->
      beforeEach ->
        new $.territoryPicker( @$element )

      it 'should generate a \'worldwide?\' checkbox', ->
        expect( $( 'input#territory_world' ) ).toExist()
        expect( $( 'input#territory_world' ).prop('type') ).toBe('checkbox')
        expect( $( 'input#territory_world' ).prop('name') ).toBe('territories[world]')
        expect( $( 'input#territory_world' ) ).toBeChecked()
  
      it 'should generate a \'worldwide\' label', ->
        expect( $( 'label#territory_world_name' ) ).toExist()
        expect( $( 'label#territory_world_name' ).prop('for') ).toBe('territory_world')
        expect( $( 'label#territory_world_name' ).html() ).toBe('World')

    describe 'default territory options', ->
      beforeEach ->
        new $.territoryPicker( @$element )

      it 'should generate these default options', ->
        territories =
          africa: 'Africa'
          dz: "Algeria"
          ao: "Angola"
          bj: "Benin"
          bw: "Botswana"
          bf: "Burkina Faso"
          bi: "Burundi"
          cm: "Cameroon"
          cv: "Cape Verde"
          cf: "Central African Republic"
          td: "Chad"
          km: "Comoros"
          cg: "Congo"
          cd: "Congo (DR)"
          ci: "Cote d'Ivoire"
          dj: "Djibouti"
          eg: "Egypt"
          gq: "Equatorial Guinea"
          er: "Eritrea"
          et: "Ethiopia"
          ga: "Gabon"
          gm: "Gambia"
          gh: "Ghana"
          gn: "Guinea"
          gw: "Guinea-Bissau"
          ke: "Kenya"
          ls: "Lesotho"
          lr: "Liberia"
          ly: "Libyan Arab Jamahiriya"
          mg: "Madagascar"
          mw: "Malawi"
          ml: "Mali"
          mr: "Mauritania"
          mu: "Mauritius"
          yt: "Mayotte"
          ma: "Morocco"
          mz: "Mozambique"
          na: "Namibia"
          ne: "Niger"
          ng: "Nigeria"
          re: "Reunion"
          rw: "Rwanda"
          sh: "Saint Helena"
          st: "Sao Tome and Principe"
          sn: "Senegal"
          sc: "Seychelles"
          sl: "Sierra Leone"
          so: "Somalia"
          za: "South Africa"
          sd: "Sudan"
          sz: "Swaziland"
          tg: "Togo"
          tn: "Tunisia"
          ug: "Uganda"
          tz: "United Republic of Tanzania"
          eh: "Western Sahara"
          zm: "Zambia"
          zw: "Zimbabwe"
          americas: "Americas"
          ai: "Anguilla"
          ag: "Antigua and Barbuda"
          ar: "Argentina"
          aw: "Aruba"
          bs: "Bahamas"
          bb: "Barbados"
          bz: "Belize"
          bm: "Bermuda"
          bo: "Bolivia"
          br: "Brazil"
          vg: "British Virgin Islands"
          ca: "Canada"
          ky: "Cayman Islands"
          cl: "Chile"
          co: "Colombia"
          cr: "Costa Rica"
          cu: "Cuba"
          dm: "Dominica"
          do: "Dominican Republic"
          ec: "Ecuador"
          sv: "El Salvador"
          fk: "Falkland Islands (Malvinas)"
          gf: "French Guiana"
          gl: "Greenland"
          gd: "Grenada"
          gp: "Guadeloupe"
          gt: "Guatemala"
          gy: "Guyana"
          ht: "Haiti"
          hn: "Honduras"
          jm: "Jamaica"
          mq: "Martinique"
          mx: "Mexico"
          ms: "Montserrat"
          an: "Netherlands Antilles"
          ni: "Nicaragua"
          pa: "Panama"
          py: "Paraguay"
          pe: "Peru"
          pr: "Puerto Rico"
          bl: "Saint Barthelemy"
          kn: "Saint Kitts and Nevis"
          lc: "Saint Lucia"
          mf: "Saint Martin"
          pm: "Saint Pierre and Miquelon"
          vc: "Saint Vincent and the Grenadines"
          sr: "Suriname"
          tt: "Trinidad and Tobago"
          tc: "Turks and Caicos Islands"
          vi: "United States Virgin Islands"
          us: "United States of America"
          uy: "Uruguay"
          ve: "Venezuela"
          asia: "Asia"
          af: "Afghanistan"
          am: "Armenia"
          az: "Azerbaijan"
          bh: "Bahrain"
          bd: "Bangladesh"
          bt: "Bhutan"
          bn: "Brunei Darussalam"
          kh: "Cambodia"
          cn: "China"
          ge: "Georgia"
          hk: "Hong Kong"
          in: "India"
          id: "Indonesia"
          ir: "Iran (Islamic Republic of)"
          iq: "Iraq"
          il: "Israel"
          jp: "Japan"
          jo: "Jordan"
          kz: "Kazakhstan"
          kp: "Korea (DPRK)"
          kw: "Kuwait"
          kg: "Kyrgyzstan"
          la: "Laos (PDR)"
          lb: "Lebanon"
          mo: "Macao"
          my: "Malaysia"
          mv: "Maldives"
          mn: "Mongolia"
          mm: "Myanmar"
          np: "Nepal"
          ps: "Occupied Palestinian Territory"
          om: "Oman"
          pk: "Pakistan"
          ph: "Philippines"
          qa: "Qatar"
          kr: "Republic of Korea"
          sa: "Saudi Arabia"
          sg: "Singapore"
          lk: "Sri Lanka"
          sy: "Syrian Arab Republic"
          tw: "Taiwan"
          tj: "Tajikistan"
          th: "Thailand"
          tl: "Timor-Leste"
          tr: "Turkey"
          tm: "Turkmenistan"
          ae: "United Arab Emirates"
          uz: "Uzbekistan"
          vn: "Viet Nam"
          ye: "Yemen"
          oceania: "Oceania"
          as: "American Samoa"
          aq: "Antarctica"
          au: "Australia"
          bv: "Bouvet Island"
          io: "British Indian Ocean Territory"
          cx: "Christmas Island"
          cc: "Cocos (Keeling) Islands"
          ck: "Cook Islands"
          fj: "Fiji"
          pf: "French Polynesia"
          tf: "French Southern Territories"
          gu: "Guam"
          hm: "Heard and McDonald Islands"
          ki: "Kiribati"
          mh: "Marshall Islands"
          fm: "Micronesia"
          nr: "Nauru"
          nc: "New Caledonia"
          nz: "New Zealand"
          nu: "Niue"
          nf: "Norfolk Island"
          mp: "Northern Mariana Islands"
          pw: "Palau"
          pg: "Papua New Guinea"
          pn: "Pitcairn"
          ws: "Samoa"
          sb: "Solomon Islands"
          gs: "South Georgia and South Sandwich Islands"
          tk: "Tokelau"
          to: "Tonga"
          tv: "Tuvalu"
          um: "US Minor Outlying Islands"
          vu: "Vanuatu"
          wf: "Wallis and Futuna Islands"
          europe: "Europe"
          ax: "Aland Islands"
          al: "Albania"
          ad: "Andorra"
          at: "Austria"
          by: "Belarus"
          be: "Belgium"
          ba: "Bosnia and Herzegovina"
          bg: "Bulgaria"
          hr: "Croatia"
          cy: "Cyprus"
          cz: "Czech Republic"
          dk: "Denmark"
          ee: "Estonia"
          fo: "Faeroe Islands"
          fi: "Finland"
          fr: "France"
          de: "Germany"
          gi: "Gibraltar"
          gr: "Greece"
          gg: "Guernsey"
          va: "Holy See"
          hu: "Hungary"
          is: "Iceland"
          ie: "Ireland"
          im: "Isle Of Man"
          it: "Italy"
          je: "Jersey"
          lv: "Latvia"
          li: "Liechtenstein"
          lt: "Lithuania"
          lu: "Luxembourg"
          mk: "Macedonia (frm Yugoslavia)"
          mt: "Malta"
          mc: "Monaco"
          me: "Montenegro"
          nl: "Netherlands"
          no: "Norway"
          pl: "Poland"
          pt: "Portugal"
          md: "Republic of Moldova"
          ro: "Romania"
          ru: "Russian Federation"
          sm: "San Marino"
          rs: "Serbia"
          sk: "Slovakia"
          si: "Slovenia"
          es: "Spain"
          sj: "Svalbard and Jan Mayen Islands"
          se: "Sweden"
          ch: "Switzerland"
          ua: "Ukraine"
          gb: "United Kingdom of Great Britain"

        $.each territories, (code, label) =>
          expect( @$element.find('input[name="territories['+code+']"]') ).toBeChecked()
          expect( @$element.find('label[for="territory_'+code+'"]').html() ).toBe( label )

  describe 'events', ->
    beforeEach ->
      new $.territoryPicker( @$element )

    it 'should auto check/uncheck all child territories', ->
      # verify number of input control in total
      expect( @$element.find('input').length ).toBe(252)
      # verify ALL inputs are cheked by default
      expect( @$element.find('input:checked').length ).toBe(252)
      # fake a click on the world territory
      @$element.find('input[name="territories[world]"]').trigger('click')
      # verify that ALL territories are unchecked
      expect( @$element.find('input:checked').length ).toBe(0)
      # fake another click on the world territory
      @$element.find('input[name="territories[world]"]').trigger('click')
      # verify that ALL territories are checked again
      expect( @$element.find('input:checked').length ).toBe(252)

    it 'should auto check/uncheck all parent territories', ->
      # verify number of input control in total
      expect( @$element.find('input').length ).toBe(252)
      # verify ALL inputs are cheked by default
      expect( @$element.find('input:checked').length ).toBe(252)
      # fake a click on the netherlands territory
      @$element.find('input[name="territories[nl]"]').trigger('click')
      # verify that 3 territories are unchecked (nl, europe and world)
      expect( @$element.find('input:checked').length ).toBe(249)
      # fake another click on the world territory
      @$element.find('input[name="territories[nl]"]').trigger('click')
      # verify that ALL territories are checked again
      expect( @$element.find('input:checked').length ).toBe(252)

  describe 'data interface', ->
    beforeEach ->
      @$element.territoryPicker()

    it 'should have a all_checked_territory_codes function', ->
      # uncheck all
      @$element.find('input[name="territories[world]"]').trigger('click')
      # check belgium
      @$element.find('input[name="territories[be]"]').trigger('click')
      # verify
      expect( @$element.data('territoryPicker').all_checked_territory_codes() ).toBe( ['be'] )

    #it 'should have a checked_territory_codes function that doesn\'t gives all checked child-territories', ->
    #  expect( @$element.data('territoryPicker').checked_territory_codes() ).toBe( ['world'] )

