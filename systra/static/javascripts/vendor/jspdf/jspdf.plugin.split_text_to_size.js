(function(e){"use strict";var t=e.getCharWidthsArray=function(e,t){t||(t={});var n=t.widths?t.widths:this.internal.getFont().metadata.Unicode.widths,r=n.fof?n.fof:1,i=t.kerning?t.kerning:this.internal.getFont().metadata.Unicode.kerning,s=i.fof?i.fof:1,o,u,a,f,l=0,c=n[0]||r,h=[];for(o=0,u=e.length;o<u;o++)a=e.charCodeAt(o),h.push((n[a]||c)/r+(i[a]&&i[a][l]||0)/s),l=a;return h},n=function(e){var t=e.length,n=0;while(t)t--,n+=e[t];return n},r=e.getStringUnitWidth=function(e,r){return n(t.call(this,e,r))},i=function(e,t,n,r){var i=[],s=0,o=e.length,u=0;while(s!==o&&u+t[s]<n)u+=t[s],s++;i.push(e.slice(0,s));var a=s;u=0;while(s!==o)u+t[s]>r&&(i.push(e.slice(a,s)),u=0,a=s),u+=t[s],s++;return a!==s&&i.push(e.slice(a,s)),i},s=function(e,r,s){s||(s={});var o=t(" ",s)[0],u=e.split(" "),a=[],f=[a],l=s.textIndent||0,c=0,h=0,p,d,v,m,g;for(v=0,m=u.length;v<m;v++){p=u[v],d=t(p,s),h=n(d);if(l+c+h>r){if(h>r){g=i(p,d,r-(l+c),r),a.push(g.shift()),a=[g.pop()];while(g.length)f.push([g.shift()]);h=n(d.slice(p.length-a[0].length))}else a=[p];f.push(a),l=h,c=o}else a.push(p),l+=c+h,c=o}var y=[];for(v=0,m=f.length;v<m;v++)y.push(f[v].join(" "));return y};e.splitTextToSize=function(e,t,n){n||(n={});var r=n.fontSize||this.internal.getFontSize(),i=function(e){var t={0:1},n={};if(!e.widths||!e.kerning){var r=this.internal.getFont(e.fontName,e.fontStyle),i="Unicode";return r.metadata[i]?{widths:r.metadata[i].widths||t,kerning:r.metadata[i].kerning||n}:{widths:t,kerning:n}}return{widths:e.widths,kerning:e.kerning}}.call(this,n),o;e.match(/[\n\r]/)?o=e.split(/\r\n|\r|\n/g):o=[e];var u=1*this.internal.scaleFactor*t/r;i.textIndent=n.textIndent?n.textIndent*1*this.internal.scaleFactor/r:0;var a,f,l=[];for(a=0,f=o.length;a<f;a++)l=l.concat(s(o[a],u,i));return l}})(jsPDF.API)