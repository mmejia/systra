!function(){function e(e){function t(e,t,n){var r=e+" ";switch(n){case"m":return t?"ena minuta":"eno minuto";case"mm":return r+=1===e?"minuta":2===e?"minuti":3===e||4===e?"minute":"minut";case"h":return t?"ena ura":"eno uro";case"hh":return r+=1===e?"ura":2===e?"uri":3===e||4===e?"ure":"ur";case"dd":return r+=1===e?"dan":"dni";case"MM":return r+=1===e?"mesec":2===e?"meseca":3===e||4===e?"mesece":"mesecev";case"yy":return r+=1===e?"leto":2===e?"leti":3===e||4===e?"leta":"let"}}e.lang("sl",{months:"januar_februar_marec_april_maj_junij_julij_avgust_september_oktober_november_december".split("_"),monthsShort:"jan._feb._mar._apr._maj._jun._jul._avg._sep._okt._nov._dec.".split("_"),weekdays:"nedelja_ponedeljek_torek_sreda_četrtek_petek_sobota".split("_"),weekdaysShort:"ned._pon._tor._sre._čet._pet._sob.".split("_"),weekdaysMin:"ne_po_to_sr_če_pe_so".split("_"),longDateFormat:{LT:"H:mm",L:"DD. MM. YYYY",LL:"D. MMMM YYYY",LLL:"D. MMMM YYYY LT",LLLL:"dddd, D. MMMM YYYY LT"},calendar:{sameDay:"[danes ob] LT",nextDay:"[jutri ob] LT",nextWeek:function(){switch(this.day()){case 0:return"[v] [nedeljo] [ob] LT";case 3:return"[v] [sredo] [ob] LT";case 6:return"[v] [soboto] [ob] LT";case 1:case 2:case 4:case 5:return"[v] dddd [ob] LT"}},lastDay:"[včeraj ob] LT",lastWeek:function(){switch(this.day()){case 0:case 3:case 6:return"[prejšnja] dddd [ob] LT";case 1:case 2:case 4:case 5:return"[prejšnji] dddd [ob] LT"}},sameElse:"L"},relativeTime:{future:"čez %s",past:"%s nazaj",s:"nekaj sekund",m:t,mm:t,h:t,hh:t,d:"en dan",dd:t,M:"en mesec",MM:t,y:"eno leto",yy:t},ordinal:"%d.",week:{dow:1,doy:7}})}"function"==typeof define&&define.amd&&define(["moment"],e),"undefined"!=typeof window&&window.moment&&e(window.moment)}()