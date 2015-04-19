(function($){
    $.fn.validationEngineLanguage = function(){
    };
    $.validationEngineLanguage = {
        newLang: function(){
    	 	var pathName = document.location.pathname;
    	    var index = pathName.substr(1).indexOf("/");
    	    var context_path = pathName.substr(0,index+1);
            $.validationEngineLanguage.allRules = {
                "required": { // Add your regex rules here, you can take telephone as an example
                    "regex": "none",
                    "alertText": "* 此处不可空白",
                    "alertTextCheckboxMultiple": "* 请选择一个复选框",
                    "alertTextCheckboxe": "* 您必须钩选此栏",
                    "alertTextDateRange": "* 日期范围不可空白"
                },
                "requiredInFunction": { 
                    "func": function(field, rules, i, options){
                        return (field.val() == "test") ? true : false;
                    },
                    "alertText": "* Field must equal test"
                },
                "effe":{
                	"regex":"none",
                	"alertText":'* 无效的 ',
                	"alertText2":" 编号"
                },
                "dateRange": {
                    "regex": "none",
                    "alertText": "* 无效的 ",
                    "alertText2": " 日期范围"
                },
                "dateTimeRange": {
                    "regex": "none",
                    "alertText": "* 无效的 ",
                    "alertText2": " 时间范围"
                },
                "minSize": {
                    "regex": "none",
                    "alertText": "* 最少 ",
                    "alertText2": " 个字符"
                },
                "maxSize": {
                    "regex": "none",
                    "alertText": "* 最多 ",
                    "alertText2": " 个字符"
                },
				"groupRequired": {
                    "regex": "none",
                    "alertText": "* 你必需选填其中一个栏位"
                },
                "min": {
                    "regex": "none",
                    "alertText": "* 最小值为 "
                },
                "max": {
                    "regex": "none",
                    "alertText": "* 最大值为 "
                },
                "past": {
                    "regex": "none",
                    "alertText": "* 日期必需早于 "
                },
                "future": {
                    "regex": "none",
                    "alertText": "* 日期必需晚于 "
                },	
                "maxCheckbox": {
                    "regex": "none",
                    "alertText": "* 最多选择 ",
                    "alertText2": " 个"
                },
                "minCheckbox": {
                    "regex": "none",
                    "alertText": "* 至少选择 ",
                    "alertText2": " 个"
                },
                "equals": {
                    "regex": "none",
                    "alertText": "* 请输入与上面相同的密码"
                },
                "creditCard": {
                    "regex": "none",
                    "alertText": "* 无效的信用卡号码"
                },
                "phone": {
                    // credit: jquery.h5validate.js / orefalo
                    "regex": /^([\+][0-9]{1,3}[ \.\-])?([\(]{1}[0-9]{2,6}[\)])?([0-9 \.\-\/]{3,20})((x|ext|extension)[ ]?[0-9]{1,4})?$/,
                    "alertText": "* 无效的电话号码"
                },
                "email": {
                    // Shamelessly lifted from Scott Gonzalez via the Bassistance Validation plugin http://projects.scottsplayground.com/email_address_validation/
                    "regex": /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i,
                    "alertText": "* 无效的邮件地址"
                },
                "integer": {
                    "regex": /^[\-\+]?\d+$/,
                    "alertText": "* 无效的整数"
                },
                "number": {
                    // Number, including positive, negative, and floating decimal. credit: orefalo
                    //"regex": /^[\-\+]?((([0-9]{1,3})([,][0-9]{3})*)|([0-9]+))?([\.]([0-9]+))?$/,
                    //去掉类似38,000,000的逗点
                	"regex": /^[\-\+]?([0-9]+)?([\.]([0-9]+))?$/,
                    "alertText": "* 无效的数字"
                },
                "score":{
                    "regex": /^[\-\+]?((([0-9]{1,3})([,][0-9]{3})*)|([0-9]+))?([\.]([0-9]{0,2}))?$/,
					"alertText":"* 无效的数字,最多保留两位小数"
				},
                "date": {
                    "regex": /^\d{4}[\/\-](0?[1-9]|1[012])[\/\-](0?[1-9]|[12][0-9]|3[01])$/,
                    "alertText": "* 无效的日期，格式必需为 YYYY-MM-DD"
                },
                "ipv4": {
                    "regex": /^((([01]?[0-9]{1,2})|(2[0-4][0-9])|(25[0-5]))[.]){3}(([0-1]?[0-9]{1,2})|(2[0-4][0-9])|(25[0-5]))$/,
                    "alertText": "* 无效的 IP地址"
                },
                "url": {
                    "regex": /^(https?|ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(\#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i,
                    "alertText": "* 无效的URL"
                },
                "onlyNumberSp": {
                    "regex": /^[0-9\ ]+$/,
                    "alertText": "* 只能填数字"
                },
                "onlyChinese": {
                    "regex": /^[\u4e00-\u9fa5]+$/,
                    "alertText": "* 只能输入中文"
                },
                "onlyLetterSp": {
                    "regex": /^[a-zA-Z\ \']+$/,
                    "alertText": "* 只接受英文字母大小写"
                },
                "onlyLetterNumber": {
                    "regex": /^[0-9a-zA-Z]+$/,
                    "alertText": "* 不接受特殊字符"
                },
                // --- CUSTOM RULES -- Those are specific to the demos, they can be removed or changed to your likings
                "ajaxUserCall": {
                    "url": "ajaxValidateFieldUser",
                    // you may want to pass extra data on the ajax call
                    "extraData": "name=eric",
                    "alertText": "* 此名称已被其他人使用",
                    "alertTextLoad": "* 正在确认名称是否有其他人使用，请稍等。"
                },
				"ajaxUserCallPhp": {
                    "url": "phpajax/ajaxValidateFieldUser.php",
                    // you may want to pass extra data on the ajax call
                    "extraData": "name=eric",
                    // if you provide an "alertTextOk", it will show as a green prompt when the field validates
                    "alertTextOk": "* 此帐号名称可以使用",
                    "alertText": "* 此名称已被其他人使用",
                    "alertTextLoad": "* 正在确认帐号名称是否有其他人使用，请稍等。"
                },
                "ajaxNameCall": {
                    // remote json service location
                    "url": "ajaxValidateFieldName",
                    // error
                    "alertText": "* 此名称可以使用",
                    // if you provide an "alertTextOk", it will show as a green prompt when the field validates
                    "alertTextOk": "* 此名称已被其他人使用",
                    // speaks by itself
                    "alertTextLoad": "* 正在确认名称是否有其他人使用，请稍等。"
                },
				 "ajaxNameCallPhp": {
	                    // remote json service location
	                    "url": "phpajax/ajaxValidateFieldName.php",
	                    // error
	                    "alertText": "* 此名称已被其他人使用",
	                    // speaks by itself
	                    "alertTextLoad": "* 正在确认名称是否有其他人使用，请稍等。"
	                },
                "validate2fields": {
                    "alertText": "* 请输入 HELLO"
                },
	            //tls warning:homegrown not fielded 
                "dateFormat":{
                    "regex": /^\d{4}[\/\-](0?[1-9]|1[012])[\/\-](0?[1-9]|[12][0-9]|3[01])\s+(1[012]|0?[1-9]){1}:(0?[1-5]|[0-6][0-9]){1}:(0?[0-6]|[0-6][0-9]){1}$|^(?:(?:(?:0?[13578]|1[02])(\/|-)31)|(?:(?:0?[1,3-9]|1[0-2])(\/|-)(?:29|30)))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^((1[012]|0?[1-9]){1}\/(0?[1-9]|[12][0-9]|3[01]){1}\/\d{2,4}\s+(1[012]|0?[1-9]){1}:(0?[1-5]|[0-6][0-9]){1}:(0?[0-6]|[0-6][0-9]){1})$/,
                    "alertText": "* 无效的日期格式"
                },
                //tls warning:homegrown not fielded 
				"dateTimeFormat": {
	                "regex": /^\d{4}[\/\-](0?[1-9]|1[012])[\/\-](0?[1-9]|[12][0-9]|3[01])\s+(1[012]|0?[1-9]){1}:(0?[1-5]|[0-6][0-9]){1}:(0?[0-6]|[0-6][0-9]){1}$/,
                    "alertText": "* 无效的日期或时间格式,可接受的格式：yyyy-mm-dd hh:mm:ss",
                    "alertText2": "可接受的格式： ",
                    "alertText3": "mm/dd/yyyy hh:mm:ss AM|PM 或 ", 
                    "alertText4": "yyyy-mm-dd hh:mm:ss"
	            },
	            "chinese":{
					"regex":/^[\u4E00-\u9FA5]+$/,
					"alertText":"* 只能填写中文汉字"
				},
				"chinaId":{
					/**
					 * 2013年1月1日起第一代身份证已停用，此处仅验证 18 位的身份证号码
					 * 如需兼容 15 位的身份证号码，请使用宽松的 chinaIdLoose 规则
					 * /^[1-9]\d{5}[1-9]\d{3}(
					 * 	(
					 * 		(0[13578]|1[02])
					 * 		(0[1-9]|[12]\d|3[01])
					 * 	)|(
					 * 		(0[469]|11)
					 * 		(0[1-9]|[12]\d|30)
					 * 	)|(
					 * 		02
					 * 		(0[1-9]|[12]\d)
					 * 	)
					 * )(\d{4}|\d{3}[xX])$/i
					 */
					"regex":/^[1-9]\d{5}[1-9]\d{3}(((0[13578]|1[02])(0[1-9]|[12]\d|3[0-1]))|((0[469]|11)(0[1-9]|[12]\d|30))|(02(0[1-9]|[12]\d)))(\d{4}|\d{3}[xX])$/,
					"alertText":"* 无效的身份证件号码"
				},
				"chinaZip":{
					"regex":/^\d{6}$/,
					"alertText":"* 无效的邮政编码"
				},
                "ajaxBidSite": {
                    "url": context_path + "/business/ggzybidsites/json/valid",
                    // you may want to pass extra data on the ajax call
                    "alertText": "* 标厅预约已满",
                    "alertTextOk": "* 可预约",
                    "alertTextLoad": "* 正在查询标厅预约情况，请稍等。"
                },
                orgCode:{
                	"regex": /^[0-9a-zA-Z]{8}-[0-9a-zA-Z]{1}$|^[0-9a-zA-Z]{9}$/,
                	"alertText":"* 无效的组织机构代码"
                }
            };
            
        }
    };
    $.validationEngineLanguage.newLang();
})(jQuery);
