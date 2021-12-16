'use strict';

let fitlerPopup = document.querySelector('.filterPopup');
let fitlerLabel = document.querySelector('.filterLabel');
let filterIcon = document.querySelector('.filterIcon');

fitlerLabel.addEventListener('click', function () {
    fitlerPopup.classList.toggle('hidden');
    fitlerLabel.classList.toggle('filterLabelPink');
    filterIcon.classList.toggle('filterIconPink');

    if (filterIcon.getAttribute('src') === 'images/filter.svg') {
        filterIcon.setAttribute('src', 'images/filterHover.svg')
    } else {
        filterIcon.setAttribute('src', 'images/filter.svg')
    }
});

let filterHeaders = document.querySelectorAll('.filterCategoryHeader');
filterHeaders.forEach(function (header) {
    header.addEventListener('click', function (event) {
        event.target.nextElementSibling.classList.toggle('hidden');
    })
});

let filterSizes = document.querySelector('.filterSizes');
let filterSizeWrap = document.querySelector('.filterSizeWrap');
filterSizeWrap.addEventListener('click', function () {
    filterSizes.classList.toggle('hidden');
});

//иконка корзины
const cartIcon = document.querySelector('.cartIcon');
//индикатор товаров в корзине
const cartCount = document.querySelector('.cartIconWrap').lastElementChild;
cartCount.innerText = 0;
//товары
const featuredItems = document.querySelector('.featuredItems');
//корзина
const basket = document.querySelector('.basket');
//содержимое корзины
const basketDatail = document.querySelector('.basketDatail');

document.querySelector('.cartIconWrap').addEventListener('click',
    function (event) {
        basket.classList.toggle('hidden');
    });

class ProductItem {
    constructor(target) {
        if (target.nodeName === 'BUTTON') {
            this.btn = target;
            let targetParent = target.parentElement;
            let element = this.imgName = targetParent.previousElementSibling;
            this.imgName = element
                .getAttribute('src').replace('images/featured/', '')
                .replace('.jpg', '');
            element = targetParent.parentElement
                .nextElementSibling.firstElementChild;
            this.prodName = element.innerText;
            element = element.nextElementSibling;
            this.prodText = element.innerText;
            element = element.nextElementSibling;
            this.prodPrice = element.innerText;
        }
        else {
            this.btn = null;
            this.imgName = null;
            this.prodName = null;
            this.prodText = null;
            this.prodPrice = null;
        }
    }
}

/**
 * Класс "Корзина"
 */
class Cart {
    constructor() {
        this.cartMap = new Map();
        this.totalQty = 0;
        this.totalSum = 0;
    }

    /**
     * Подсчет общего кол-ва товаров и их сумма
     */
    getTotalCnt = function () {
        this.totalQty = 0;
        this.totalSum = 0;
        while (basketDatail.firstChild) {
            basketDatail.removeChild(basketDatail.firstChild);
        }

        for (var [key, value] of this.cartMap) {
            if (value !== undefined) {
                this.totalQty = this.totalQty + value[0];
                this.totalSum = this.totalSum +
                    this.addHtmlRow(basketDatail, value);
            }
        }
        return this.totalQty;
    };

    /**
    * Добавление HTML блока в подробности корзины
    */
    addHtmlRow = function (el, prod) {
        const price1 = +prod[3].replace('$', '');
        const sum1 = price1 * prod[0];
        el.insertAdjacentHTML('beforeend', `
        <div class="basketRow">
          <span>${prod[1]} ${prod[2]}</span>
          <span class="productCount">${prod[0]}</span> шт.
          <span>${prod[3]}</span>
          <span class="productTotalRow">${sum1.toFixed(2)}</span>
        </div>`);

        return sum1;
    };

    addProduct = function (prod) {
        const val = this.cartMap.get(prod.imgName);
        if (val === undefined) {
            this.cartMap.set(prod.imgName,
                [1, prod.imgName, prod.prodName, prod.prodPrice]);
        }
        else {
            this.cartMap.set(prod.imgName,
                [val[0] + 1, prod.imgName, prod.prodName, prod.prodPrice]);
        }

        cartCount.innerText = this.getTotalCnt();
        document.querySelector('.basketTotalValue').innerText = this.totalSum;
    };
}

const cart = new Cart();

featuredItems.addEventListener('click', function (event) {
    if (event.target.nodeName === 'BUTTON') {
        const pItem = new ProductItem(event.target);

        cart.addProduct(pItem);
    }

});

