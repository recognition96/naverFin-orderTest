$.fn.serializeObject = function() {
    var result = {};
    var serialArray = this.serializeArray();
    $.each(serialArray, function() {
        if (result[this.name]) {
            if (!result[this.name].push) {
                result[this.name] = [result[this.name]];
            }
            result[this.name].push(this.value || '');
        } else {
            result[this.name] = this.value || '';
        }
    });
    return result;
};