#
# Name    : <plugin name>
# Author  : <your name>, <your website url>, <twitter handle>
# Version : <version number>
# Repo    : <repo url>
# Website : <website url>
#

root = this
$ = jQuery

class TerritoryPicker
  defaults:
    territories:
      world:
        label: 'World'
        territories:
          africa:
            label: 'Africa'
            territories:
              dz:
                label: "Algeria"
              ao:
                label: "Angola"
              bj:
                label: "Benin"
              bw:
                label: "Botswana"
              bf:
                label: "Burkina Faso"
              bi:
                label: "Burundi"
              cm:
                label: "Cameroon"
              cv:
                label: "Cape Verde"
              cf:
                label: "Central African Republic"
              td:
                label: "Chad"
              km:
                label: "Comoros"
              cg:
                label: "Congo"
              cd:
                label: "Congo (DR)"
              ci:
                label: "Cote d'Ivoire"
              dj:
                label: "Djibouti"
              eg:
                label: "Egypt"
              gq:
                label: "Equatorial Guinea"
              er:
                label: "Eritrea"
              et:
                label: "Ethiopia"
              ga:
                label: "Gabon"
              gm:
                label: "Gambia"
              gh:
                label: "Ghana"
              gn:
                label: "Guinea"
              gw:
                label: "Guinea-Bissau"
              ke:
                label: "Kenya"
              ls:
                label: "Lesotho"
              lr:
                label: "Liberia"
              ly:
                label: "Libyan Arab Jamahiriya"
              mg:
                label: "Madagascar"
              mw:
                label: "Malawi"
              ml:
                label: "Mali"
              mr:
                label: "Mauritania"
              mu:
                label: "Mauritius"
              yt:
                label: "Mayotte"
              ma:
                label: "Morocco"
              mz:
                label: "Mozambique"
              na:
                label: "Namibia"
              ne:
                label: "Niger"
              ng:
                label: "Nigeria"
              re:
                label: "Reunion"
              rw:
                label: "Rwanda"
              sh:
                label: "Saint Helena"
              st:
                label: "Sao Tome and Principe"
              sn:
                label: "Senegal"
              sc:
                label: "Seychelles"
              sl:
                label: "Sierra Leone"
              so:
                label: "Somalia"
              za:
                label: "South Africa"
              sd:
                label: "Sudan"
              sz:
                label: "Swaziland"
              tg:
                label: "Togo"
              tn:
                label: "Tunisia"
              ug:
                label: "Uganda"
              tz:
                label: "United Republic of Tanzania"
              eh:
                label: "Western Sahara"
              zm:
                label: "Zambia"
              zw:
                label: "Zimbabwe"
          americas:
            label: "Americas"
            territories:
              ai:
                label: "Anguilla"
              ag:
                label: "Antigua and Barbuda"
              ar:
                label: "Argentina"
              aw:
                label: "Aruba"
              bs:
                label: "Bahamas"
              bb:
                label: "Barbados"
              bz:
                label: "Belize"
              bm:
                label: "Bermuda"
              bo:
                label: "Bolivia"
              br:
                label: "Brazil"
              vg:
                label: "British Virgin Islands"
              ca:
                label: "Canada"
              ky:
                label: "Cayman Islands"
              cl:
                label: "Chile"
              co:
                label: "Colombia"
              cr:
                label: "Costa Rica"
              cu:
                label: "Cuba"
              dm:
                label: "Dominica"
              do:
                label: "Dominican Republic"
              ec:
                label: "Ecuador"
              sv:
                label: "El Salvador"
              fk:
                label: "Falkland Islands (Malvinas)"
              gf:
                label: "French Guiana"
              gl:
                label: "Greenland"
              gd:
                label: "Grenada"
              gp:
                label: "Guadeloupe"
              gt:
                label: "Guatemala"
              gy:
                label: "Guyana"
              ht:
                label: "Haiti"
              hn:
                label: "Honduras"
              jm:
                label: "Jamaica"
              mq:
                label: "Martinique"
              mx:
                label: "Mexico"
              ms:
                label: "Montserrat"
              an:
                label: "Netherlands Antilles"
              ni:
                label: "Nicaragua"
              pa:
                label: "Panama"
              py:
                label: "Paraguay"
              pe:
                label: "Peru"
              pr:
                label: "Puerto Rico"
              bl:
                label: "Saint Barthelemy"
              kn:
                label: "Saint Kitts and Nevis"
              lc:
                label: "Saint Lucia"
              mf:
                label: "Saint Martin"
              pm:
                label: "Saint Pierre and Miquelon"
              vc:
                label: "Saint Vincent and the Grenadines"
              sr:
                label: "Suriname"
              tt:
                label: "Trinidad and Tobago"
              tc:
                label: "Turks and Caicos Islands"
              vi:
                label: "United States Virgin Islands"
              us:
                label: "United States of America"
              uy:
                label: "Uruguay"
              ve:
                label: "Venezuela"
          asia:
            label: "Asia"
            territories:
              af:
                label: "Afghanistan"
              am:
                label: "Armenia"
              az:
                label: "Azerbaijan"
              bh:
                label: "Bahrain"
              bd:
                label: "Bangladesh"
              bt:
                label: "Bhutan"
              bn:
                label: "Brunei Darussalam"
              kh:
                label: "Cambodia"
              cn:
                label: "China"
              ge:
                label: "Georgia"
              hk:
                label: "Hong Kong"
              in:
                label: "India"
              id:
                label: "Indonesia"
              ir:
                label: "Iran (Islamic Republic of)"
              iq:
                label: "Iraq"
              il:
                label: "Israel"
              jp:
                label: "Japan"
              jo:
                label: "Jordan"
              kz:
                label: "Kazakhstan"
              kp:
                label: "Korea (DPRK)"
              kw:
                label: "Kuwait"
              kg:
                label: "Kyrgyzstan"
              la:
                label: "Laos (PDR)"
              lb:
                label: "Lebanon"
              mo:
                label: "Macao"
              my:
                label: "Malaysia"
              mv:
                label: "Maldives"
              mn:
                label: "Mongolia"
              mm:
                label: "Myanmar"
              np:
                label: "Nepal"
              ps:
                label: "Occupied Palestinian Territory"
              om:
                label: "Oman"
              pk:
                label: "Pakistan"
              ph:
                label: "Philippines"
              qa:
                label: "Qatar"
              kr:
                label: "Republic of Korea"
              sa:
                label: "Saudi Arabia"
              sg:
                label: "Singapore"
              lk:
                label: "Sri Lanka"
              sy:
                label: "Syrian Arab Republic"
              tw:
                label: "Taiwan"
              tj:
                label: "Tajikistan"
              th:
                label: "Thailand"
              tl:
                label: "Timor-Leste"
              tr:
                label: "Turkey"
              tm:
                label: "Turkmenistan"
              ae:
                label: "United Arab Emirates"
              uz:
                label: "Uzbekistan"
              vn:
                label: "Viet Nam"
              ye:
                label: "Yemen"
          oceania:
            label: "Oceania"
            territories:
              as:
                label: "American Samoa"
              aq:
                label: "Antarctica"
              au:
                label: "Australia"
              bv:
                label: "Bouvet Island"
              io:
                label: "British Indian Ocean Territory"
              cx:
                label: "Christmas Island"
              cc:
                label: "Cocos (Keeling) Islands"
              ck:
                label: "Cook Islands"
              fj:
                label: "Fiji"
              pf:
                label: "French Polynesia"
              tf:
                label: "French Southern Territories"
              gu:
                label: "Guam"
              hm:
                label: "Heard and McDonald Islands"
              ki:
                label: "Kiribati"
              mh:
                label: "Marshall Islands"
              fm:
                label: "Micronesia"
              nr:
                label: "Nauru"
              nc:
                label: "New Caledonia"
              nz:
                label: "New Zealand"
              nu:
                label: "Niue"
              nf:
                label: "Norfolk Island"
              mp:
                label: "Northern Mariana Islands"
              pw:
                label: "Palau"
              pg:
                label: "Papua New Guinea"
              pn:
                label: "Pitcairn"
              ws:
                label: "Samoa"
              sb:
                label: "Solomon Islands"
              gs:
                label: "South Georgia and South Sandwich Islands"
              tk:
                label: "Tokelau"
              to:
                label: "Tonga"
              tv:
                label: "Tuvalu"
              um:
                label: "US Minor Outlying Islands"
              vu:
                label: "Vanuatu"
              wf:
                label: "Wallis and Futuna Islands"
          europe:
            label: "Europe"
            territories:
              ax:
                label: "Aland Islands"
              al:
                label: "Albania"
              ad:
                label: "Andorra"
              at:
                label: "Austria"
              by:
                label: "Belarus"
              be:
                label: "Belgium"
              ba:
                label: "Bosnia and Herzegovina"
              bg:
                label: "Bulgaria"
              hr:
                label: "Croatia"
              cy:
                label: "Cyprus"
              cz:
                label: "Czech Republic"
              dk:
                label: "Denmark"
              ee:
                label: "Estonia"
              fo:
                label: "Faeroe Islands"
              fi:
                label: "Finland"
              fr:
                label: "France"
              de:
                label: "Germany"
              gi:
                label: "Gibraltar"
              gr:
                label: "Greece"
              gg:
                label: "Guernsey"
              va:
                label: "Holy See"
              hu:
                label: "Hungary"
              is:
                label: "Iceland"
              ie:
                label: "Ireland"
              im:
                label: "Isle Of Man"
              it:
                label: "Italy"
              je:
                label: "Jersey"
              lv:
                label: "Latvia"
              li:
                label: "Liechtenstein"
              lt:
                label: "Lithuania"
              lu:
                label: "Luxembourg"
              mk:
                label: "Macedonia (frm Yugoslavia)"
              mt:
                label: "Malta"
              mc:
                label: "Monaco"
              me:
                label: "Montenegro"
              nl:
                label: "Netherlands"
              no:
                label: "Norway"
              pl:
                label: "Poland"
              pt:
                label: "Portugal"
              md:
                label: "Republic of Moldova"
              ro:
                label: "Romania"
              ru:
                label: "Russian Federation"
              sm:
                label: "San Marino"
              rs:
                label: "Serbia"
              sk:
                label: "Slovakia"
              si:
                label: "Slovenia"
              es:
                label: "Spain"
              sj:
                label: "Svalbard and Jan Mayen Islands"
              se:
                label: "Sweden"
              ch:
                label: "Switzerland"
              ua:
                label: "Ukraine"
              gb:
                label: "United Kingdom of Great Britain"

  _create: ->
    # append territory options
    if @options.sort_territories == true
      @element.append @_territory_options(@_sorted_territory_data())
    else
      @element.append @_territory_options(@options.territories || @defaults.territories)

    # attech change event listener to all territories
    @element.delegate 'input', 'change', (event) =>
      @_territory_changed $(event.target).val()

    @element.delegate 'a.check_all', 'click', (event) =>
      territory_code = $(event.target).prop('id').replace('check_all_', '')
      @_all_child_territories(territory_code).prop('checked', true)

    @element.delegate 'a.check_none', 'click', (event) =>
      territory_code = $(event.target).prop('id').replace('check_none_', '')
      @_all_child_territories(territory_code).prop('checked', false)

    if @options.checked_territories
      # uncheck all
      world_box = @_checkbox_for_territory_code('world')
      world_box.prop('checked', false)
      @_all_child_territories( world_box ).prop('checked', false)

      $.each @options.checked_territories, (index, territory_code) =>
        @_checkbox_for_territory_code(territory_code).prop('checked', true)

  _territory_changed: (territory_code) ->
    $checkbox = @_checkbox_for_territory_code territory_code
    return if $checkbox.length < 1 || @options.independent_subterritories == true

    # when a territory is changed, all child-territories change with it
    check = $checkbox.is(':checked')
    @_all_child_territories( $checkbox ).prop('checked', check)

    # when a territory is changed, all parents should be updated (in order!)
    current_checkbox = $checkbox
    while((current_checkbox = @_direct_parent_territory(current_checkbox)).length > 0)
      @_set_based_on_child_territories( current_checkbox )


  _sorted_territory_data: ->
    @_sort_territory_data_recursive(@options.territories || @defaults.territories)

  _sort_territory_data_recursive: (territories_data) ->
    sorted_data = @_sort_territory_data(territories_data)

    $.each territories_data, (territory_code, territory_data) =>
      sorted_data[territory_code].territories = @_sort_territory_data_recursive(territory_data.territories) if territory_data.territories

    return sorted_data

  _sort_territory_data: (territory_data) ->
    sorted = {}
    keys = Object.keys(territory_data).sort((a,b) -> territory_data[a].label.toLowerCase().localeCompare(territory_data[b].label.toLowerCase()))
    $.each keys, (index, key) => sorted[key] = territory_data[key]
    return sorted

  _territory_options: (territories_data) ->
    result = $('<ul class="territory_options"></ul>')

    $.each territories_data, (territory_code, territory_data) =>
      option = @_territory_option(territory_code, territory_data.label)
      # add check all/none macro links IF this territory has sub-territories
      option.append( @_territory_macro_links(territory_code) ) if territory_data.territories && @options.independent_subterritories == true
      # add sub territories
      option.append @_territory_options(territory_data.territories) if territory_data.territories

      result.append option
   
    result

  _territory_option: (territory_code, territory_label, options) ->
    option = $('<li></li>')
    option.append( @_territory_checkbox(territory_code, options) )
    option.append( @_territory_label(territory_code, territory_label, options) )
    option

  _territory_checkbox: (territory_code, options) ->
    $('<input id="territory_'+territory_code+'" class="territory" value="'+territory_code+'" type="checkbox" name="territories['+territory_code+']" checked="checked" />')

  _territory_label: (territory_code, territory_label, options) ->
    $('<label id="territory_'+territory_code+'_name" for="territory_'+territory_code+'">'+territory_label+'</label>')

  _territory_macro_links: (territory_code) ->
    all = '<a href="#" id="check_all_'+territory_code+'" class="check_all">All</a>'
    none = '<a href="#" id="check_none_'+territory_code+'" class="check_none">None</a>'
    $(all + none)

  _all_child_territories: ($checkbox) ->
    # first make sure that we have a jQuery object, if not, expect it to be a territory code
    $checkbox = @element.find('input.territory#territory_'+$checkbox) if !$checkbox.siblings
    $checkbox.siblings('ul.territory_options').find('input.territory')

  # _all_parent_territories: ($checkbox) ->
  #   $checkbox.parents('ul.territory_options').siblings('input.territory')

  _direct_parent_territory: ($checkbox) ->
    $checkbox.parent().parent().siblings('input.territory')

  _set_based_on_child_territories: ($checkbox) ->
    $checkbox.prop('checked', @_all_child_territories($checkbox).filter(':not(:checked)').length <= 0)

  _checkbox_for_territory_code: (territory_code) ->
    @element.find('input.territory#territory_'+territory_code)

  all_checked_territory_codes: ->
    result = []
    @element.find('input.territory:checked').each (index, checkbox) =>
      result.push $(checkbox).val()
    result

  checked_territory_codes: ->
    result = []

    # loop over all checked territory checkboxes
    @element.find('input.territory:checked').each (index, checkbox) =>
      # only add to result array if there is not a (direct) parent that is checked as well
      if !((parent = @_direct_parent_territory($(checkbox))).length > 0 && parent.is(':checked'))
        result.push $(checkbox).val()

    return result

# register jquery widget
$.widget 'fuga.territoryPicker', new TerritoryPicker



