(function(document) {

    var clicked;
    function getPreviousAndCurrentSiblings(element, selector='*') {
        var result = [];
        var tempElement = element;

        while (tempElement) {
            if(element.matches(selector)) {
                result.push(tempElement);
            }
            tempElement = tempElement.previousElementSibling;
        }

        return result;
    }

    function getNextAndNotCurrentSiblings(element, selector='*') {
        var result = [];
        var tempElement = element;

        while (tempElement) {
            if(element.matches(selector)) {
                result.push(tempElement);
            }
            tempElement = tempElement.nextElementSibling;
        }

        return result;
    }

    function click(event) {
        var target = event.currentTarget;
        if(!target) {
            return;
        }

        var container = target.closest(".rating-component");
        var activeItems = getPreviousAndCurrentSiblings(target, ".rating-component-item");

        container.querySelectorAll(".rating-component-item").forEach(function(item) {
            var image = item.querySelector(".rating-component-image");
            var isSelected = activeItems.includes(item);
            image[isSelected ? "setAttribute" : "removeAttribute"]("selected", "");
        });

        clearAllActive(container);

        var index = parseInt(target.dataset.index, 10) + 1;
        container.querySelector(".foundation-field-related").value = index;
        clicked = true;
        requestAnimationFrame(function(){
            clicked = false;
        });
    }

    function mouseover(event) {
        var target = event.currentTarget;
        // sometime mouseover event gets executed just after clicking
        // clicked is added to avoid this run.
        if(!target || clicked) {
            clicked = false;
            return;
        }
        var container = target.closest(".rating-component");
        var activeItems = getPreviousAndCurrentSiblings(target, ".rating-component-item");

        container.querySelectorAll(".rating-component-item").forEach(function(item) {
            var image = item.querySelector(".rating-component-image");
            var isActive = activeItems.includes(item);
            image[isActive ? "setAttribute" : "removeAttribute"]("active", "");
        });
    }

    function clearAllActive(container) {
        container.querySelectorAll('.rating-component-item').forEach(item => {
            var image = item.querySelector(".rating-component-image");
            image.removeAttribute("active");
        });
    }

    function clearAllSelected(container) {
        container.querySelectorAll('.rating-component-item').forEach(item => {
            var image = item.querySelector(".rating-component-image");
            image.removeAttribute("selected");
        });
    }

    function mouseleave(event) {
        var container = event.currentTarget;
        clearAllActive(container);
    }

    document.querySelectorAll('.rating-component').forEach(container => {
        container.addEventListener('mouseleave', mouseleave);
        container.querySelectorAll(".rating-component-item").forEach(item => {
            item.addEventListener('mouseover', mouseover);
            item.addEventListener('click', click);
        });
    });
}(document))