const loginForm = document.getElementById("login-form");
const usernameTF = document.getElementById("username");
const passwordTF = document.getElementById("password");

const handleForm = (e) => {
    e.preventDefault();

    const username = usernameTF.value;
    const password = passwordTF.value;

    window.location.href = "http://127.0.0.1:5500/index.html?loggedIn=1";
}

loginForm.addEventListener('submit', handleForm);
