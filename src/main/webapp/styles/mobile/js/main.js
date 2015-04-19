$(document).ready(function() {
	$("div.titall div.brief").attr("id", function() {
		return idNumber("No") + $("div.titall div.brief").index(this)
	});
	$("div.twobtun div.btun").click(function() {
		var dex = $("div.twobtun div.btun").index(this);
		$("#No" + dex).siblings().hide();
		$("#No" + dex).show();
		$(this).removeClass("btun2");
		$(this).addClass("btun1").siblings().removeClass("btun1");
		$(this).siblings().addClass("btun2");
	});
	function idNumber(prefix) {
		var idNum = prefix;
		return idNum;
	}
});
$.extend({
	getCtxPath : function() {
		var pathName = document.location.pathname;
		var index = pathName.substr(1).indexOf("/");
		var result = pathName.substr(0, index + 1);
		return result;
	}
});

/**
 * 手机端表单提交
 * 
 * @param form
 * @param callback
 * @param confirmMsg
 * @returns {Boolean}
 */
function validateCallback(form, callback, confirmMsg) {
	try {
		var $form = $(form);
		var _submitFn = function() {
			$.ajax({
				type : $form.attr('method') || 'POST',
				url : $form.attr("action"),
				data : $form.serializeArray(),
				dataType : "json",
				cache : false,
				success : function(json) {
					if (json.statusCode == 300) {
						if (json.message)
							alert(json.message);
					} else if (json.statusCode == 301) {
						alert("会话超时,请重新登录");
						location.href = $.getCtxPath() + "/login";
					} else if (json.statusCode == 403) {
						if(confirm("权限不足,是否切换用户"))
							location.href = $.getCtxPath() + "/login";
					} else {
						alert(json.message || "保存成功");
						callback.call(this, json);
					}
					
				}
			});
		};

		if (confirmMsg) {
			if (confirm(confirmMsg)) {
				_submitFn();
			}
			;
		} else {
			_submitFn();
		}
	} catch (e) {
	} finally {
		window.event.returnValue = false;
		return false;
	}
}