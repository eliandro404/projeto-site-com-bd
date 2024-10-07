const sidebar = document.querySelector(".barra-lateral")
const item = document.querySelector(".itens")
const texto = document.querySelectorAll(".item-texto")
const botaoSidebar = document.querySelector(".btn-alternar")

botaoSidebar.addEventListener('click', ()=> {
    sidebar.classList.toggle('active');
    item.classList.toggle('active');
    texto.forEach(element => {
        element.classList.toggle('active');
    });
    botaoSidebar.classList.toggle('active');
})