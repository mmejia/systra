var jsPDF=function(){"use strict";function e(r,i,s,o){typeof r=="undefined"?r="p":r=r.toString().toLowerCase(),typeof i=="undefined"&&(i="mm"),typeof s=="undefined"&&(s="a4"),typeof o=="undefined"&&typeof zpipe=="undefined"&&(o=!1);var u=s.toString().toLowerCase(),a="0.9.0rc2",f=[],l=0,c=o,h="1.3",p={a0:[2383.94,3370.39],a1:[1683.78,2383.94],a2:[1190.55,1683.78],a3:[841.89,1190.55],a4:[595.28,841.89],a5:[419.53,595.28],a6:[297.64,419.53],a7:[209.76,297.64],a8:[147.4,209.76],a9:[104.88,147.4],a10:[73.7,104.88],b0:[2834.65,4008.19],b1:[2004.09,2834.65],b2:[1417.32,2004.09],b3:[1000.63,1417.32],b4:[708.66,1000.63],b5:[498.9,708.66],b6:[354.33,498.9],b7:[249.45,354.33],b8:[175.75,249.45],b9:[124.72,175.75],b10:[87.87,124.72],c0:[2599.37,3676.54],c1:[1836.85,2599.37],c2:[1298.27,1836.85],c3:[918.43,1298.27],c4:[649.13,918.43],c5:[459.21,649.13],c6:[323.15,459.21],c7:[229.61,323.15],c8:[161.57,229.61],c9:[113.39,161.57],c10:[79.37,113.39],letter:[612,792],"government-letter":[576,756],legal:[612,1008],"junior-legal":[576,360],ledger:[1224,792],tabloid:[792,1224]},d="0 g",v="0 G",m=0,g=[],y=2,b=!1,w=[],E={},S={},x=16,T,N=.200025,C,k,L,A={title:"",subject:"",author:"",keywords:"",creator:""},O=0,M=0,_={},D=new n(_),P,H,B=function(e){return e.toFixed(2)},j=function(e){return e.toFixed(3)},F=function(e){var t=e.toFixed(0);return e<10?"0"+t:t},I=function(e){var t=e.toFixed(0);return t.length<10?(new Array(11-t.length)).join("0")+t:t},q=function(e){b?g[m].push(e):(f.push(e),l+=e.length+1)},R=function(){return y++,w[y]=l,q(y+" 0 obj"),y},U=function(e){q("stream"),q(e),q("endstream")},z,W,X,V,$=function(){z=k*L,W=C*L;var e,t,n,r,i,s,o;for(e=1;e<=m;e++){R(),q("<</Type /Page"),q("/Parent 1 0 R"),q("/Resources 2 0 R"),q("/Contents "+(y+1)+" 0 R>>"),q("endobj"),t=g[e].join("\n"),R();if(c){n=[];for(i=0;i<t.length;++i)n[i]=t.charCodeAt(i);o=adler32cs.from(t),s=new Deflater(6),s.append(new Uint8Array(n)),t=s.flush(),n=[new Uint8Array([120,156]),new Uint8Array(t),new Uint8Array([o&255,o>>8&255,o>>16&255,o>>24&255])],t="";for(i in n)n.hasOwnProperty(i)&&(t+=String.fromCharCode.apply(null,n[i]));q("<</Length "+t.length+" /Filter [/FlateDecode]>>")}else q("<</Length "+t.length+">>");U(t),q("endobj")}w[1]=l,q("1 0 obj"),q("<</Type /Pages"),X="/Kids [";for(i=0;i<m;i++)X+=3+2*i+" 0 R ";q(X+"]"),q("/Count "+m),q("/MediaBox [0 0 "+B(z)+" "+B(W)+"]"),q(">>"),q("endobj")},J=function(e){e.objectNumber=R(),q("<</BaseFont/"+e.PostScriptName+"/Type/Font"),typeof e.encoding=="string"&&q("/Encoding/"+e.encoding),q("/Subtype/Type1>>"),q("endobj")},K=function(){var e;for(e in E)E.hasOwnProperty(e)&&J(E[e])},Q=function(){D.publish("putXobjectDict")},G=function(){q("/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]"),q("/Font <<");var e;for(e in E)E.hasOwnProperty(e)&&q("/"+e+" "+E[e].objectNumber+" 0 R");q(">>"),q("/XObject <<"),Q(),q(">>")},Y=function(){K(),D.publish("putResources"),w[2]=l,q("2 0 obj"),q("<<"),G(),q(">>"),q("endobj"),D.publish("postPutResources")},Z=function(e,t,n){var r;S[t]===r&&(S[t]={}),S[t][n]=e},et={},tt=function(e,n,r,i){var s="F"+(t(E)+1).toString(10),o=E[s]={id:s,PostScriptName:e,fontName:n,fontStyle:r,encoding:i,metadata:{}};return Z(s,n,r),D.publish("addFont",o),s},nt=function(){var e="helvetica",t="times",n="courier",r="normal",i="bold",s="italic",o="bolditalic",u="StandardEncoding",a=[["Helvetica",e,r],["Helvetica-Bold",e,i],["Helvetica-Oblique",e,s],["Helvetica-BoldOblique",e,o],["Courier",n,r],["Courier-Bold",n,i],["Courier-Oblique",n,s],["Courier-BoldOblique",n,o],["Times-Roman",t,r],["Times-Bold",t,i],["Times-Italic",t,s],["Times-BoldItalic",t,o]],f,l,c,h;for(f=0,l=a.length;f<l;f++)c=tt(a[f][0],a[f][1],a[f][2],u),h=a[f][0].split("-"),Z(c,h[0],h[1]||"");D.publish("addFonts",{fonts:E,dictionary:S})},rt=function(e,t){var n,r,i,s,o,u,a,f,l,c;t===i&&(t={}),s=t.sourceEncoding?s:"Unicode",u=t.outputEncoding;if((t.autoencode||u)&&E[T].metadata&&E[T].metadata[s]&&E[T].metadata[s].encoding){o=E[T].metadata[s].encoding,!u&&E[T].encoding&&(u=E[T].encoding),!u&&o.codePages&&(u=o.codePages[0]),typeof u=="string"&&(u=o[u]);if(u){f=!1,a=[];for(n=0,r=e.length;n<r;n++)l=u[e.charCodeAt(n)],l?a.push(String.fromCharCode(l)):a.push(e[n]),a[n].charCodeAt(0)>>8&&(f=!0);e=a.join("")}}n=e.length;while(f===i&&n!==0)e.charCodeAt(n-1)>>8&&(f=!0),n--;if(!f)return e;a=t.noBOM?[]:[254,255];for(n=0,r=e.length;n<r;n++){l=e.charCodeAt(n),c=l>>8;if(c>>8)throw new Error("Character at position "+n.toString(10)+" of string '"+e+"' exceeds 16bits. Cannot be encoded into UCS-2 BE");a.push(c),a.push(l-(c<<8))}return String.fromCharCode.apply(i,a)},it=function(e,t){return rt(e,t).replace(/\\/g,"\\\\").replace(/\(/g,"\\(").replace(/\)/g,"\\)")},st=function(){q("/Producer (jsPDF "+a+")"),A.title&&q("/Title ("+it(A.title)+")"),A.subject&&q("/Subject ("+it(A.subject)+")"),A.author&&q("/Author ("+it(A.author)+")"),A.keywords&&q("/Keywords ("+it(A.keywords)+")"),A.creator&&q("/Creator ("+it(A.creator)+")");var e=new Date;q("/CreationDate (D:"+[e.getFullYear(),F(e.getMonth()+1),F(e.getDate()),F(e.getHours()),F(e.getMinutes()),F(e.getSeconds())].join("")+")")},ot=function(){q("/Type /Catalog"),q("/Pages 1 0 R"),q("/OpenAction [3 0 R /FitH null]"),q("/PageLayout /OneColumn"),D.publish("putCatalog")},ut=function(){q("/Size "+(y+1)),q("/Root "+y+" 0 R"),q("/Info "+(y-1)+" 0 R")},at=function(){m++,b=!0,g[m]=[]},ft=function(){at(),q(B(N*L)+" w"),q(v),O!==0&&q(O.toString(10)+" J"),M!==0&&q(M.toString(10)+" j"),D.publish("addPage",{pageNumber:m})},lt=function(e,t){var n,r;e===r&&(e=E[T].fontName),t===r&&(t=E[T].fontStyle);try{n=S[e][t]}catch(i){n=r}if(!n)throw new Error("Unable to look up font label for font '"+e+"', '"+t+"'. Refer to getFontList() for available fonts.");return n},ct=function(){b=!1,f=[],w=[],q("%PDF-"+h),$(),Y(),R(),q("<<"),st(),q(">>"),q("endobj"),R(),q("<<"),ot(),q(">>"),q("endobj");var e=l,t;q("xref"),q("0 "+(y+1)),q("0000000000 65535 f ");for(t=1;t<=y;t++)q(I(w[t])+" 00000 n ");return q("trailer"),q("<<"),ut(),q(">>"),q("startxref"),q(e),q("%%EOF"),b=!0,f.join("\n")},ht=function(e){var t="S";if(e==="F")t="f";else if(e==="FD"||e==="DF")t="B";return t},pt=function(e,t){var n,r,i,s,o,u;switch(e){case n:return ct();case"save":if(navigator.getUserMedia){if(window.URL===undefined)return _.output("dataurlnewwindow");if(window.URL.createObjectURL===undefined)return _.output("dataurlnewwindow")}r=ct(),i=r.length,s=new Uint8Array(new ArrayBuffer(i));for(o=0;o<i;o++)s[o]=r.charCodeAt(o);u=new Blob([s],{type:"application/pdf"}),saveAs(u,t);break;case"datauristring":case"dataurlstring":return"data:application/pdf;base64,"+btoa(ct());case"datauri":case"dataurl":document.location.href="data:application/pdf;base64,"+btoa(ct());break;case"dataurlnewwindow":window.open("data:application/pdf;base64,"+btoa(ct()));break;default:throw new Error('Output type "'+e+'" is not supported.')}};if(i==="pt")L=1;else if(i==="mm")L=72/25.4;else if(i==="cm")L=72/2.54;else{if(i!=="in")throw"Invalid unit: "+i;L=72}if(p.hasOwnProperty(u))C=p[u][1]/L,k=p[u][0]/L;else try{C=s[1],k=s[0]}catch(dt){throw"Invalid format: "+s}if(r==="p"||r==="portrait")r="p",k>C&&(P=k,k=C,C=P);else{if(r!=="l"&&r!=="landscape")throw"Invalid orientation: "+r;r="l",C>k&&(P=k,k=C,C=P)}_.internal={pdfEscape:it,getStyle:ht,getFont:function(){return E[lt.apply(_,arguments)]},getFontSize:function(){return x},btoa:btoa,write:function(e,t,n,r){q(arguments.length===1?e:Array.prototype.join.call(arguments," "))},getCoordinateString:function(e){return B(e*L)},getVerticalCoordinateString:function(e){return B((C-e)*L)},collections:{},newObject:R,putStream:U,events:D,scaleFactor:L,pageSize:{width:k,height:C},output:function(e,t){return pt(e,t)}},_.addPage=function(){return ft(),this},_.text=function(e,t,n,r){console.log(e+"  "+t+"   "+n);var i,s,o,u,a,f,l;n==undefined&&(n=""),typeof e=="number"&&(s=n,o=e,u=t,e=s,t=o,n=u),typeof e=="string"&&e.match(/[\n\r]/)&&(e=e.split(/\r\n|\r|\n/g)),typeof r=="undefined"?r={noBOM:!0,autoencode:!0}:(r.noBOM===i&&(r.noBOM=!0),r.autoencode===i&&(r.autoencode=!0));if(typeof e=="string")f=it(e,r);else{if(!(e instanceof Array))throw new Error('Type of text must be string or Array. "'+e+'" is not recognized.');a=e.concat();for(l=a.length-1;l!==-1;l--)a[l]=it(a[l],r);f=a.join(") Tj\nT* (")}return q("BT\n/"+T+" "+x+" Tf\n"+x+" TL\n"+d+"\n"+B(t*L)+" "+B((C-n)*L)+" Td\n("+f+") Tj\nET"),this},_.line=function(e,t,n,r){return q(B(e*L)+" "+B((C-t)*L)+" m "+B(n*L)+" "+B((C-r)*L)+" l S"),this},_.lines=function(e,t,n,r,i,s){var o,u,a,f,l,c,h,p,d,v,m,g,y,b,w;typeof e=="number"&&(u=n,a=e,f=t,e=u,t=a,n=f),i=ht(i),r=r===o?[1,1]:r,q(j(t*L)+" "+j((C-n)*L)+" m "),l=r[0],c=r[1],p=e.length,b=t,w=n;for(h=0;h<p;h++)d=e[h],d.length===2?(b=d[0]*l+b,w=d[1]*c+w,q(j(b*L)+" "+j((C-w)*L)+" l")):(v=d[0]*l+b,m=d[1]*c+w,g=d[2]*l+b,y=d[3]*c+w,b=d[4]*l+b,w=d[5]*c+w,q(j(v*L)+" "+j((C-m)*L)+" "+j(g*L)+" "+j((C-y)*L)+" "+j(b*L)+" "+j((C-w)*L)+" c"));return s==1&&q(" h"),q(i),this},_.rect=function(e,t,n,r,i){var s=ht(i);return q([B(e*L),B((C-t)*L),B(n*L),B(-r*L),"re",s].join(" ")),this},_.triangle=function(e,t,n,r,i,s,o){return this.lines([[n-e,r-t],[i-n,s-r],[e-i,t-s]],e,t,[1,1],o,!0),this},_.roundedRect=function(e,t,n,r,i,s,o){var u=4/3*(Math.SQRT2-1);return this.lines([[n-2*i,0],[i*u,0,i,s-s*u,i,s],[0,r-2*s],[0,s*u,-(i*u),s,-i,s],[-n+2*i,0],[-(i*u),0,-i,-(s*u),-i,-s],[0,-r+2*s],[0,-(s*u),i*u,-s,i,-s]],e+i,t,[1,1],o),this},_.ellipse=function(e,t,n,r,i){var s=ht(i),o=4/3*(Math.SQRT2-1)*n,u=4/3*(Math.SQRT2-1)*r;return q([B((e+n)*L),B((C-t)*L),"m",B((e+n)*L),B((C-(t-u))*L),B((e+o)*L),B((C-(t-r))*L),B(e*L),B((C-(t-r))*L),"c"].join(" ")),q([B((e-o)*L),B((C-(t-r))*L),B((e-n)*L),B((C-(t-u))*L),B((e-n)*L),B((C-t)*L),"c"].join(" ")),q([B((e-n)*L),B((C-(t+u))*L),B((e-o)*L),B((C-(t+r))*L),B(e*L),B((C-(t+r))*L),"c"].join(" ")),q([B((e+o)*L),B((C-(t+r))*L),B((e+n)*L),B((C-(t+u))*L),B((e+n)*L),B((C-t)*L),"c",s].join(" ")),this},_.circle=function(e,t,n,r){return this.ellipse(e,t,n,n,r)},_.setProperties=function(e){var t;for(t in A)A.hasOwnProperty(t)&&e[t]&&(A[t]=e[t]);return this},_.setFontSize=function(e){return x=e,this},_.setFont=function(e,t){return T=lt(e,t),this},_.setFontStyle=_.setFontType=function(e){var t;return T=lt(t,e),this},_.getFontList=function(){var e={},t,n,r;for(t in S)if(S.hasOwnProperty(t)){e[t]=r=[];for(n in S[t])S[t].hasOwnProperty(n)&&r.push(n)}return e},_.setLineWidth=function(e){return q((e*L).toFixed(2)+" w"),this},_.setDrawColor=function(e,t,n,r){var i;return t===undefined||r===undefined&&e===t===n?typeof e=="string"?i=e+" G":i=B(e/255)+" G":r===undefined?typeof e=="string"?i=[e,t,n,"RG"].join(" "):i=[B(e/255),B(t/255),B(n/255),"RG"].join(" "):typeof e=="string"?i=[e,t,n,r,"K"].join(" "):i=[B(e),B(t),B(n),B(r),"K"].join(" "),q(i),this},_.setFillColor=function(e,t,n,r){var i;return t===undefined||r===undefined&&e===t===n?typeof e=="string"?i=e+" g":i=B(e/255)+" g":r===undefined?typeof e=="string"?i=[e,t,n,"rg"].join(" "):i=[B(e/255),B(t/255),B(n/255),"rg"].join(" "):typeof e=="string"?i=[e,t,n,r,"k"].join(" "):i=[B(e),B(t),B(n),B(r),"k"].join(" "),q(i),this},_.setTextColor=function(e,t,n){return e===0&&t===0&&n===0||typeof t=="undefined"?d=j(e/255)+" g":d=[j(e/255),j(t/255),j(n/255),"rg"].join(" "),this},_.CapJoinStyles={0:0,butt:0,but:0,miter:0,1:1,round:1,rounded:1,circle:1,2:2,projecting:2,project:2,square:2,bevel:2},_.setLineCap=function(e){var t=this.CapJoinStyles[e];if(t===undefined)throw new Error("Line cap style of '"+e+"' is not recognized. See or extend .CapJoinStyles property for valid styles");return O=t,q(t.toString(10)+" J"),this},_.setLineJoin=function(e){var t=this.CapJoinStyles[e];if(t===undefined)throw new Error("Line join style of '"+e+"' is not recognized. See or extend .CapJoinStyles property for valid styles");return M=t,q(t.toString(10)+" j"),this},_.output=pt,_.save=function(e){_.output("save",e)};for(H in e.API)e.API.hasOwnProperty(H)&&(H==="events"&&e.API.events.length?function(e,t){var n,r,i;for(i=t.length-1;i!==-1;i--)n=t[i][0],r=t[i][1],e.subscribe.apply(e,[n].concat(typeof r=="function"?[r]:r))}(D,e.API.events):_[H]=e.API[H]);return nt(),T="F1",ft(),D.publish("initialized"),_}typeof btoa=="undefined"&&(window.btoa=function(e){var t="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",n=t.split(""),r,i,s,o,u,a,f,l,c=0,h=0,p="",d=[],v;do r=e.charCodeAt(c++),i=e.charCodeAt(c++),s=e.charCodeAt(c++),l=r<<16|i<<8|s,o=l>>18&63,u=l>>12&63,a=l>>6&63,f=l&63,d[h++]=n[o]+n[u]+n[a]+n[f];while(c<e.length);return p=d.join(""),v=e.length%3,(v?p.slice(0,v-3):p)+"===".slice(v||3)}),typeof atob=="undefined"&&(window.atob=function(e){var t="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",n,r,i,s,o,u,a,f,l=0,c=0,h="",p=[];if(!e)return e;e+="";do s=t.indexOf(e.charAt(l++)),o=t.indexOf(e.charAt(l++)),u=t.indexOf(e.charAt(l++)),a=t.indexOf(e.charAt(l++)),f=s<<18|o<<12|u<<6|a,n=f>>16&255,r=f>>8&255,i=f&255,u===64?p[c++]=String.fromCharCode(n):a===64?p[c++]=String.fromCharCode(n,r):p[c++]=String.fromCharCode(n,r,i);while(l<e.length);return h=p.join(""),h});var t=typeof Object.keys=="function"?function(e){return Object.keys(e).length}:function(e){var t=0,n;for(n in e)e.hasOwnProperty(n)&&t++;return t},n=function(e){this.topics={},this.context=e,this.publish=function(e,t){if(this.topics[e]){var n=this.topics[e],r=[],i,s,o,u,a=function(){};t=Array.prototype.slice.call(arguments,1);for(s=0,o=n.length;s<o;s++)u=n[s],i=u[0],u[1]&&(u[0]=a,r.push(s)),i.apply(this.context,t);for(s=0,o=r.length;s<o;s++)n.splice(r[s],1)}},this.subscribe=function(e,t,n){return this.topics[e]?this.topics[e].push([t,n]):this.topics[e]=[[t,n]],{topic:e,callback:t}},this.unsubscribe=function(e){if(this.topics[e.topic]){var t=this.topics[e.topic],n,r;for(n=0,r=t.length;n<r;n++)t[n][0]===e.callback&&t.splice(n,1)}}};return e.API={events:[]},e}()