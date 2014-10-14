// Expose the native API to javascript
forge.keyboard_size = {
    showAlert: function (text, success, error) {
        forge.internal.call('keyboard_size.showAlert', {text: text}, success, error);
    }
};

// Register for our native event
forge.internal.addEventListener("keyboard_size.resume", function () {
	alert("Welcome back!");
});
