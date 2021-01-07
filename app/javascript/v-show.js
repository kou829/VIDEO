window.addEventListener('load', () => {
  const commentDisplayBtn = document.getElementById("overview-service")
  const commentDisplay = document.getElementById("comment_main")
  var click_sum = 0;
  commentDisplayBtn.addEventListener('click', () => {
    click_total = click_sum++;
    if( ( click_total % 2 ) != 0 )
      commentDisplay.style.display = "inline";
    else{
      commentDisplay.style.display = "none";
    }; 
  });
});