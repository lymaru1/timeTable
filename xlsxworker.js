/* xlsx.js (C) 2013-present SheetJS -- http://sheetjs.com */
importScripts('xlsx/shim.js');
/* uncomment the next line for encoding support */
importScripts('xlsx/dist/cpexcel.js');
importScripts('xlsx/jszip.js');
importScripts('xlsx/xlsx.js');
postMessage({t:"ready"});

onmessage = function (evt) {
  var v;
  try {
    v = XLSX.read(evt.data.d, {type: evt.data.b});
postMessage({t:"xlsx", d:JSON.stringify(v)});
  } catch(e) { postMessage({t:"e",d:e.stack||e}); }
};
