function calc (){
  const itemPrice  = document.getElementById("item-price");
  itemPrice.addEventListener("input", () => {
    const tax = Math.floor(itemPrice.value * 0.1)
    const profit = itemPrice.value - tax
    const addTaxPrice  = document.getElementById("add-tax-price");
    const profitElement  = document.getElementById("profit");
    addTaxPrice.innerHTML = `${tax}`;
    profitElement.innerHTML = `${profit}`;
  });
};

window.addEventListener('load', calc);
