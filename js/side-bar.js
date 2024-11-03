const sideBar = document.querySelector(".itens")
const closeButton = document.querySelector(".close-button")
const user = document.querySelector(".menu")
const userMenu = document.querySelector(".user")
const configMenu = document.querySelector(".config")

closeButton.addEventListener("click", () => {
    user.classList.remove("active")
})

sideBar.addEventListener("click", function(event) {
    const item = event.target.closest('.item');
    if (item && item.id !== "exit" && item.id !== "open-bar") {
        user.classList.add("active");
        removeClassLists()
        if (item.id === "user-menu") {
            userMenu.classList.toggle("active")
        } else if (item.id === "config-menu") {
            configMenu.classList.toggle("active")
        }
    }   
});

function removeClassLists() {
    userMenu.classList.remove("active")
    configMenu.classList.remove("active")
};
