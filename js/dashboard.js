const fullscrenBtn = document.getElementById("expand-button")
const sideBar = document.getElementById("sidebar-buttons")
const appPage = document.querySelector(".app-page")
const sideBarMenu = document.querySelector(".sidebar-menu-body")
const tabButtons = document.querySelectorAll(".tab-button")
const active = document.querySelector(".active")
let paddingApplied = false;

sideBar.addEventListener("click", (event) => {
    const button = event.target.closest(".sidebar-button");
    const buttons = document.querySelectorAll(".sidebar-button")

    // buttons.forEach(appPage.classList.remove("showing"))

    if (button.id === "profile-menu" || button.id === "help-menu" || button.id === "settings-menu") {
        sideBarMenu.classList.add("showing")
        if (paddingApplied) {
            appPage.style.paddingLeft = "0px";
        } else {
            appPage.style.paddingLeft = "250px";
        }
        paddingApplied = !paddingApplied
    }
})

tabButtons.forEach(button => {
    button.addEventListener("click", (event) => {
        if (event.target.id === "buyNSell") {
            active.style.left = "3%"
        } else if (event.target.id === "extra1") {
            active.style.left = "35%"
        } else if (event.target.id === "extra2") {
            active.style.left = "67%"
        }
    })
})

fullscrenBtn.addEventListener("click", () => {
    if (document.fullscreenElement) {
        document.exitFullscreen()
    } else {
        document.documentElement.requestFullscreen()
    }
})