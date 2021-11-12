(function(aemJquery, myJquery) {

    aemJquery(document).on("foundation-contentloaded", function() {
        var heading = document.querySelector("h1");

        var div1 = document.createElement("div");
        var div2 = document.createElement("div");
    
        div1.innerHTML = "Jquery provided by aem is exposed at `Granite.$` with version " + aemJquery().jquery;
        div2.innerHTML = "Jquery added by me is exposed at `myNamespace.$` with version " + myJquery().jquery;
    
        heading.after(div1);
        div1.after(div2);
    });

})(Granite.$, myNamespace.$);