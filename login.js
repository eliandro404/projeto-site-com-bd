const wrapper = document.querySelector(".wrapper-login-registro")
const loginLink = document.querySelector(".login-link")
const registerLink = document.querySelector(".register-link")
const botaoLogin = document.querySelector(".botao-login")

const allBtns = document.querySelectorAll(".indicator")

const bannerBtn1 = document.getElementById("btn1")
const bannerBtn2 = document.getElementById("btn2")
const bannerBtn3 = document.getElementById("btn3")

const carrossel = document.querySelector(".slides")

registerLink.addEventListener('click', ()=> {
    wrapper.classList.add('active');
})

loginLink.addEventListener('click', ()=> {
    wrapper.classList.remove('active');
})

botaoLogin.addEventListener('click', ()=> {
    wrapper.classList.toggle('active-login-popup')
})

function removeAllIndicator() {
    allBtns.forEach(element => {
        element.classList.remove('active');
    });
}

function cancelarTimeout() {
    if (timeoutId) {
        clearTimeout(timeoutId);
        console.log('timeout cancelado')
    }
}

function firstIndicator(){
    removeAllIndicator();
    bannerBtn1.classList.add('active');
    carrossel.style.transform = 'translateX(0%)'
    timeoutId = setTimeout(() => {
        secondIndicator()
    }, 5000);
}

function secondIndicator() {
    removeAllIndicator();
    bannerBtn2.classList.add('active');
    carrossel.style.transform = 'translateX(-100%)'
    timeoutId = setTimeout(() => {
        thirdIndicator()
    }, 5000);
}

function thirdIndicator() {
    removeAllIndicator();
    carrossel.style.transform = 'translateX(-200%)'
    bannerBtn3.classList.add('active');
    timeoutId = setTimeout(() => {
        firstIndicator()
    }, 5000);
}

setTimeout(firstIndicator, 500)

bannerBtn1.addEventListener('click', ()=> {
    cancelarTimeout();
    firstIndicator();
})

bannerBtn2.addEventListener('click', ()=> {
    cancelarTimeout();
    secondIndicator();
})

bannerBtn3.addEventListener('click', ()=> {
    cancelarTimeout();
    thirdIndicator();
})

// ---------------------------- à fazer -------------------------------------------

// ao clicar em um botão em andamento e só finaliza e para o ciclo

// usar escalas em porcentagem tá dando bo com o zoom :/
// tentar deixar tudo fixo na proporção visual? funciona?