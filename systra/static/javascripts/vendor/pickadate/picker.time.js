!function(e){"function"==typeof define&&define.amd?define(["picker"],e):e(Picker)}(function(e){function t(e,t){var n=this,r=e.$node.data("value");n.settings=t,n.queue={interval:"i",min:"measure create",max:"measure create",now:"now create",select:"parse create validate",highlight:"create validate",view:"create validate",disable:"flipItem",enable:"flipItem"},n.item={},n.item.interval=t.interval||30,n.item.disable=(t.disable||[]).slice(0),n.item.enable=-function(e){return e[0]===!0?e.shift():-1}(n.item.disable),n.set("min",t.min).set("max",t.max).set("now").set("select",r||e.$node[0].value||n.item.min,{format:r?t.formatSubmit:t.format}),n.key={40:1,38:-1,39:1,37:-1,go:function(e){n.set("highlight",n.item.highlight.pick+e*n.item.interval,{interval:e*n.item.interval}),this.render()}},e.on("render",function(){var r=e.$root.children(),i=r.find("."+t.klass.viewset);i.length?r[0].scrollTop=~~(i.position().top-2*i[0].clientHeight):console.warn("Nothing to viewset with",n.item.view)}).on("open",function(){e.$root.find("button").attr("disable",!1)}).on("close",function(){e.$root.find("button").attr("disable",!0)})}var n=24,r=60,i=12,s=n*r;t.prototype.set=function(e,t,n){var r=this;return r.item["enable"==e?"disable":"flip"==e?"enable":e]=r.queue[e].split(" ").map(function(i){return t=r[i](e,t,n)}).pop(),"select"==e?r.set("highlight",r.item.select,n):"highlight"==e?r.set("view",r.item.highlight,n):"interval"==e?r.set("min",r.item.min,n).set("max",r.item.max,n):("flip"==e||"min"==e||"max"==e||"disable"==e||"enable"==e)&&r.item.select&&r.item.highlight&&("min"==e&&r.set("max",r.item.max,n),r.set("select",r.item.select,n).set("highlight",r.item.highlight,n)),r},t.prototype.get=function(e){return this.item[e]},t.prototype.create=function(t,i,o){var u=this;return i=void 0===i?t:i,e._.isObject(i)&&e._.isInteger(i.pick)?i=i.pick:$.isArray(i)?i=+i[0]*r+ +i[1]:e._.isInteger(i)||(i=u.now(t,i,o)),"max"==t&&i<u.item.min.pick&&(i+=s),i=u.normalize(i,o),{hour:~~(n+i/r)%n,mins:(r+i%r)%r,time:(s+i)%s,pick:i}},t.prototype.now=function(t,n){var i=new Date,s=i.getHours()*r+i.getMinutes();return e._.isInteger(n)?n+="min"==t&&0>n&&0===s?2:1:n=1,n*this.item.interval+s},t.prototype.normalize=function(e){return e-((0>e?this.item.interval:0)+e%this.item.interval)},t.prototype.measure=function(t,i,s){var o=this;return i?i===!0||e._.isInteger(i)?i=o.now(t,i,s):e._.isObject(i)&&e._.isInteger(i.pick)&&(i=o.normalize(i.pick,s)):i="min"==t?[0,0]:[n-1,r-1],i},t.prototype.validate=function(e,t,n){var r=this,i=n&&n.interval?n.interval:r.item.interval;return r.disabled(t)&&(t=r.shift(t,i)),t=r.scope(t),r.disabled(t)&&(t=r.shift(t,-1*i)),t},t.prototype.disabled=function(t){var n=this,r=n.item.disable.filter(function(r){return e._.isInteger(r)?t.hour==r:$.isArray(r)?t.pick==n.create(r).pick:void 0}).length;return-1===n.item.enable?!r:r},t.prototype.shift=function(e,t){for(var n=this;n.disabled(e)&&(e=n.create(e.pick+=t||n.item.interval),!(e.pick<=n.item.min.pick||e.pick>=n.item.max.pick)););return e},t.prototype.scope=function(e){var t=this.item.min.pick,n=this.item.max.pick;return this.create(e.pick>n?n:e.pick<t?t:e)},t.prototype.parse=function(t,n,i){var s=this,o={};if(!n||e._.isInteger(n)||$.isArray(n)||e._.isDate(n)||e._.isObject(n)&&e._.isInteger(n.pick))return n;if(!i||!i.format)throw"Need a formatting option to parse this..";return s.formats.toArray(i.format).map(function(t){var r=s.formats[t],i=r?e._.trigger(r,s,[n,o]):t.replace(/^!/,"").length;r&&(o[t]=n.substr(0,i)),n=n.substr(i)}),+o.i+r*(+(o.H||o.HH)||+(o.h||o.hh)%12+(/^p/i.test(o.A||o.a)?12:0))},t.prototype.formats={h:function(t,n){return t?e._.digits(t):n.hour%i||i},hh:function(t,n){return t?2:e._.lead(n.hour%i||i)},H:function(t,n){return t?e._.digits(t):""+n.hour},HH:function(t,n){return t?e._.digits(t):e._.lead(n.hour)},i:function(t,n){return t?2:e._.lead(n.mins)},a:function(e,t){return e?4:s/2>t.time%s?"a.m.":"p.m."},A:function(e,t){return e?2:s/2>t.time%s?"AM":"PM"},toArray:function(e){return e.split(/(h{1,2}|H{1,2}|i|a|A|!.)/g)},toString:function(t,n){var r=this;return r.formats.toArray(t).map(function(t){return e._.trigger(r.formats[t],r,[0,n])||t.replace(/^!/,"")}).join("")}},t.prototype.flipItem=function(e,t){var n=this,r=n.item.disable,i=-1===n.item.enable;return"flip"==t?n.item.enable=i?1:-1:!i&&"enable"==e||i&&"disable"==e?r=n.removeDisabled(r,t):(!i&&"disable"==e||i&&"enable"==e)&&(r=n.addDisabled(r,t)),r},t.prototype.addDisabled=function(e,t){var n=this;return t.map(function(t){n.filterDisabled(e,t).length||e.push(t)}),e},t.prototype.removeDisabled=function(e,t){var n=this;return t.map(function(t){e=n.filterDisabled(e,t,1)}),e},t.prototype.filterDisabled=function(e,t,n){var r=$.isArray(t);return e.filter(function(e){var i=!r&&t===e||r&&$.isArray(e)&&t.toString()===e.toString();return n?!i:i})},t.prototype.i=function(t,n){return e._.isInteger(n)&&n>0?n:this.item.interval},t.prototype.nodes=function(t){var n=this,r=n.settings,i=n.item.select,s=n.item.highlight,o=n.item.view,u=n.item.disable;return e._.node("ul",e._.group({min:n.item.min.pick,max:n.item.max.pick,i:n.item.interval,node:"li",item:function(t){return t=n.create(t),[e._.trigger(n.formats.toString,n,[e._.trigger(r.formatLabel,n,[t])||r.format,t]),function(e,a){return i&&i.pick==a&&e.push(r.klass.selected),s&&s.pick==a&&e.push(r.klass.highlighted),o&&o.pick==a&&e.push(r.klass.viewset),u&&n.disabled(t)&&e.push(r.klass.disabled),e.join(" ")}([r.klass.listItem],t.pick),"data-pick="+t.pick]}})+e._.node("li",e._.node("button",r.clear,r.klass.buttonClear,"data-clear=1"+(t?"":" disable"))),r.klass.list)},t.defaults=function(e){return{clear:"Clear",format:"h:i A",interval:30,klass:{picker:e+" "+e+"--time",holder:e+"__holder",list:e+"__list",listItem:e+"__list-item",disabled:e+"__list-item--disabled",selected:e+"__list-item--selected",highlighted:e+"__list-item--highlighted",viewset:e+"__list-item--viewset",now:e+"__list-item--now",buttonClear:e+"__button--clear"}}}(e.klasses().picker),e.extend("pickatime",t)})