!function(e){"function"==typeof define&&define.amd?define("picker",["jquery"],e):this.Picker=e(jQuery)}(function(e){function t(r,i,s,o){function u(){return t._.node("div",t._.node("div",t._.node("div",t._.node("div",d.component.nodes(f.open),c.box),c.wrap),c.frame),c.holder)}function a(e){e.stopPropagation(),"focus"==e.type&&d.$root.addClass(c.focused),d.open()}if(!r)return t;var f={id:Math.abs(~~(1e9*Math.random()))},l=s?e.extend(!0,{},s.defaults,o):o||{},c=e.extend({},t.klasses(),l.klass),h=e(r),p=function(){return this.start()},d=p.prototype={constructor:p,$node:h,start:function(){return f&&f.start?d:(f.methods={},f.start=!0,f.open=!1,f.type=r.type,r.autofocus=r==document.activeElement,r.type="text",r.readOnly=!0,d.component=new s(d,l),d.$root=e(t._.node("div",u(),c.picker)).on({focusin:function(e){d.$root.removeClass(c.focused),e.stopPropagation()},mousedown:function(e){e.target!=d.$root.children()[0]&&e.stopPropagation()},click:function(n){var i=n.target,s=i.attributes.length?e(i):e(i).closest("[data-pick]"),o=s.data();i!=d.$root.children()[0]&&(n.stopPropagation(),e.contains(d.$root[0],document.activeElement)||r.focus(),o.nav&&!s.hasClass(c.navDisabled)?d.set("highlight",d.component.item.highlight,{nav:o.nav}):t._.isInteger(o.pick)&&!s.hasClass(c.disabled)?d.set("select",o.pick).close(!0):o.clear&&d.clear().close(!0))}}),l.formatSubmit&&(d._hidden=e('<input type=hidden name="'+r.name+(l.hiddenSuffix||"_submit")+'"'+(h.data("value")?' value="'+t._.trigger(d.component.formats.toString,d.component,[l.formatSubmit,d.component.item.select])+'"':"")+">")[0]),h.addClass(c.input).on("focus.P"+f.id+" click.P"+f.id,a).on("change.P"+f.id,function(){d._hidden&&(d._hidden.value=r.value?t._.trigger(d.component.formats.toString,d.component,[l.formatSubmit,d.component.item.select]):"")}).on("keydown.P"+f.id,function(e){var t=e.keyCode,n=/^(8|46)$/.test(t);return 27==t?(d.close(),!1):((32==t||n||!f.open&&d.component.key[t])&&(e.preventDefault(),e.stopPropagation(),n?d.clear().close():d.open()),void 0)}).val(h.data("value")?t._.trigger(d.component.formats.toString,d.component,[l.format,d.component.item.select]):r.value).after(d._hidden).data(i,d),l.container?e(l.container).append(d.$root):h.after(d.$root),d.on({start:d.component.onStart,render:d.component.onRender,stop:d.component.onStop,open:d.component.onOpen,close:d.component.onClose,set:d.component.onSet}).on({start:l.onStart,render:l.onRender,stop:l.onStop,open:l.onOpen,close:l.onClose,set:l.onSet}),r.autofocus&&d.open(),d.trigger("start").trigger("render"))},render:function(e){return e?d.$root.html(u()):d.$root.find("."+c.box).html(d.component.nodes(f.open)),d.trigger("render")},stop:function(){return f.start?(d.close(),d._hidden&&d._hidden.parentNode.removeChild(d._hidden),d.$root.remove(),h.removeClass(c.input).off(".P"+f.id).removeData(i),r.type=f.type,r.readOnly=!1,d.trigger("stop"),f.methods={},f.start=!1,d):d},open:function(i){return f.open?d:(h.addClass(c.active),d.$root.addClass(c.opened),i!==!1&&(f.open=!0,h.focus(),n.on("click.P"+f.id+" focusin.P"+f.id,function(e){e.target!=r&&e.target!=document&&d.close()}).on("keydown.P"+f.id,function(n){var i=n.keyCode,s=d.component.key[i],o=n.target;27==i?d.close(!0):o!=r||!s&&13!=i?e.contains(d.$root[0],o)&&13==i&&(n.preventDefault(),o.click()):(n.preventDefault(),s?t._.trigger(d.component.key.go,d,[s]):d.$root.find("."+c.highlighted).hasClass(c.disabled)||d.set("select",d.component.item.highlight).close())})),d.trigger("open"))},close:function(e){return e&&(h.off("focus.P"+f.id).focus(),setTimeout(function(){h.on("focus.P"+f.id,a)},0)),h.removeClass(c.active),d.$root.removeClass(c.opened+" "+c.focused),f.open&&(f.open=!1,n.off(".P"+f.id)),d.trigger("close")},clear:function(){return d.set("clear")},set:function(e,n,r){var i,s,o=t._.isObject(e),u=o?e:{};if(e){o||(u[e]=n);for(i in u)s=u[i],d.component.item[i]&&d.component.set(i,s,r||{}),("select"==i||"clear"==i)&&h.val("clear"==i?"":t._.trigger(d.component.formats.toString,d.component,[l.format,d.component.get(i)])).trigger("change");d.render()}return d.trigger("set",u)},get:function(e,n){return e=e||"value",null!=f[e]?f[e]:"value"==e?r.value:d.component.item[e]?"string"==typeof n?t._.trigger(d.component.formats.toString,d.component,[n,d.component.get(e)]):d.component.get(e):void 0},on:function(e,n){var r,i,s=t._.isObject(e),o=s?e:{};if(e){s||(o[e]=n);for(r in o)i=o[r],f.methods[r]=f.methods[r]||[],f.methods[r].push(i)}return d},trigger:function(e,n){var r=f.methods[e];return r&&r.map(function(e){t._.trigger(e,d,[n])}),d}};return new p}var n=e(document);return t.klasses=function(e){return e=e||"picker",{picker:e,opened:e+"--opened",focused:e+"--focused",input:e+"__input",active:e+"__input--active",holder:e+"__holder",frame:e+"__frame",wrap:e+"__wrap",box:e+"__box"}},t._={group:function(e){for(var n,r="",i=t._.trigger(e.min,e);i<=t._.trigger(e.max,e,[i]);i+=e.i)n=t._.trigger(e.item,e,[i]),r+=t._.node(e.node,n[0],n[1],n[2]);return r},node:function(t,n,r,i){return n?(n=e.isArray(n)?n.join(""):n,r=r?' class="'+r+'"':"",i=i?" "+i:"","<"+t+r+i+">"+n+"</"+t+">"):""},lead:function(e){return(10>e?"0":"")+e},trigger:function(e,t,n){return"function"==typeof e?e.apply(t,n||[]):e},digits:function(e){return/\d/.test(e[1])?2:1},isObject:function(e){return{}.toString.call(e).indexOf("Object")>-1},isDate:function(e){return{}.toString.call(e).indexOf("Date")>-1&&this.isInteger(e.getDate())},isInteger:function(e){return{}.toString.call(e).indexOf("Number")>-1&&0===e%1}},t.extend=function(n,r){e.fn[n]=function(i,s){var o=this.data(n);return"picker"==i?o:o&&"string"==typeof i?(t._.trigger(o[i],o,[s]),this):this.each(function(){var s=e(this);s.data(n)||new t(this,n,r,i)})},e.fn[n].defaults=r.defaults},t})