


function comBtn1() {
    // location.href='/vegan/community/community.do';
    $('.filterResult > .feedConatiner').empty();
    $('.searchResult > .feedConatiner').empty();
    
    $('.allRecipe').show();
    $('.allVegan').show();
    
    let recipe = document.querySelectorAll(".recipe");
    for (var i = 0; i < recipe.length; i++) {
        recipe[i].style.display = "block";
    }
    let veganLife = document.querySelectorAll(".veganLife");
    for (var i = 0; i < veganLife.length; i++) {
        veganLife[i].style.display = "block";
    }
}

function comBtn2() {
    // location.href='/vegan/community/recipeMore.do';
    
     $('.filterResult > .feedConatiner').empty();
    $('.searchResult > .feedConatiner').empty();
  
  	let recipe = document.querySelectorAll(".recipe");
    for (var i = 0; i < recipe.length; i++) {
        recipe[i].style.display = "block";
    }
    let veganLife = document.querySelectorAll(".veganLife");
    for (var i = 0; i < veganLife.length; i++) {
        veganLife[i].style.display = "none";
    }
}

function comBtn3() {
    // location.href='/vegan/community/veganLifeMore.do';
    
     $('.filterResult > .feedConatiner').empty();
    $('.searchResult > .feedConatiner').empty();
 
 	 let recipe = document.querySelectorAll(".recipe");
    for (var i = 0; i < recipe.length; i++) {
        recipe[i].style.display = "none";
    }
    let veganLife = document.querySelectorAll(".veganLife");
    for (var i = 0; i < veganLife.length; i++) {
        veganLife[i].style.display = "block";
    }
}

function cantWrite() {
	alert('로그인 후 작성 가능합니다.');
	location.href='/vegan/member/login';
}