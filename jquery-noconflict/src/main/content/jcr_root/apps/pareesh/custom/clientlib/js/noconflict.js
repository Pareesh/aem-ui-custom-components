(function() {
    window.myNamespace = window.myNamespace || {};
    window.myNamespace.$ = window.myNamespace.$ || $;

    $.noConflict(true);
})();