
window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    // 販売手数料の計算 (10%)
    const addTax = Math.floor(inputValue * 0.1);
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = `${addTax}`;

    // 販売利益の計算
    const profit = inputValue - addTax;
    const profitDom = document.getElementById("profit");
    profitDom.innerHTML = `${profit}`;
  });
});