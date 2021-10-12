var login_block = document.getElementById("login");
var signup_block = document.getElementById("signup");
var btn = document.getElementById("btn");
var toggle_btnL = document.getElementById("toggle-btnL")
var toggle_btnR = document.getElementById("toggle-btnR")

function signup() {
    login_block.style.left = "-400px";
    signup_block.style.left = "50px";
    btn.style.left = "110px";
    toggle_btnL.style.color = "#999";
    toggle_btnR.style.color = "#111";
}

function login() {
    login_block.style.left = "50px";
    signup_block.style.left = "450px";
    btn.style.left = "0";
    toggle_btnL.style.color = "#111";
    toggle_btnR.style.color = "#999";
}