window.addEventListener('load', () => {
  const videoBtnChangeColor = document.getElementById("video_btn");
  videoBtnChangeColor.addEventListener("mouseover",() => {
    videoBtnChangeColor.style.backgroundColor = "#6196ac";
  });
  videoBtnChangeColor.addEventListener("mouseout",() => {
    videoBtnChangeColor.style.backgroundColor = "#ffffff";
  });
});