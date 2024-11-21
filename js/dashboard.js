const fullscrenBtn = document.getElementById("expand-button")
const sideBar = document.getElementById("sidebar-buttons")
const botao = document.getElementById("settings-menu")
const appPage = document.querySelector(".app-page")
let paddingApplied = false;
const sideBarMenu = document.querySelector(".sidebar-menu-body")

botao.addEventListener("click", () => {
    sideBarMenu.classList.toggle("showing")
    if (paddingApplied) {
        appPage.style.paddingLeft = "0px";
    } else {
        appPage.style.paddingLeft = "250px";
    }
    paddingApplied = !paddingApplied
})

fullscrenBtn.addEventListener("click", () => {
    if (document.fullscreenElement) {
        document.exitFullscreen()
    } else {
        document.documentElement.requestFullscreen()
    }
})





const sidebar = document.querySelector(".barra-lateral")
const item = document.querySelector(".itens")
const texto = document.querySelectorAll(".item-texto")
const botaoSidebar = document.querySelector(".btn-alternar")
const menu = document.querySelector(".menu")

botaoSidebar.addEventListener('click', ()=> {
    menu.classList.toggle('l')
    sidebar.classList.toggle('active');
    item.classList.toggle('active');
    texto.forEach(element => {
        element.classList.toggle('active');
    });
    botaoSidebar.classList.toggle('active');
})
