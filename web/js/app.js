
const loginBtn = document.getElementById("login-btn");
const logoutBtn = document.getElementById("logout-btn");

const loadPageData = () => {
    const url = new URL(document.URL);
    const loggedIn = url.searchParams.get("loggedIn");

    if (loggedIn == 1) {
        loginBtn.style.display = "none";
    } else {
        logoutBtn.style.display = "none";
    }
    
}

loadPageData();

