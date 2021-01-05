window.addEventListener('load', () => {

    // 金額を入力した数値をpriceInputという変数に格納する
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
  

  //販売手数料を表示する場所のidセレクタ
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor( inputValue / 10)

  //販売利益を表示する場所のidセレクタ
  const addProfitDom = document.getElementById("profit");
  addProfitDom.innerHTML = Math.floor( inputValue * 0.9)


  })
})