$.fn.extend({
	selectReadOnly : function() {
		var v_ = $(this).val();
		var tem = $(this).children('option').index($("option:selected"));
		$(this).change(function() {
			$(this).children('option').eq(tem).attr("selected", true);
			// $(this).val(v_);return;
		});
	},
	readOnly : function() {
		$(this).removeAttr("onfocus").removeAttr("onclick").removeAttr("onblur").attr('readonly', true);
		$.each($(this), function(index, item) {
			if ($(this).attr("class"))
				$(this).attr("class", $(this).attr("class").replaceAll("ajax", ""));
		});
		$(this).parent().find(".btnLook").toggle();
	}
});

$.extend(String.prototype, {
	format : function(args) {
		var result = this;
		if (arguments.length > 0) {
			if (arguments.length == 1 && typeof (args) == "object") {
				for ( var key in args) {
					if (args[key] != undefined) {
						var reg = new RegExp("({" + key + "})", "g");
						result = result.replace(reg, args[key]);
					}
				}
			} else {
				for ( var i = 0; i < arguments.length; i++) {
					if (arguments[i] != undefined) {
						var reg = new RegExp("({)" + i + "(})", "g");
						result = result.replace(reg, arguments[i]);
					}
				}
			}
		}
		return result;
	}
});

$.extend(Array.prototype, {
	remove : function(el) {
		return this.splice(this.indexOf(el), 1);
	}
});

$.extend({
	id_index_ : 0,
	id : function() {
		$.id_index_++;
		return 'component_{0}'.format($.id_index_);
	}
});

/**
 * 如果td内容相同,合并单元格
 */
jQuery.fn.rowspan = function(options) {
	var defaults = {};
	var options = $.extend(defaults, options);
	this.each(function() {

		var tds = $(this).find("tbody td:nth-child(" + options.td + ")");
		var current_td = tds.eq(0);
		var k = 1;
		tds.each(function(index, element) {
			if ($(this).text() == current_td.text() && index != 0) {
				k++;
				$(this).remove();
				current_td.attr("rowspan", k);
				current_td.css("vertical-align", "middle");
			} else {
				current_td = $(this);
				k = 1;
			}
		});
	});
};

/**
 * ie8 Array无indexOf方法
 */
if (!Array.prototype.indexOf) {
	Array.prototype.indexOf = function(elt /* , from */) {
		var len = this.length >>> 0;

		var from = Number(arguments[1]) || 0;
		from = (from < 0) ? Math.ceil(from) : Math.floor(from);
		if (from < 0)
			from += len;

		for (; from < len; from++) {
			if (from in this && this[from] === elt)
				return from;
		}
		return -1;
	};
}
