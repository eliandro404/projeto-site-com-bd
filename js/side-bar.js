const userBar = document.querySelector("#user-bar")
const user = document.querySelector(".user-menu")

userBar.addEventListener('click', () => {
    user.classList.toggle('active');
});
