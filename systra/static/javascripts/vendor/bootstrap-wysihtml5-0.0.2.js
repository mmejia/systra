!function(e,t){"use strict";var n={"font-styles":"<li class='dropdown'><a class='btn dropdown-toggle' data-toggle='dropdown' href='#'><i class='icon-font'></i>&nbsp;<span class='current-font'>Normal text</span>&nbsp;<b class='caret'></b></a><ul class='dropdown-menu'><li><a data-wysihtml5-command='formatBlock' data-wysihtml5-command-value='div'>Normal text</a></li><li><a data-wysihtml5-command='formatBlock' data-wysihtml5-command-value='h1'>Heading 1</a></li><li><a data-wysihtml5-command='formatBlock' data-wysihtml5-command-value='h2'>Heading 2</a></li></ul></li>",emphasis:"<li><div class='btn-group'><a class='btn' data-wysihtml5-command='bold' title='CTRL+B'>Bold</a><a class='btn' data-wysihtml5-command='italic' title='CTRL+I'>Italic</a></div></li>",lists:"<li><div class='btn-group'><a class='btn' data-wysihtml5-command='insertUnorderedList' title='Unordered List'><i class='icon-list'></i></a><a class='btn' data-wysihtml5-command='insertOrderedList' title='Ordered List'><i class='icon-th-list'></i></a><a class='btn' data-wysihtml5-command='Outdent' title='Outdent'><i class='icon-indent-right'></i></a><a class='btn' data-wysihtml5-command='Indent' title='Indent'><i class='icon-indent-left'></i></a></div></li>",link:"<li><div class='bootstrap-wysihtml5-insert-link-modal modal hide fade'><div class='modal-header'><a class='close' data-dismiss='modal'>×</a><h3>Insert Link</h3></div><div class='modal-body'><input value='http://' class='bootstrap-wysihtml5-insert-link-url input-xlarge'></div><div class='modal-footer'><a href='#' class='btn' data-dismiss='modal'>Cancel</a><a href='#' class='btn btn-primary' data-dismiss='modal'>Insert link</a></div></div><a class='btn' data-wysihtml5-command='createLink' title='Link'><i class='icon-share'></i></a></li>",image:"<li><div class='bootstrap-wysihtml5-insert-image-modal modal hide fade'><div class='modal-header'><a class='close' data-dismiss='modal'>×</a><h3>Insert Image</h3></div><div class='modal-body'><input value='http://' class='bootstrap-wysihtml5-insert-image-url input-xlarge'></div><div class='modal-footer'><a href='#' class='btn' data-dismiss='modal'>Cancel</a><a href='#' class='btn btn-primary' data-dismiss='modal'>Insert image</a></div></div><a class='btn' data-wysihtml5-command='insertImage' title='Insert image'><i class='icon-picture'></i></a></li>",html:"<li><div class='btn-group'><a class='btn' data-wysihtml5-action='change_view' title='Edit HTML'><i class='icon-pencil'></i></a></div></li>"},r={"font-styles":!0,emphasis:!0,lists:!0,html:!1,link:!0,image:!0,events:{},parserRules:{tags:{b:{},i:{},br:{},ol:{},ul:{},li:{},h1:{},h2:{},u:1,img:{check_attributes:{width:"numbers",alt:"alt",src:"url",height:"numbers"}},a:{set_attributes:{target:"_blank",rel:"nofollow"},check_attributes:{href:"url"}}}}},i=function(t,n){this.el=t,this.toolbar=this.createToolbar(t,n||r),this.editor=this.createEditor(n),window.editor=this.editor,e("iframe.wysihtml5-sandbox").each(function(t,n){e(n.contentWindow).off("focus.wysihtml5").on({"focus.wysihtml5":function(){e("li.dropdown").removeClass("open")}})})};i.prototype={constructor:i,createEditor:function(e){var n=r.parserRules;e&&e.parserRules&&(n=e.parserRules);var i=new t.Editor(this.el.attr("id"),{toolbar:this.toolbar.attr("id"),parserRules:n});if(e&&e.events)for(var s in e.events)i.on(s,e.events[s]);return i},createToolbar:function(t,i){var s=this,o=e("<ul/>",{id:t.attr("id")+"-wysihtml5-toolbar","class":"wysihtml5-toolbar",style:"display:none"});for(var u in r){var a=!1;i[u]!=undefined?i[u]==1&&(a=!0):a=r[u],a==1&&(o.append(n[u]),u=="html"&&this.initHtml(o),u=="link"&&this.initInsertLink(o),u=="image"&&this.initInsertImage(o))}var s=this;return o.find("a[data-wysihtml5-command='formatBlock']").click(function(t){var n=e(t.srcElement);s.toolbar.find(".current-font").text(n.html())}),this.el.before(o),o},initHtml:function(e){var t="a[data-wysihtml5-action='change_view']";e.find(t).click(function(n){e.find("a.btn").not(t).toggleClass("disabled")})},initInsertImage:function(e){var t=this,n=e.find(".bootstrap-wysihtml5-insert-image-modal"),r=n.find(".bootstrap-wysihtml5-insert-image-url"),i=n.find("a.btn-primary"),s=r.val(),o=function(){var e=r.val();r.val(s),t.editor.composer.commands.exec("insertImage",e)};r.keypress(function(e){e.which==13&&(o(),n.modal("hide"))}),i.click(o),n.on("shown",function(){r.focus()}),n.on("hide",function(){t.editor.currentView.element.focus()}),e.find("a[data-wysihtml5-command=insertImage]").click(function(){n.modal("show")})},initInsertLink:function(e){var t=this,n=e.find(".bootstrap-wysihtml5-insert-link-modal"),r=n.find(".bootstrap-wysihtml5-insert-link-url"),i=n.find("a.btn-primary"),s=r.val(),o=function(){var e=r.val();r.val(s),t.editor.composer.commands.exec("createLink",{href:e,target:"_blank",rel:"nofollow"})},u=!1;r.keypress(function(e){e.which==13&&(o(),n.modal("hide"))}),i.click(o),n.on("shown",function(){r.focus()}),n.on("hide",function(){t.editor.currentView.element.focus()}),e.find("a[data-wysihtml5-command=createLink]").click(function(){n.modal("show")})}},e.fn.wysihtml5=function(t){return this.each(function(){var n=e(this);n.data("wysihtml5",new i(n,t))})},e.fn.wysihtml5.Constructor=i}(window.jQuery,window.wysihtml5)