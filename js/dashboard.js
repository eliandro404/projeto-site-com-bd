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
