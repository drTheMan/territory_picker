// Generated by CoffeeScript 1.6.3
(function() {
  var $, TerritoryIncluder, root, _ref,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  root = this;

  $ = jQuery;

  TerritoryIncluder = (function(_super) {
    __extends(TerritoryIncluder, _super);

    function TerritoryIncluder() {
      _ref = TerritoryIncluder.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    TerritoryIncluder.prototype._create = function() {
      var _this = this;
      TerritoryIncluder.__super__._create.call(this);
      this._add_territory_id_to_containers();
      this._turn_into_include_options();
      jQuery.each(this.options.included_territory_codes || [], function(idx, territory_code) {
        return _this._perform_include_on(territory_code);
      });
      jQuery.each(this.options.excluded_territory_codes || [], function(idx, territory_code) {
        return _this._perform_exclude_on(territory_code);
      });
      this.element.delegate('a.include', 'click', function(event) {
        event.preventDefault();
        event.stopPropagation();
        return _this._perform_include_on($(event.target).parent().prop('id').replace('territory_', ''));
      });
      return this.element.delegate('a.exclude', 'click', function(event) {
        event.preventDefault();
        event.stopPropagation();
        return _this._perform_exclude_on($(event.target).parent().prop('id').replace('territory_', ''));
      });
    };

    TerritoryIncluder.prototype._add_territory_id_to_containers = function() {
      return this.element.find('input').each(function(idx, inputEl) {
        var el;
        el = $(inputEl);
        return el.parent().prop('id', el.prop('id'));
      });
    };

    TerritoryIncluder.prototype._turn_into_include_options = function() {
      return this.element.find('input').each(function(idx, inputEl) {
        var el, excludeEl, includeEl;
        el = $(inputEl);
        includeEl = $('<a href="#" class="include">+</a>');
        excludeEl = $('<a href="#" class="exclude">-</a>');
        el.after(includeEl);
        return el.after(excludeEl);
      });
    };

    TerritoryIncluder.prototype._perform_include_on = function(territory_code) {
      var parent_code;
      if (this._territory_inclusion_state(territory_code) === 'included') {
        this._uninclude_territory_recursive(territory_code);
      } else {
        this._include_territory_recursive(territory_code);
      }
      if (parent_code = this._parent_code(territory_code)) {
        return this._update_inclusion_territory(parent_code);
      }
    };

    TerritoryIncluder.prototype._perform_exclude_on = function(territory_code) {
      var parent_code;
      if (this._territory_inclusion_state(territory_code) === 'excluded') {
        this._unexclude_territory_recursive(territory_code);
      } else {
        this._exclude_territory_recursive(territory_code);
      }
      if (parent_code = this._parent_code(territory_code)) {
        return this._update_inclusion_territory(parent_code);
      }
    };

    TerritoryIncluder.prototype._update_inclusion_territory = function(code) {
      var all, excluded, included;
      all = this._all_child_territory_containers(code);
      included = this._all_child_territory_containers(code, '.included');
      excluded = this._all_child_territory_containers(code, '.excluded');
      if (all.length === included.length) {
        this._include_territory(code);
        return;
      }
      if (all.length === excluded.length) {
        this._exclude_territory(code);
        return;
      }
      this._uninclude_territory(code);
      return this._unexclude_territory(code);
    };

    TerritoryIncluder.prototype._territory_inclusion_state = function(code) {
      var el;
      el = this.element.find('li#territory_' + code);
      if (el.hasClass('included')) {
        return 'included';
      }
      if (el.hasClass('excluded')) {
        return 'excluded';
      }
      return null;
    };

    TerritoryIncluder.prototype._include_territory = function(code) {
      return this.element.find('li#territory_' + code).addClass('included').removeClass('excluded');
    };

    TerritoryIncluder.prototype._include_territory_recursive = function(code) {
      var _this = this;
      this._include_territory(code);
      return this._all_child_territory_containers(code).each(function(idx, containerEl) {
        return _this._include_territory_recursive($(containerEl).prop('id').replace('territory_', ''));
      });
    };

    TerritoryIncluder.prototype._uninclude_territory = function(code) {
      return this.element.find('li#territory_' + code).removeClass('included');
    };

    TerritoryIncluder.prototype._uninclude_territory_recursive = function(code) {
      var _this = this;
      this._uninclude_territory(code);
      return this._all_child_territory_containers(code).each(function(idx, containerEl) {
        return _this._uninclude_territory_recursive($(containerEl).prop('id').replace('territory_', ''));
      });
    };

    TerritoryIncluder.prototype._exclude_territory = function(code) {
      return this.element.find('li#territory_' + code).addClass('excluded').removeClass('included');
    };

    TerritoryIncluder.prototype._exclude_territory_recursive = function(code) {
      var _this = this;
      this._exclude_territory(code);
      return this._all_child_territory_containers(code).each(function(idx, containerEl) {
        return _this._exclude_territory_recursive($(containerEl).prop('id').replace('territory_', ''));
      });
    };

    TerritoryIncluder.prototype._unexclude_territory = function(code) {
      return this.element.find('li#territory_' + code).removeClass('excluded');
    };

    TerritoryIncluder.prototype._unexclude_territory_recursive = function(code) {
      var _this = this;
      this._unexclude_territory(code);
      return this._all_child_territory_containers(code).each(function(idx, containerEl) {
        return _this._unexclude_territory_recursive($(containerEl).prop('id').replace('territory_', ''));
      });
    };

    TerritoryIncluder.prototype._all_child_territory_containers = function(code, selector) {
      if (selector === void 0) {
        selector = '';
      }
      return this.element.find('li#territory_' + code + ' > ul.territory_options > li' + selector);
    };

    TerritoryIncluder.prototype._parent_code = function(code) {
      var el;
      el = this.element.find('li#territory_' + code).parent().parent();
      if (el.prop('id').match(/^territory_/)) {
        return el.prop('id').replace(/^territory_/, '');
      }
      return null;
    };

    TerritoryIncluder.prototype.all_included_territory_codes = function() {
      var result;
      result = [];
      this.element.find('li.included').each(function(idx, el) {
        return result.push($(el).prop('id').replace('territory_', ''));
      });
      return result;
    };

    TerritoryIncluder.prototype.all_excluded_territory_codes = function() {
      var result;
      result = [];
      this.element.find('li.excluded').each(function(idx, el) {
        return result.push($(el).prop('id').replace('territory_', ''));
      });
      return result;
    };

    TerritoryIncluder.prototype.included_territory_codes = function() {
      var result;
      result = [];
      this.element.find('li.included').each(function(idx, el) {
        if (!$(el).parent().parent().hasClass('included')) {
          return result.push($(el).prop('id').replace('territory_', ''));
        }
      });
      return result;
    };

    TerritoryIncluder.prototype.excluded_territory_codes = function() {
      var result;
      result = [];
      this.element.find('li.excluded').map(function(idx, el) {
        if (!$(el).parent().parent().hasClass('excluded')) {
          return result.push($(el).prop('id').replace('territory_', ''));
        }
      });
      return result;
    };

    return TerritoryIncluder;

  })(TerritoryPicker);

  $.widget('fuga.territoryIncluder', new TerritoryIncluder);

}).call(this);
