var presenting = 0;

// check if we are loaded with 'presenting'
if ((window.location.hash || '') == '#presenting') {
    presenting = 1;
}

function slidenr(current, total) {

    // if we are 'presenting' then we hide the total slide-count
    if (presenting) {
        s = current;
    } else {
        s = current + '/' + total;
    }

    if (current>2) {
        // slides above 2 are 'normal'
        s = title + ': ' + s;
    }
    if (current>1) {
        // slide 2 the title card doesnt duplicate the title in the slidenr
        return s;
    }

    // slide 1 is the initial test pattern and doesnt need any slidenr
    return '';
}

