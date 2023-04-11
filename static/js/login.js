function login() {
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;
    
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "/login", true);
    xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
    xhr.onreadystatechange = function() {
        if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
            var response = JSON.parse(this.responseText);
            if (response.success) {
                window.location.href = "/dashboard";
            } else {
                alert(response.message);
            }
        }
    };
    xhr.send(JSON.stringify({username: username, password: password}));
}
