<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
    	String path = request.getContextPath();
    %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>UEditor示例</title>
<!-- 引用UEditor的配置文件 -->
<script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/ueditor.config.js"></script>
<!-- 引用UEditor的全部主文件 -->
<script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/ueditor.all.min.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
	/* 获得全部HTML的内容 */
	function getAllHtml() {
		alert(UE.getEditor('editor').getAllHtml());
	}
	/* 获得编辑框里的内容 */
	function getContent() {
		alert(UE.getEditor('editor').getContent());
	}
	/* 向编辑框中追加或写入内容，如果isAppendTo为true，则是追加内容，否则是替换 */
	function setContent(isAppendTo) {
		var arr = [];
        arr.push("使用UE.getEditor('editor').setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
        UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
        alert(arr.join("\n"));
	}
	/* 获取纯文本内容 */
	function getContentTxt() {
		alert(UE.getEditor('editor').getContentTxt());
	}
	/* 获取带格式的纯文本 */
	function getPlainTxt() {
        alert(UE.getEditor('editor').getPlainTxt())
    }
	/* 判断编辑框内是否有内容 */
	function hasContent() {
        var arr = [];
        arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
        arr.push("判断结果为：");
        arr.push(UE.getEditor('editor').hasContents());
        alert(arr.join("\n"));
    }
	/* 使编辑器获得焦点 */
	function setFocus() {
        UE.getEditor('editor').focus();
    }
	/* 判断编辑器是否获得焦点 */
	function isFocus(e){
        alert(UE.getEditor('editor').isFocus());
        UE.dom.domUtils.preventDefault(e);
    }
	/* 使编辑器失去焦点 */
    function setblur(e){
        UE.getEditor('editor').blur();
        UE.dom.domUtils.preventDefault(e);
    }
	/* 获取选中的文本内容 */
	function getText() {
        //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
        var range = UE.getEditor('editor').selection.getRange();
        range.select();
        var txt = UE.getEditor('editor').selection.getText();
        alert(txt)
    }
	/* 插入给定的内容 */
	function insertHtml() {
        var value = prompt('插入html代码', '');
        UE.getEditor('editor').execCommand('insertHtml', value)
    }
	/* 设置可以编辑 */
	function setEnabled() {
        UE.getEditor('editor').setEnabled();
        enableBtn();
    }
	/* 设置不可编辑 */
	function setDisabled() {
        UE.getEditor('editor').setDisabled('fullscreen');
        disableBtn("enable");
    }
	/* 隐藏编辑器 */
	function setHide() {
		UE.getEditor('editor').setHide();
	}
	/* 显示编辑器 */
	function setShow() {
		UE.getEditor('editor').setShow()
	}
	/* 设置高度为指定高度默认关闭了自动长高 */
	function setHeight(height) {
		UE.getEditor('editor').setHeight(height);
	}
	/* 获取草稿箱的内容 */
	function getLocalData () {
        alert(UE.getEditor('editor').execCommand( "getlocaldata" ));
    }
	/* 清空草稿箱 */
    function clearLocalData () {
        UE.getEditor('editor').execCommand( "clearlocaldata" );
        alert("已清空草稿箱");
    }
    /* 创建编辑器 */
    function createEditor() {
        enableBtn();
        UE.getEditor('editor');
    }
    /* 将按钮全部设置为可用状态 */
    function enableBtn() {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
        }
    }
	/* 删除编辑器 */
    function deleteEditor() {
        disableBtn();
        UE.getEditor('editor').destroy();
    }
	/* 禁用按钮 */
    function disableBtn(str) {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            if (btn.id == str) {
                UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
            } else {
                btn.setAttribute("disabled", "true");
            }
        }
    }
    

    
</script>
</head>
<body>
	<script id="editor" type="text/plain" style="width:1024px;height:300px;"></script>
	<div id="btns">
		<br /><br />
		<button onclick="getAllHtml()">获取整个HTML的内容</button>
		<button onclick="getContent()">获得内容</button>
		<button onclick="setContent()">写入内容</button>
		<button onclick="setContent(true)">追加内容</button>
		<button onclick="getContentTxt()">获得纯文本</button>
		<button onclick="getPlainTxt()">获得带格式的纯文本</button>
		<button onclick="hasContent()">判断是否有内容</button>
		<button onclick="setFocus()">使编辑器获得焦点</button>
		<button onmousedown="isFocus(event)">编辑器是否获得焦点</button>
		<button onmousedown="setblur(event)">编辑器失去焦点</button>
		<br /><br />
		<button onclick="getText()">获得当前选中的文本</button>
		<button onclick="insertHtml()">插入给定的内容</button>
		<button id="enable" onclick="setEnabled()">可以编辑</button>
		<button onclick="setDisabled()">不可编辑</button>
		<button onclick="setHide()">隐藏编辑器</button>
		<button onclick="setShow()">显示编辑器</button>
		<button onclick="setHeight(500)">设置高度为300默认关闭了自动长高</button>
		<br /><br />
		<button onclick="getLocalData()">获取草稿箱内容</button>
		<button onclick="clearLocalData()">清空草稿箱</button>

	</div>
	<br /><br />
	<button onclick="createEditor()">创建编辑器</button>
	<button onclick="deleteEditor()">删除编辑器</button>
</body>
<script type="text/javascript">
	//实例化编辑器
	//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
	var ue = UE.getEditor('editor');

	ue.ready(function() {
		ue.setHeight(300);
	});
</script>
</html>