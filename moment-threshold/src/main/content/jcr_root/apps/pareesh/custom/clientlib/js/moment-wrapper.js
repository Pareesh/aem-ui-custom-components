(function(moment) {
    var options = {
        'secondsAgo': 'ss',
        'seconds': 's',
        'minutes': 'm',
        'hours': 'h',
        'days': 'd',
        'weeks': 'w',
        'months': 'm'
    };

    const limits = {
        'ss': 60,
        's': 60,
        'm': 60,
        'h': 24,
        'd': 30,
        'w': 4,
        'm': 12
    }

    function changeMomentThreshold(option, value) {
        if (value > limits[option]) {
            console.log(`Failed to update the moment threshold, value must be less than ${limits[option]}`);
        } else {
            moment.relativeTimeThreshold(option, value);
        }
        return;
    }

    changeMomentThreshold(options.hours, 24);

})(moment);